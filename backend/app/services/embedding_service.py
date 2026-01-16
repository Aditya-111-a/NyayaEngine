import httpx
from app.core.config import settings

class EmbeddingService:
    @staticmethod
    async def embed_text(text: str) -> list[float]:
        text = (text or "").strip()
        if not text:
            return []

        payload = {
            "model": settings.OLLAMA_EMBED_MODEL,  # "nomic-embed-text:latest"
            "prompt": text
        }

        async with httpx.AsyncClient(timeout=60) as client:
            r = await client.post(f"{settings.OLLAMA_BASE_URL}/api/embeddings", json=payload)
            r.raise_for_status()
            data = r.json()

        return data.get("embedding", [])
