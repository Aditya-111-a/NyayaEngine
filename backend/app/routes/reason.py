from fastapi import APIRouter
from app.schemas.case import ReasonRequest
from app.services.reasoning_service import ReasoningService

router = APIRouter(prefix="/reason", tags=["reason"])

@router.post("/run")
def run_reasoning(req: ReasonRequest):
    return ReasoningService.run_reasoning(req.case_id)
