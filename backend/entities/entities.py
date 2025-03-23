from typing import Any, List, Optional

from sqlalchemy import (
    Boolean,
    CHAR,
    ForeignKeyConstraint,
    Integer,
    PrimaryKeyConstraint,
    Sequence,
    String,
)
from sqlalchemy.dialects.postgresql import MONEY
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class AnimalType(Base):
    __tablename__ = "animal_type"
    __table_args__ = (PrimaryKeyConstraint("IDAnimalType", name="animal_type_pkey"),)

    IDAnimalType: Mapped[int] = mapped_column(Integer, primary_key=True)
    Type: Mapped[str] = mapped_column(String(30))

    patient_by_coupon: Mapped[List["PatientByCoupon"]] = relationship(
        "PatientByCoupon", back_populates="animal_type"
    )


class Auth(Base):
    __tablename__ = "auth"
    __table_args__ = (PrimaryKeyConstraint("IDAuth", name="auth_pkey"),)

    IDAuth: Mapped[int] = mapped_column(Integer, primary_key=True)
    Login: Mapped[str] = mapped_column(String(100))
    Password: Mapped[str] = mapped_column(String(100))

    employees: Mapped[List["Employees"]] = relationship(
        "Employees", back_populates="auth"
    )


class Cities(Base):
    __tablename__ = "cities"
    __table_args__ = (PrimaryKeyConstraint("IDCity", name="cities_pkey"),)

    IDCity: Mapped[int] = mapped_column(Integer, primary_key=True)
    Name: Mapped[str] = mapped_column(String(50))

    branches: Mapped[List["Branches"]] = relationship(
        "Branches", back_populates="cities"
    )
    pickup_points: Mapped[List["PickupPoints"]] = relationship(
        "PickupPoints", back_populates="cities"
    )


class Clients(Base):
    __tablename__ = "clients"
    __table_args__ = (PrimaryKeyConstraint("IDClient", name="clinets_pkey"),)

    IDClient: Mapped[int] = mapped_column(
        Integer, Sequence("clinets_IDClient_seq"), primary_key=True
    )
    Surname: Mapped[str] = mapped_column(String(30))
    Name: Mapped[str] = mapped_column(String(35))
    Lastname: Mapped[str] = mapped_column(String(40))
    Email: Mapped[str] = mapped_column(String(100))

    online_orders: Mapped[List["OnlineOrders"]] = relationship(
        "OnlineOrders", back_populates="clients"
    )
    coupons: Mapped[List["Coupons"]] = relationship("Coupons", back_populates="clients")
    sale_of_pharmacy_products: Mapped[List["SaleOfPharmacyProducts"]] = relationship(
        "SaleOfPharmacyProducts", back_populates="clients"
    )


class PaymentsMethods(Base):
    __tablename__ = "payments_methods"
    __table_args__ = (
        PrimaryKeyConstraint("IDPaymentMethod", name="payments_methods_pkey"),
    )

    IDPaymentMethod: Mapped[int] = mapped_column(Integer, primary_key=True)
    Method: Mapped[str] = mapped_column(CHAR(50))

    payments: Mapped[List["Payments"]] = relationship(
        "Payments", back_populates="payments_methods"
    )


class PharmacyProducts(Base):
    __tablename__ = "pharmacy_products"
    __table_args__ = (
        PrimaryKeyConstraint("IDPharmacyProduct", name="pharmacy_products_pkey"),
    )

    IDPharmacyProduct: Mapped[int] = mapped_column(Integer, primary_key=True)
    ProductName: Mapped[str] = mapped_column(CHAR(50))
    Price: Mapped[Any] = mapped_column(MONEY)

    online_orders: Mapped[List["OnlineOrders"]] = relationship(
        "OnlineOrders", back_populates="pharmacy_products"
    )
    sale_of_pharmacy_products: Mapped[List["SaleOfPharmacyProducts"]] = relationship(
        "SaleOfPharmacyProducts", back_populates="pharmacy_products"
    )
    patient_by_coupon: Mapped[List["PatientByCoupon"]] = relationship(
        "PatientByCoupon", back_populates="pharmacy_products"
    )


class Positions(Base):
    __tablename__ = "positions"
    __table_args__ = (PrimaryKeyConstraint("IDPosition", name="positions_pkey"),)

    IDPosition: Mapped[int] = mapped_column(Integer, primary_key=True)
    PositionName: Mapped[str] = mapped_column(String(50))

    employees: Mapped[List["Employees"]] = relationship(
        "Employees", back_populates="positions"
    )


