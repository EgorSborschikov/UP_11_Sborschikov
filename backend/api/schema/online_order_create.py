from pydantic import BaseModel

class OnlineOrderCreate(BaseModel):
    id_client: int
    id_pharmacy_product: int
    id_pickup_point: int