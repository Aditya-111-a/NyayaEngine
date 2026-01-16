from neo4j import GraphDatabase
from app.core.config import settings

_driver = None

def get_driver():
    """
    Singleton Neo4j driver (preferred new API)
    """
    global _driver
    if _driver is None:
        _driver = GraphDatabase.driver(
            settings.NEO4J_URI,
            auth=(settings.NEO4J_USER, settings.NEO4J_PASSWORD),
        )
    return _driver


class Neo4jDB:
    """
    Backward-compatible wrapper for existing code that expects:
    - neo4j_db.query(cypher, params)
    - neo4j_db.driver
    """
    def __init__(self):
        self.driver = get_driver()

    def query(self, cypher: str, params: dict = None):
        if params is None:
            params = {}
        with self.driver.session() as session:
            result = session.run(cypher, params)
            return [r.data() for r in result]

    def close(self):
        global _driver
        if _driver is not None:
            _driver.close()
            _driver = None


# old code expects this object
neo4j_db = Neo4jDB()
