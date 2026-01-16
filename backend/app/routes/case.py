from fastapi import APIRouter
from app.schemas.case import CaseCreateRequest, CaseCreateResponse, CaseAddFactRequest
from app.services.case_service import CaseService

router = APIRouter(prefix="/case", tags=["case"])

@router.post("/create", response_model=CaseCreateResponse)
def create_case(req: CaseCreateRequest):
    case_id = CaseService.create_case(req.complaint_text)
    return {"case_id": case_id}

@router.post("/{case_id}/fact")
def add_fact(case_id: str, req: CaseAddFactRequest):
    CaseService.add_fact(case_id, req.fact_id, req.value, req.source or "USER")
    return {"status": "added", "case_id": case_id, "fact_id": req.fact_id}
