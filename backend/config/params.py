from fastapi.security import HTTPBasic

security = HTTPBasic()

ROLES = {
    1: "admin",
    2: "veterinarian",
    3: "cashier",
    4: "client"
}