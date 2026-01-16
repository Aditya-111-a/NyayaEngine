from fastapi import APIRouter, HTTPException
from app.schemas.fact_bulk import BulkFactsRequest
from app.services.case_service import CaseService
from app.services.reasoning_service import ReasoningService
from app.db.neo4j import get_driver

router = APIRouter(prefix="/case", tags=["case-facts"])

@router.post("/{case_id}/facts/bulk")
def add_bulk_facts(case_id: str, req: BulkFactsRequest):
    # check case exists
    driver = get_driver()
    with driver.session() as session:
        found = session.run(
            "MATCH (c:Case {case_id:$case_id}) RETURN c.case_id AS id",
            case_id=case_id
        ).single()

    if not found:
        raise HTTPException(status_code=404, detail="Case not found")

    facts = [{"fact_id": f.fact_id, "value": f.value} for f in req.facts]

    # store facts (deterministic)
    CaseService.add_facts_bulk(case_id, facts)

    # rerun reasoning
    reasoning = ReasoningService.run_reasoning(case_id)

    return {
        "case_id": case_id,
        "facts_saved": len(facts),
        "reasoning_result": reasoning
    }
