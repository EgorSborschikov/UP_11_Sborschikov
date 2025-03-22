from pydantic import BaseModel

class LoginResponse(BaseModel):
    employee_id: int
    full_name: str
    position: str
    branch_id: int
