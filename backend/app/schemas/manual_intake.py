from pydantic import BaseModel, Field
from typing import Any, Dict, List, Optional

class ManualIntakeRequest(BaseModel):
    complaint_text: Optional[str] = ""
    facts: List[Dict[str, Any]] = Field(default_factory=list)   

class ManualIntakeResponse(BaseModel):
    case_id: str
    extracted_facts: List[Dict[str, Any]] = Field(default_factory=list)
    missing_questions: List[Dict[str, Any]] = Field(default_factory=list)
    reasoning_result: Dict[str, Any] = Field(default_factory=dict)
    user_summary: Dict[str, Any] = Field(default_factory=dict)
