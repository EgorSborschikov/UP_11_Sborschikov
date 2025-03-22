from io import BytesIO
from typing import List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from api.repository.crud import check_position, get_current_employee
from api.schema.employee_create import EmployeeCreate
from api.schema.login_respone import LoginResponse
from config.params import ROLES
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from fastapi.responses import StreamingResponse
from io import BytesIO
from entities.database import database_engine, get_db

from entities.entities import Auth, Base, Clients, Coupons, Employees, OnlineOrders, PatientByCoupon, PharmacyProducts

router = APIRouter()

@router.on_event("startup")
def startup():
    Base.metadata.create_all(bind = database_engine)


@router.post("/auth/login", response_model=LoginResponse)
async def login(employee: Employees = Depends(get_current_employee)):
    return {
        "employee_id": employee.IDEmployee,
        "full_name": f"{employee.Surname} {employee.Name} {employee.LastName}",
        "position": ROLES.get(employee.IDPosition, "unknown"),
        "branch_id": employee.IDBranch
    }

@router.post("/employees",
         dependencies=[Depends(check_position([1]))])
async def create_employee(
    employee_data: EmployeeCreate,
    db: Session = Depends(get_db)
):
    # Проверка уникальности логина
    if db.query(Auth).filter(Auth.Login == employee_data.login).first():
        raise HTTPException(status_code=400, detail="Login already exists")
    
    try:
        # Создаем запись в Auth
        new_auth = Auth(
            Login=employee_data.login,
            Password=employee_data.password
        )
        db.add(new_auth)
        db.commit()
        db.refresh(new_auth)

        # Создаем сотрудника
        new_employee = Employees(
            IDBranch=employee_data.id_branch,
            IDPosition=employee_data.id_position,
            IDAuth=new_auth.IDAuth,
            Surname=employee_data.surname,
            Name=employee_data.name,
            LastName=employee_data.lastname,
            PassportData=employee_data.passport_data,
            PhoneNumber=employee_data.phone_number,
            Email=employee_data.email
        )
        db.add(new_employee)
        db.commit()
        
        return {"message": "Employee created successfully"}
    
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/pharmacy-products")
async def get_products(
    skip: int = 0,
    limit: int = 10,
    db: Session = Depends(get_db)
):
    products = db.query(PharmacyProducts).offset(skip).limit(limit).all()
    return products

@router.post("/online-orders")
async def create_online_order(
    order_data: dict,
    db: Session = Depends(get_db)
):
    # Валидация данных клиента
    if not db.query(Clients).filter(Clients.Email == order_data["client_email"]).first():
        new_client = Clients(
            Surname=order_data["client_surname"],
            Name=order_data["client_name"],
            Email=order_data["client_email"]
        )
        db.add(new_client)
        db.commit()

    # Создание заказа
    new_order = OnlineOrders(
        IDClient=...,
        IDPharmacyProduct=...,
        IDPickupPoint=...
    )
    db.add(new_order)
    db.commit()
    
    return {"message": "Order created successfully"}

@router.post("/patient-coupons",
          dependencies=[Depends(check_position([2]))])
async def create_patient_coupon(
    coupon_data: dict,
    employee: Employees = Depends(get_current_employee),
    db: Session = Depends(get_db)
):
    # Проверка существования купона
    if not db.query(Coupons).filter(Coupons.IDCoupon == coupon_data["coupon_id"]).first():
        raise HTTPException(status_code=404, detail="Coupon not found")
    
    new_patient = PatientByCoupon(
        IDCoupon=coupon_data["coupon_id"],
        IDAnimalType=coupon_data["animal_type_id"],
        IDPharmacyProduct=coupon_data["product_id"],
        Complaints=coupon_data["complaints"]
    )
    db.add(new_patient)
    db.commit()
    
    return {"message": "Patient record created"}

@router.get("/reports/")
def generate_report(db: Session = Depends(get_db)):
    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=letter)
    text = "Report Content"
    c.drawString(100, 750, text)
    c.save()
    buffer.seek(0)
    return StreamingResponse(buffer, media_type="application/pdf")
