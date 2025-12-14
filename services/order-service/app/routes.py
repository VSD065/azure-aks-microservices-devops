from fastapi import APIRouter
from .models import Order
import uuid

router = APIRouter()

orders_db: dict[str, Order] = {}


@router.post("/orders", response_model=Order)
def create_order(order: Order):
    order_id = str(uuid.uuid4())
    order.id = order_id
    orders_db[order_id] = order
    return order


@router.get("/orders", response_model=list[Order])
def list_orders():
    return list(orders_db.values())


@router.get("/orders/user/{user_id}", response_model=list[Order])
def orders_by_user(user_id: str):
    return [o for o in orders_db.values() if o.user_id == user_id]

