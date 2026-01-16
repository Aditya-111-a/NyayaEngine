def test_intake_returns_guidance_when_no_rules_fire(client):
    payload = {
        "complaint_text": (
            "I purchased a product from an e-commerce website but received a defective item. "
            "Seller is refusing refund and customer support is not responding."
        )
    }

    resp = client.post("/complaint/intake", json=payload)
    assert resp.status_code == 200, resp.text

    data = resp.json()

    # boundary flags
    assert data["decision_mode"] == "DETERMINISTIC_GRAPH"
    assert data["corpus_guidance_mode"] == "NON_DECISIONAL"

    assert "reasoning_result" in data
    assert "fired_rules" in data["reasoning_result"]

    if len(data["reasoning_result"]["fired_rules"]) == 0:
        assert "corpus_guidance_sections" in data
        assert isinstance(data["corpus_guidance_sections"], list)
