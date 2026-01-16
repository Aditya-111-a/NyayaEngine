def test_graph_validate_includes_vector_and_embedding_stats(client):
    resp = client.get("/debug/graph/validate")
    assert resp.status_code == 200, resp.text

    data = resp.json()
    assert "summary" in data
    assert "vector" in data
    assert "embedding_stats" in data

    # vector index must exist
    assert data["vector"]["index_ok"] is True

    # embedding dims sanity when embeddings exist
    stats = data["embedding_stats"]
    assert "total_sections" in stats
    assert "embedded_sections" in stats