class Branches(Base):
    __tablename__ = "branches"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDCity"], ["cities.IDCity"], name="branches_IDCity_fkey"
        ),
        PrimaryKeyConstraint("IDBranch", name="branches_pkey"),
    )

    IDBranch: Mapped[int] = mapped_column(
        Integer, Sequence("branches_IDBrabch_seq"), primary_key=True
    )
    IDCity: Mapped[int] = mapped_column(Integer)
    BranchName: Mapped[str] = mapped_column(String(50))
    Address: Mapped[str] = mapped_column(String(50))

    cities: Mapped["Cities"] = relationship("Cities", back_populates="branches")
    employees: Mapped[List["Employees"]] = relationship(
        "Employees", back_populates="branches"
    )


class PickupPoints(Base):
    __tablename__ = "pickup_points"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDCity"], ["cities.IDCity"], name="pickup_points_IDCity_fkey"
        ),
        PrimaryKeyConstraint("IDPickupPoints", name="pickup_points_pkey"),
    )

    IDPickupPoints: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDCity: Mapped[int] = mapped_column(Integer)

    cities: Mapped["Cities"] = relationship("Cities", back_populates="pickup_points")
    online_orders: Mapped[List["OnlineOrders"]] = relationship(
        "OnlineOrders", back_populates="pickup_points"
    )


class Employees(Base):
    __tablename__ = "employees"
    __table_args__ = (
        ForeignKeyConstraint(["IDAuth"], ["auth.IDAuth"], name="employees_IDAuth_fkey"),
        ForeignKeyConstraint(
            ["IDBranch"], ["branches.IDBranch"], name="employees_IDBranch_fkey"
        ),
        ForeignKeyConstraint(
            ["IDPosition"], ["positions.IDPosition"], name="employees_IDPosition_fkey"
        ),
        PrimaryKeyConstraint("IDEmployee", name="employees_pkey"),
    )

    IDEmployee: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDBranch: Mapped[int] = mapped_column(Integer)
    IDPosition: Mapped[int] = mapped_column(Integer)
    IDAuth: Mapped[int] = mapped_column(Integer)
    Surname: Mapped[str] = mapped_column(String(25))
    Name: Mapped[str] = mapped_column(String(30))
    LastName: Mapped[str] = mapped_column(String(35))
    PassportData: Mapped[str] = mapped_column(String(20))
    PhoneNumber: Mapped[str] = mapped_column(String(20))
    Email: Mapped[str] = mapped_column(String(100))

    auth: Mapped["Auth"] = relationship("Auth", back_populates="employees")
    branches: Mapped["Branches"] = relationship("Branches", back_populates="employees")
    positions: Mapped["Positions"] = relationship(
        "Positions", back_populates="employees"
    )
    coupons: Mapped[List["Coupons"]] = relationship(
        "Coupons", back_populates="employees"
    )
    salaries: Mapped[List["Salaries"]] = relationship(
        "Salaries", back_populates="employees"
    )
    sale_of_pharmacy_products: Mapped[List["SaleOfPharmacyProducts"]] = relationship(
        "SaleOfPharmacyProducts", back_populates="employees"
    )


class OnlineOrders(Base):
    __tablename__ = "online_orders"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDClient"], ["clients.IDClient"], name="online_orders_IDClient_fkey"
        ),
        ForeignKeyConstraint(
            ["IDPharmacyProduct"],
            ["pharmacy_products.IDPharmacyProduct"],
            name="online_orders_IDPharmacyProduct_fkey",
        ),
        ForeignKeyConstraint(
            ["IDPickupPoint"],
            ["pickup_points.IDPickupPoints"],
            name="online_orders_IDPickupPoint_fkey",
        ),
        PrimaryKeyConstraint("IDOnlineOrder", name="online_orders_pkey"),
    )

    IDOnlineOrder: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDClient: Mapped[int] = mapped_column(Integer)
    IDPharmacyProduct: Mapped[int] = mapped_column(Integer)
    IDPickupPoint: Mapped[int] = mapped_column(Integer)

    clients: Mapped["Clients"] = relationship("Clients", back_populates="online_orders")
    pharmacy_products: Mapped["PharmacyProducts"] = relationship(
        "PharmacyProducts", back_populates="online_orders"
    )
    pickup_points: Mapped["PickupPoints"] = relationship(
        "PickupPoints", back_populates="online_orders"
    )


class Coupons(Base):
    __tablename__ = "coupons"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDClients"], ["clients.IDClient"], name="coupons_IDClients_fkey"
        ),
        ForeignKeyConstraint(
            ["IDEmployee"], ["employees.IDEmployee"], name="coupons_IDEmployee_fkey"
        ),
        PrimaryKeyConstraint("IDCoupon", name="coupons_pkey"),
    )

    IDCoupon: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDClients: Mapped[int] = mapped_column(Integer)
    IDEmployee: Mapped[int] = mapped_column(Integer)

    clients: Mapped["Clients"] = relationship("Clients", back_populates="coupons")
    employees: Mapped["Employees"] = relationship("Employees", back_populates="coupons")
    patient_by_coupon: Mapped[List["PatientByCoupon"]] = relationship(
        "PatientByCoupon", back_populates="coupons"
    )


