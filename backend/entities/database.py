from sqlalchemy import create_engine
from config.config import DATABASE_ENGINE
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base

database_engine = create_engine(DATABASE_ENGINE)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=database_engine)
db = SessionLocal()

Base = declarative_base()

# Функция для получения сессии БД
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()