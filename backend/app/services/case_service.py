import uuid
from datetime import datetime, timezone
from app.db.neo4j import neo4j_db
from typing import List, Dict, Any
from app.db.neo4j import get_driver

class CaseService:
    @staticmethod
    def create_case(complaint_text: str) -> str:
        case_id = str(uuid.uuid4())
        cypher = """
        CREATE (c:Case {case_id:$case_id, complaint_text:$text, created_at:$created_at})
        RETURN c.case_id as case_id
        """
        neo4j_db.query(cypher, {
            "case_id": case_id,
            "text": complaint_text,
            "created_at": datetime.now(timezone.utc).isoformat()
        })
        return case_id

    @staticmethod
    def add_fact(case_id: str, fact_id: str, value, source: str = "USER"):
        cypher = """
        MATCH (c:Case {case_id:$case_id})
        MATCH (f:Fact {fact_id:$fact_id})
        MERGE (cf:CaseFact {case_id:$case_id, fact_id:$fact_id})
        SET cf.value = $value,
            cf.source = $source
        MERGE (c)-[:HAS_FACT]->(cf)
        RETURN cf
        """
        return neo4j_db.query(cypher, {
            "case_id": case_id,
            "fact_id": fact_id,
            "value": value,
            "source": source
        })
    
    @staticmethod
    def add_facts_bulk(case_id: str, facts: List[Dict[str, Any]]):
        if not facts:
            return

        driver = get_driver()
        cypher = """
        MATCH (c:Case {case_id:$case_id})
        UNWIND $facts AS f
        MERGE (cf:CaseFact {case_id:$case_id, fact_id:f.fact_id})
        SET cf.value = f.value,
            cf.source = coalesce(f.source, "llm")
        MERGE (c)-[:HAS_FACT]->(cf)
        """
        with driver.session() as session:
            session.run(cypher, case_id=case_id, facts=facts)
