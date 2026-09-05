FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:PATH
RUN addgroup -S app && adduser -S app -G app
USER app
EXPOSE 5000
CMD ["flask run","main:app","--host","0.0.0.0","--port","5000"]
