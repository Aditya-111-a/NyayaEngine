from fastapi import APIRouter
from app.services.graph_validator_service import GraphValidatorService

router = APIRouter(prefix="/debug/graph", tags=["graph-validator"])


@router.get("/validate")
def validate_graph():
    return GraphValidatorService.validate_graph()
