from pydantic import BaseModel
from typing import Any, Dict, List, Optional


class ComplaintIntakeRequest(BaseModel):
    complaint_text: str
    top_k_questions: int = 6


class ComplaintIntakeResponse(BaseModel):
    is_valid_complaint: bool
    validity_reason: str
    case_id: Optional[str] = None

    extracted_facts: List[Dict[str, Any]] = []
    missing_questions: List[Dict[str, Any]] = []
    reasoning_result: Dict[str, Any] = {}

    # UI-friendly summary output (frontend should use this)
    user_summary: Dict[str, Any] = {}

    # Step 5 boundary flags
    decision_mode: str = "DETERMINISTIC_GRAPH"
    corpus_guidance_mode: str = "NON_DECISIONAL"

    corpus_guidance_sections: List[Dict[str, Any]] = []
