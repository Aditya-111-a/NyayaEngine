from fastapi import APIRouter
from app.db.neo4j import neo4j_db

router = APIRouter(prefix="/sections", tags=["sections"])

@router.get("/list")
def list_sections():
    cypher = """
    MATCH (a:Act {act_id:"CPA_2019"})-[:HAS_SECTION]->(s:Section)
    RETURN s.section_id as section_id,
           s.section_no as section_no,
           s.title as title,
           s.topic as topic,
           s.summary as summary
    ORDER BY s.topic, s.section_no
    """
    return {"sections": neo4j_db.query(cypher)}
