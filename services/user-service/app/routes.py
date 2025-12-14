from fastapi import APIRouter, HTTPException
from .models import User
import uuid

router = APIRouter()

# In-memory storage (demo purpose only)
users_db: dict[str, User] = {}


@router.post("/users", response_model=User)
def create_user(user: User):
    user_id = str(uuid.uuid4())
    user.id = user_id
    users_db[user_id] = user
    return user


@router.get("/users", response_model=list[User])
def list_users():
    return list(users_db.values())


@router.get("/users/{user_id}", response_model=User)
def get_user(user_id: str):
    user = users_db.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user

