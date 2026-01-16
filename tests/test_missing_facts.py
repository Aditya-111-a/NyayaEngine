import pytest
import uuid
from app.db.neo4j import neo4j_db
from app.services.reasoning_service import ReasoningService


@pytest.mark.integration
def test_run_reasoning_returns_missing_fact_ids():
    case_id = f"CASE_TEST_{uuid.uuid4().hex}"

    neo4j_db.query("CREATE (:Case {case_id:$case_id})", {"case_id": case_id})

    result = ReasoningService.run_reasoning(case_id)

    assert "missing_fact_ids" in result
    assert isinstance(result["missing_fact_ids"], list)
