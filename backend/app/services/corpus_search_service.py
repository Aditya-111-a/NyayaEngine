from app.db.neo4j import neo4j_db

class CorpusSearchService:
    @staticmethod
    def search_sections_by_embedding(embedding: list[float], top_k: int = 5):
        if not embedding:
            return []

        cypher = """
        CALL db.index.vector.queryNodes('section_embedding_index', $k, $embedding)
        YIELD node, score
        RETURN
          node.doc_id AS doc_id,
          node.section_key AS section_key,
          node.section_number AS section_number,
          node.section_no AS section_no,
          node.title AS title,
          score AS score
        ORDER BY score DESC
        """

        return neo4j_db.query(cypher, {"embedding": embedding, "k": top_k})
