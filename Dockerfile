# FastAPI production-ready Dockerfile for Coolify
FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1


WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt



EXPOSE 8000
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]

