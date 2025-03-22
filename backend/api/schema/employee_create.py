from pydantic import BaseModel


class EmployeeCreate(BaseModel):
    surname: str
    name: str
    lastname: str
    passport_data: str
    phone_number: str
    email: str
    id_auth: int
    id_branch: int
    id_position: int