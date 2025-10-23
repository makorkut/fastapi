        # FastAPI production-ready Dockerfile for Coolify
        FROM python:3.12-slim

        ENV PYTHONDONTWRITEBYTECODE=1             PYTHONUNBUFFERED=1             PIP_NO_CACHE_DIR=1

        # Install minimal system deps (optional: build tools if you add deps that need compile)
        RUN apt-get update && apt-get install -y --no-install-recommends             curl ca-certificates &&             rm -rf /var/lib/apt/lists/*

        WORKDIR /app
        COPY requirements.txt .
        RUN pip install -r requirements.txt

        COPY app ./app

        # Healthcheck (Coolify will also use this to decide readiness)
        HEALTHCHECK --interval=30s --timeout=3s           CMD python - <<'PY'
import urllib.request, sys
try:
    urllib.request.urlopen('http://127.0.0.1:8000/healthz', timeout=2)
except Exception:
    sys.exit(1)
PY

        EXPOSE 8000

        # Start server
        CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
