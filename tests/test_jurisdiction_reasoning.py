import pytest
import uuid
from app.db.neo4j import neo4j_db
from app.services.reasoning_service import ReasoningService


@pytest.mark.integration
def test_jurisdiction_reasoning_returns_action():
    case_id = f"CASE_TEST_{uuid.uuid4().hex}"

    # Create case
    neo4j_db.query("CREATE (:Case {case_id:$case_id})", {"case_id": case_id})

    # Insert jurisdiction-triggering fact
    neo4j_db.query("""
    MATCH (c:Case {case_id:$case_id})
    MERGE (c)-[:HAS_FACT]->(:CaseFact {
        fact_id: "F_AMOUNT_PAID",
        value: "100000"
    })
    """, {"case_id": case_id})

    result = ReasoningService.run_reasoning(case_id)

    fired_rule_ids = [r["rule_id"] for r in result.get("fired_rules", [])]
    assert "RULE_JURISDICTION_DISTRICT" in fired_rule_ids

    actions = result["final_decision"].get("actions", [])
    action_ids = {a.get("action_id") for a in actions if a}

    assert "A_JURISDICTION_DISTRICT" in action_ids
