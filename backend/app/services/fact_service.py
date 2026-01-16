from app.db.neo4j import get_driver

class FactService:
    @staticmethod
    def list_facts_with_metadata():
        driver = get_driver()
        q = """
        MATCH (f:Fact)
        RETURN f.fact_id AS fact_id, f.name AS name,
               coalesce(f.value_type,"string") AS value_type,
               coalesce(f.question,"") AS question,
               coalesce(f.ui_control,"text") AS ui_control,
               coalesce(f.keywords,[]) AS keywords,
               coalesce(f.allowed_values,[]) AS allowed_values,
               coalesce(f.example,"") AS example
        ORDER BY f.fact_id
        """
        with driver.session() as session:
            return [dict(r) for r in session.run(q)]
