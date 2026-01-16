from fastapi import APIRouter
from app.db.neo4j import neo4j_db

router = APIRouter(prefix="/facts", tags=["facts"])

@router.get("/list")
def list_facts():
    cypher = """
    MATCH (f:Fact)
    RETURN f.fact_id as fact_id,
           f.name as name,
           f.datatype as datatype,
           f.category as category,
           f.description as description
    ORDER BY f.category, f.fact_id
    """
    return {"facts": neo4j_db.query(cypher)}
