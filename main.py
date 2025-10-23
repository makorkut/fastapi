from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="FastAPI Coolify Starter")

class Echo(BaseModel):
    message: str

@app.get("/healthz")
async def healthz():
    return {"status": "ok"}

@app.get("/")
async def root():
    return {"hello": "world"}

@app.post("/echo")
async def echo(payload: Echo):
    return {"you_said": payload.message}
