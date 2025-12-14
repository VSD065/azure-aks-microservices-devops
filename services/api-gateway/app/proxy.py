import requests
import os

USER_SERVICE_URL = os.getenv("USER_SERVICE_URL", "http://localhost:8001")
ORDER_SERVICE_URL = os.getenv("ORDER_SERVICE_URL", "http://localhost:8002")


def forward_to_user_service(method: str, path: str, json=None):
    url = f"{USER_SERVICE_URL}{path}"
    response = requests.request(method, url, json=json)
    return response.json()


def forward_to_order_service(method: str, path: str, json=None):
    url = f"{ORDER_SERVICE_URL}{path}"
    response = requests.request(method, url, json=json)
    return response.json()

