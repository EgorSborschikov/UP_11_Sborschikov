from fastapi import HTTPException
from api.routes.routes import Session
from api.schema.auth import Auth


def login(auth: Auth, db: Session):
    db_user = (
        db.query(Auth)
        .filter(Auth.email == auth.email, Auth.password == auth.password)
        .first()
    )
    if db_user:
        return {"message": "Login successful", "user_id": db_user.id}
    raise HTTPException(status_code=401, detail="Invalid credentials")