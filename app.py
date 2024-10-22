from fastapi import FastAPI, Response
from fastapi.exceptions import RequestValidationError
import uvicorn
import os

app = FastAPI()


@app.get("/ping")
def ping():
    global first_run_flag
    status_code = 201 if first_run_flag else 200
    return Response("pong", status_code=status_code)


@app.get("/health")
async def health():
    return Response("pong")


if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8080)
