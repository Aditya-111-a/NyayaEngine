import pytest
from app.db.neo4j import neo4j_db
from app.services.reasoning_service import ReasoningService


@pytest.mark.integration
def test_get_rule_outputs_includes_recommends_action():
    rule_id = "RULE_JURISDICTION_DISTRICT"

    # graph sanity check
    sanity = neo4j_db.query("""
    MATCH (r:Rule {rule_id:$rule_id})-[:RECOMMENDS_ACTION]->(a:Action)
    RETURN count(a) AS cnt
    """, {"rule_id": rule_id})

    assert sanity and sanity[0]["cnt"] >= 1, "Graph wiring missing RECOMMENDS_ACTION"

    outputs = ReasoningService.get_rule_outputs(rule_id)

    action_ids = {a.get("action_id") for a in outputs.get("actions", []) if a}
    assert len(action_ids) >= 1
