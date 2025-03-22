from io import BytesIO
from typing import List
from fastapi import APIRouter, Depends, HTTPException
from api.repository.crud import login
from api.schema.auth import Auth
from api.schema.employee_create import EmployeeCreate
from api.schema.online_order_create import OnlineOrderCreate
from entities.database import database_engine
from sqlalchemy.orm import sessionmaker, Session
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from fastapi.responses import StreamingResponse
from io import BytesIO

from entities.entities import Base, Employees, OnlineOrders, PharmacyProducts

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=database_engine)
db = SessionLocal()


router = APIRouter()

@router.on_event("startup")
def startup():
    Base.metadata.create_all(bind = database_engine)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/auth")
async def auth(auth: Auth, db: Session = Depends(get_db)):  # type: ignore
    auth = db.query(Auth).filter(auth.Login == auth.login, auth.Password == auth.password).first()
    if not auth:
        raise HTTPException(
            status_code= 404,
            detail="Incorrect login or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    else:
        return login(auth, db)
    
@router.post("/employees/", response_model=EmployeeCreate)
def create_employee(employee: EmployeeCreate, db: Session = Depends(get_db)):
    db_employee = Employees(
        Surname=employee.surname,
        Name=employee.name,
        LastName=employee.lastname,
        PassportData=employee.passport_data,
        PhoneNumber=employee.phone_number,
        Email=employee.email,
        IDAuth=employee.id_auth,
        IDBranch=employee.id_branch,
        IDPosition=employee.id_position
    )
    db.add(db_employee)
    db.commit()
    db.refresh(db_employee)
    return db_employee

@router.get("/pharmacy_products/", response_model=List[PharmacyProducts])
def read_pharmacy_products(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    products = db.query(PharmacyProducts).offset(skip).limit(limit).all()
    return products

@router.post("/online_orders/", response_model=OnlineOrderCreate)
def create_online_order(order: OnlineOrderCreate, db: Session = Depends(get_db)):
    db_order = OnlineOrders(
        IDClient=order.id_client,
        IDPharmacyProduct=order.id_pharmacy_product,
        IDPickupPoint=order.id_pickup_point
    )
    db.add(db_order)
    db.commit()
    db.refresh(db_order)
    return db_order

@router.get("/employees/{employee_id}", response_model=Employees)
def read_employee(employee_id: int, db: Session = Depends(get_db)):
    employee = db.query(Employees).filter(Employees.IDEmployee == employee_id).first()
    if employee is None:
        raise HTTPException(status_code=404, detail="Employee not found")
    return employee

@router.get("/reports/")
def generate_report(db: Session = Depends(get_db)):
    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=letter)
    text = "Report Content"
    c.drawString(100, 750, text)
    c.save()
    buffer.seek(0)
    return StreamingResponse(buffer, media_type="application/pdf")