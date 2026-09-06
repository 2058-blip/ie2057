# 1. 使用官方 Python 3.12 精简版镜像（默认就是 root 权限）
FROM python:3.12-slim

# 2. 设置工作目录为 /app
WORKDIR /app

# 3. 复制依赖清单并安装（去掉了 --user 参数，直接装到系统目录）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. 复制你的所有代码到 /app 目录
COPY . .

# 5. 暴露 5000 端口
EXPOSE 5000

# 6. 启动命令（请确保 app.py 是你真实的启动文件名）
CMD ["python", "app.py"]
