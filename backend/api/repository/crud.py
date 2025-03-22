from typing import Annotated
from fastapi import Depends, HTTPException
from fastapi import security
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from entities.database import get_db
from entities.entities import Auth, Employees
from sqlalchemy.orm import Session

security = HTTPBasic()

def get_current_employee(
    credentials: Annotated[HTTPBasicCredentials, Depends(security)],
    db: Session = Depends(get_db)
) -> Employees:
    auth = db.query(Auth).filter(
        Auth.Login == credentials.username,
        Auth.Password == credentials.password
    ).first()
    
    if not auth:
        raise HTTPException(
            status_code=401,
            detail="Invalid credentials",
            headers={"WWW-Authenticate": "Basic"},
        )
    
    employee = db.query(Employees).filter(
        Employees.IDAuth == auth.IDAuth
    ).first()
    
    if not employee:
        raise HTTPException(
            status_code=404,
            detail="Employee not found"
        )
        
    return employee

def check_position(required_positions: list[int]):
    def position_checker(employee: Employees = Depends(get_current_employee)):
        if employee.IDPosition not in required_positions:
            raise HTTPException(
                status_code=403,
                detail="Insufficient permissions"
            )
        return employee
    return position_checker