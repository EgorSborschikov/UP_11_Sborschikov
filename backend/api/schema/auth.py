from pydantic import BaseModel


class Auth(BaseModel):
    login: str
    password: str