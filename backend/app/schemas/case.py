from pydantic import BaseModel, Field
from typing import Any, Optional

class CaseCreateRequest(BaseModel):
    complaint_text: str = Field(..., min_length=5)

class CaseCreateResponse(BaseModel):
    case_id: str

class CaseAddFactRequest(BaseModel):
    fact_id: str
    value: Any
    source: Optional[str] = "USER"

class ReasonRequest(BaseModel):
    case_id: str
