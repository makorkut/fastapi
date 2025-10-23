# FastAPI Coolify Starter

Minimal FastAPI app ready to deploy on Coolify with Dockerfile.

## Run locally
```bash
python -m venv .venv && source .venv/bin/activate  # on Windows: .venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```
Visit: http://127.0.0.1:8000 (docs at /docs)

## Docker
```bash
docker build -t fastapi-coolify-starter .
docker run -p 8000:8000 fastapi-coolify-starter
```
