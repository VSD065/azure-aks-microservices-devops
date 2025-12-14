from pydantic import BaseModel
from typing import Optional


class Order(BaseModel):
    id: Optional[str] = None
    user_id: str
    product: str
    quantity: int

