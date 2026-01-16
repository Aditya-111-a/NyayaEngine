from fastapi import APIRouter
from app.db.neo4j import neo4j_db

router = APIRouter(prefix="/health", tags=["health"])

@router.get("")
def health():
    # simple DB ping
    res = neo4j_db.query("RETURN 1 as ok")
    return {"status": "ok", "neo4j": res[0]["ok"]}