class Salaries(Base):
    __tablename__ = "salaries"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDEmployee"], ["employees.IDEmployee"], name="salaries_IDEmployee_fkey"
        ),
        PrimaryKeyConstraint("IDSalaries", name="salaries_pkey"),
    )

    IDSalaries: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDEmployee: Mapped[int] = mapped_column(Integer)
    Salaries: Mapped[Any] = mapped_column(MONEY)

    employees: Mapped["Employees"] = relationship(
        "Employees", back_populates="salaries"
    )


class SaleOfPharmacyProducts(Base):
    __tablename__ = "sale_of_pharmacy_products"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDClient"],
            ["clients.IDClient"],
            name="sale_of_pharmacy_products_IDClient_fkey",
        ),
        ForeignKeyConstraint(
            ["IDEmployee"],
            ["employees.IDEmployee"],
            name="sale_of_pharmacy_products_IDEmployee_fkey",
        ),
        ForeignKeyConstraint(
            ["IDPharmacyProduct"],
            ["pharmacy_products.IDPharmacyProduct"],
            name="sale_of_pharmacy_products_IDPharmacyProduct_fkey",
        ),
        PrimaryKeyConstraint("IDSale", name="sale_of_pharmacy_products_pkey"),
    )

    IDSale: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDEmployee: Mapped[int] = mapped_column(Integer)
    IDClient: Mapped[int] = mapped_column(Integer)
    IDPharmacyProduct: Mapped[int] = mapped_column(Integer)

    clients: Mapped["Clients"] = relationship(
        "Clients", back_populates="sale_of_pharmacy_products"
    )
    employees: Mapped["Employees"] = relationship(
        "Employees", back_populates="sale_of_pharmacy_products"
    )
    pharmacy_products: Mapped["PharmacyProducts"] = relationship(
        "PharmacyProducts", back_populates="sale_of_pharmacy_products"
    )


class PatientByCoupon(Base):
    __tablename__ = "patient_by_coupon"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDAnimalType"],
            ["animal_type.IDAnimalType"],
            name="patient_by_coupon_IDAnimalType_fkey",
        ),
        ForeignKeyConstraint(
            ["IDCoupon"], ["coupons.IDCoupon"], name="patient_by_coupon_IDCoupon_fkey"
        ),
        ForeignKeyConstraint(
            ["IDPharmacyProduct"],
            ["pharmacy_products.IDPharmacyProduct"],
            name="patient_by_coupon_IDPharmacyProduct_fkey",
        ),
        PrimaryKeyConstraint("IDReception", name="patient_by_coupon_pkey"),
    )

    IDReception: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDCoupon: Mapped[int] = mapped_column(Integer)
    IDAnimalType: Mapped[int] = mapped_column(Integer)
    IDPharmacyProduct: Mapped[int] = mapped_column(Integer)
    RegularInspection: Mapped[bool] = mapped_column(Boolean)
    Complaints: Mapped[str] = mapped_column(String(255))
    Custody: Mapped[str] = mapped_column(String(500))
    Conclusions: Mapped[Optional[str]] = mapped_column(String(500))

    animal_type: Mapped["AnimalType"] = relationship(
        "AnimalType", back_populates="patient_by_coupon"
    )
    coupons: Mapped["Coupons"] = relationship(
        "Coupons", back_populates="patient_by_coupon"
    )
    pharmacy_products: Mapped["PharmacyProducts"] = relationship(
        "PharmacyProducts", back_populates="patient_by_coupon"
    )
    payments: Mapped[List["Payments"]] = relationship(
        "Payments", back_populates="patient_by_coupon"
    )


class Payments(Base):
    __tablename__ = "payments"
    __table_args__ = (
        ForeignKeyConstraint(
            ["IDPaymentMethod"],
            ["payments_methods.IDPaymentMethod"],
            name="payments_IDPaymentMethod_fkey",
        ),
        ForeignKeyConstraint(
            ["IDReception"],
            ["patient_by_coupon.IDReception"],
            name="payments_IDReception_fkey",
        ),
        PrimaryKeyConstraint("IDPayment", name="payments_pkey"),
    )

    IDPayment: Mapped[int] = mapped_column(Integer, primary_key=True)
    IDReception: Mapped[int] = mapped_column(Integer)
    IDPaymentMethod: Mapped[int] = mapped_column(Integer)
    Price: Mapped[Any] = mapped_column(MONEY)

    payments_methods: Mapped["PaymentsMethods"] = relationship(
        "PaymentsMethods", back_populates="payments"
    )
    patient_by_coupon: Mapped["PatientByCoupon"] = relationship(
        "PatientByCoupon", back_populates="payments"
    )
