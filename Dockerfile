FROM python:3.12-alpine

WORKDIR /app

# 拷贝依赖并安装
COPY requirements.txt ./
RUN apk update && apk --no-cache add openssl bash curl && \
    pip install --no-cache-dir -r requirements.txt

# 拷贝项目文件
COPY app.py index.html ./

# 【关键】赋予 /app 目录全部读写执行权限，并确保 app.py 可执行
RUN chmod -R 777 /app

EXPOSE 3001

CMD ["python3", "app.py"]
