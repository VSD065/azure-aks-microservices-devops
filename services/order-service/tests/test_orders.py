from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_create_order():
    response = client.post(
        "/orders",
        json={
            "user_id": "123",
            "product": "Laptop",
            "quantity": 1
        }
    )
    assert response.status_code == 200
    assert response.json()["product"] == "Laptop"


def test_list_orders():
    response = client.get("/orders")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

