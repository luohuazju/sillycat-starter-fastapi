from fastapi import FastAPI
from starter.starter_api import router


app = FastAPI()
app.include_router(router, prefix="/api/v1")
