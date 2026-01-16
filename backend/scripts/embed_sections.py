import asyncio
from app.db.neo4j import neo4j_db
from app.services.embedding_service import EmbeddingService

BATCH = 25

async def main():
    # fetch all sections missing embeddings
    rows = neo4j_db.query("""
    MATCH (s:Section)
    WHERE s.text IS NOT NULL AND (s.embedding IS NULL OR size(s.embedding)=0)
    RETURN s.section_key AS section_key, s.text AS text
    LIMIT 5000
    """)

    print("sections to embed:", len(rows))

    for i in range(0, len(rows), BATCH):
        batch = rows[i:i+BATCH]
        for r in batch:
            section_key = r["section_key"]
            text = r["text"]
            emb = await EmbeddingService.embed_text(text[:8000])  # safety limit

            neo4j_db.query("""
            MATCH (s:Section {section_key:$section_key})
            SET s.embedding = $embedding,
                s.embedding_model = $model,
                s.embedded_at = datetime()
            """, {"section_key": section_key, "embedding": emb, "model": "nomic-embed-text:latest"})

        print(f"embedded {min(i+BATCH, len(rows))}/{len(rows)}")

if __name__ == "__main__":
    asyncio.run(main())
