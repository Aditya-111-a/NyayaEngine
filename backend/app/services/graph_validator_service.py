from app.db.neo4j import neo4j_db


class GraphValidatorService:
    @staticmethod
    def validate_graph():
        """
        Deterministic graph QA tool.
        Returns structured issues found in Neo4j.
        """

        issues = {
            "summary": {
                "enabled_rules": 0,
                "errors": 0,
                "warnings": 0,
            },
            "errors": [],
            "warnings": [],

            # ✅ Step 7 additions
            "vector": {
                "index_ok": False,
                "index": [],
            },
            "embedding_stats": {},
        }

        # ----------------------------
        # A) Count enabled rules
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (r:Rule {enabled:true})
        RETURN count(r) AS cnt
        """)
        issues["summary"]["enabled_rules"] = int(rows[0]["cnt"]) if rows else 0

        # ----------------------------
        # B) Enabled rules with NO conditions
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (r:Rule {enabled:true})
        WHERE NOT (r)-[:HAS_CONDITION]->(:Condition)
        RETURN r.rule_id AS rule_id, coalesce(r.name,"") AS name
        """)
        for r in rows:
            issues["errors"].append({
                "type": "RULE_NO_CONDITIONS",
                "rule_id": r["rule_id"],
                "rule_name": r["name"],
                "message": "Enabled rule has no HAS_CONDITION edges."
            })

        # ----------------------------
        # C) Condition missing fact connection
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (r:Rule {enabled:true})-[:HAS_CONDITION]->(c:Condition)
        WHERE NOT (c)-[:USES_FACT]->(:Fact)
        RETURN r.rule_id AS rule_id, c.condition_id AS condition_id
        """)
        for r in rows:
            issues["errors"].append({
                "type": "CONDITION_NO_FACT",
                "rule_id": r["rule_id"],
                "condition_id": r["condition_id"],
                "message": "Condition has no USES_FACT edge."
            })

        # ----------------------------
        # D) Condition missing operator
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (r:Rule {enabled:true})-[:HAS_CONDITION]->(c:Condition)
        WHERE c.operator IS NULL OR trim(toString(c.operator)) = ""
        RETURN r.rule_id AS rule_id, c.condition_id AS condition_id
        """)
        for r in rows:
            issues["errors"].append({
                "type": "CONDITION_NO_OPERATOR",
                "rule_id": r["rule_id"],
                "condition_id": r["condition_id"],
                "message": "Condition operator missing."
            })

        # ----------------------------
        # E) Enabled rules with NO outputs at all
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (r:Rule {enabled:true})
        WHERE NOT (r)-[:PRODUCES_REMEDY]->(:Remedy)
          AND NOT (r)-[:RECOMMENDS_ACTION]->(:Action)
          AND NOT (r)-[:CITES]->(:Section)
        RETURN r.rule_id AS rule_id, coalesce(r.name,"") AS name
        """)
        for r in rows:
            issues["warnings"].append({
                "type": "RULE_NO_OUTPUTS",
                "rule_id": r["rule_id"],
                "rule_name": r["name"],
                "message": "Enabled rule has no outputs (no Remedy/Action/Section edges)."
            })

        # ----------------------------
        # F) Duplicate IDs checks (very important)
        # ----------------------------
        dup_queries = [
            ("DUPLICATE_RULE_ID", "Rule", "rule_id"),
            ("DUPLICATE_FACT_ID", "Fact", "fact_id"),
            ("DUPLICATE_REMEDY_ID", "Remedy", "remedy_id"),
            ("DUPLICATE_ACTION_ID", "Action", "action_id"),
        ]
        for issue_type, label, key in dup_queries:
            rows = neo4j_db.query(f"""
            MATCH (n:{label})
            WITH n.{key} AS id, count(n) AS cnt
            WHERE id IS NOT NULL AND cnt > 1
            RETURN id, cnt
            ORDER BY cnt DESC
            """)
            for r in rows:
                issues["errors"].append({
                    "type": issue_type,
                    "id": r["id"],
                    "count": int(r["cnt"]),
                    "message": f"Duplicate {label}.{key} detected."
                })

        # ----------------------------
        # G) Facts missing question / ui_control / value_type
        # ----------------------------
        rows = neo4j_db.query("""
        MATCH (f:Fact)
        WHERE f.question IS NULL OR trim(toString(f.question)) = ""
        RETURN f.fact_id AS fact_id
        """)
        for r in rows:
            issues["warnings"].append({
                "type": "FACT_MISSING_QUESTION",
                "fact_id": r["fact_id"],
                "message": "Fact has no question field. UI will be weak."
            })

        rows = neo4j_db.query("""
        MATCH (f:Fact)
        WHERE f.value_type IS NULL OR trim(toString(f.value_type)) = ""
        RETURN f.fact_id AS fact_id
        """)
        for r in rows:
            issues["warnings"].append({
                "type": "FACT_MISSING_VALUE_TYPE",
                "fact_id": r["fact_id"],
                "message": "Fact value_type missing. Casting may fail."
            })

        # ==========================================================
        # ✅ STEP 7 — Vector index + embedding health validation
        # ==========================================================

        # H) Vector index existence
        try:
            index_rows = neo4j_db.query("""
            SHOW INDEXES YIELD name, type
            WHERE name = 'section_embedding_index'
            RETURN name, type
            """)
            issues["vector"]["index"] = index_rows
            issues["vector"]["index_ok"] = bool(index_rows)

            if not index_rows:
                issues["errors"].append({
                    "type": "VECTOR_INDEX_MISSING",
                    "message": "Vector index 'section_embedding_index' not found. Run schema_vectors.cypher."
                })
        except Exception as e:
            issues["errors"].append({
                "type": "VECTOR_INDEX_CHECK_FAILED",
                "message": f"Failed to check Neo4j vector index: {str(e)}"
            })

        # I) Embedding stats + dimension check
        try:
            stats_rows = neo4j_db.query("""
            MATCH (s:Section)
            WITH
              count(s) AS total_sections,
              sum(CASE WHEN s.embedding IS NOT NULL AND size(s.embedding) > 0 THEN 1 ELSE 0 END) AS embedded_sections,
              min(CASE WHEN s.embedding IS NOT NULL THEN size(s.embedding) ELSE NULL END) AS min_dim,
              max(CASE WHEN s.embedding IS NOT NULL THEN size(s.embedding) ELSE NULL END) AS max_dim
            RETURN total_sections, embedded_sections, min_dim, max_dim
            """)
            embedding_stats = stats_rows[0] if stats_rows else {}
            issues["embedding_stats"] = embedding_stats

            embedded = int(embedding_stats.get("embedded_sections") or 0)
            min_dim = embedding_stats.get("min_dim")
            max_dim = embedding_stats.get("max_dim")

            # Not fatal, but indicates embeddings weren't generated
            if embedded == 0:
                issues["warnings"].append({
                    "type": "NO_SECTION_EMBEDDINGS",
                    "message": "No Section nodes have embeddings. Run: python -m scripts.embed_sections"
                })

            # If embeddings exist, enforce correct dimensions (nomic-embed-text=768)
            if embedded > 0 and (min_dim != 768 or max_dim != 768):
                issues["errors"].append({
                    "type": "EMBEDDING_DIMENSION_MISMATCH",
                    "message": f"Expected embedding dim=768 but got min_dim={min_dim}, max_dim={max_dim}"
                })

        except Exception as e:
            issues["errors"].append({
                "type": "EMBEDDING_STATS_FAILED",
                "message": f"Failed to compute embedding stats: {str(e)}"
            })

        # summary counts
        issues["summary"]["errors"] = len(issues["errors"])
        issues["summary"]["warnings"] = len(issues["warnings"])

        return issues
