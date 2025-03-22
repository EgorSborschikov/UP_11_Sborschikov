from sqlalchemy import create_engine
from config.config import DATABASE_ENGINE

database_engine = create_engine(DATABASE_ENGINE)