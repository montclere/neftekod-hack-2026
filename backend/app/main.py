from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

app = FastAPI(title="API")
app.add_middleware(
    CORSMiddleware, allow_origins=["*"],
    allow_methods=["*"], allow_headers=["*"],
)


# Пример типизированного роута: показывает, как схема Pydantic доезжает
# до фронта через `make types`. Удалить, когда появятся настоящие схемы
# в app/schemas.py.
class Ticket(BaseModel):
    id: int
    title: str
    is_duplicate: bool


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/tickets")
def list_tickets() -> list[Ticket]:
    return []