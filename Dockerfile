FROM python:3.12-alpine

WORKDIR /app

# 优先安装依赖，利用 Docker 镜像缓存
COPY requirements.txt ./
RUN apk update && apk --no-cache add openssl bash curl && \
    pip install --no-cache-dir -r requirements.txt

# 拷贝项目文件
COPY app.py index.html ./
RUN chmod +x app.py

EXPOSE 3001

CMD ["python3", "app.py"]
