from fastapi import FastAPI
from .proxy import (
    forward_to_user_service,
    forward_to_order_service
)

app = FastAPI(title="API Gateway")


@app.get("/health")
def health():
    return {"status": "UP"}


@app.post("/users")
def create_user(user: dict):
    return forward_to_user_service("POST", "/users", user)


@app.get("/users")
def list_users():
    return forward_to_user_service("GET", "/users")


@app.post("/orders")
def create_order(order: dict):
    return forward_to_order_service("POST", "/orders", order)


@app.get("/orders")
def list_orders():
    return forward_to_order_service("GET", "/orders")

