from pydantic import BaseModel
from typing import Any, List

class FactInput(BaseModel):
    fact_id: str
    value: Any

class BulkFactsRequest(BaseModel):
    facts: List[FactInput]
