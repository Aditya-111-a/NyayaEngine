from typing import Any, Dict

class UserOutputService:
    @staticmethod
    def simplify_reasoning(reasoning_result: Dict[str, Any]) -> Dict[str, Any]:
        """
        Converts deterministic reasoning_result into user-friendly UI output.
        Does NOT change decisions, only formats.
        """
        rr = reasoning_result or {}

        # ✅ support both: old schema (final_decision) and new schema (top-level keys)
        final = rr.get("final_decision") or {}

        # -----------------------------
        # 1) SUMMARY
        # -----------------------------
        summary = final.get("summary")
        if not summary:
            fired_count = len(rr.get("fired_rules") or [])
            missing_count = len(rr.get("missing_fact_ids") or [])
            if fired_count > 0:
                summary = "Applicable consumer protection rules were matched. See remedies and next steps below."
            elif missing_count > 0:
                summary = "More information is needed to determine applicable remedies."
            else:
                summary = "Complaint processed."

        # -----------------------------
        # 2) REMEDIES
        # -----------------------------
        remedies_src = (
            final.get("remedies")
            or rr.get("matched_remedies")
            or rr.get("remedies")
            or []
        )

        remedies = []
        for r in remedies_src:
            if isinstance(r, str):
                remedies.append({"title": r, "description": ""})
                continue

            if isinstance(r, dict):
                remedies.append({
                    "title": r.get("name") or r.get("title") or r.get("remedy_id") or "Remedy",
                    "description": r.get("description") or ""
                })

        # -----------------------------
        # 3) ACTIONS (recommended steps)
        # -----------------------------
        actions_src = rr.get("recommended_actions") or rr.get("actions") or []
        actions = []
        seen = set()

        # If actions already exist at top-level, use them
        if actions_src:
            for a in actions_src:
                if isinstance(a, str):
                    actions.append({"action_id": a, "title": a, "description": ""})
                    continue

                if isinstance(a, dict):
                    aid = a.get("action_id") or a.get("id") or a.get("name") or a.get("title")
                    key = str(aid)
                    if key in seen:
                        continue
                    seen.add(key)

                    actions.append({
                        "action_id": aid or "",
                        "title": a.get("name") or a.get("title") or aid or "",
                        "description": a.get("description") or ""
                    })
        else:
            # fallback: collect actions from fired_rules outputs
            for fr in rr.get("fired_rules", []) or []:
                outs = fr.get("outputs", {}) or {}
                for a in outs.get("actions", []) or []:
                    aid = a.get("action_id") or a.get("id") or a.get("name") or a.get("title")
                    if not aid or aid in seen:
                        continue
                    seen.add(aid)
                    actions.append({
                        "action_id": aid,
                        "title": a.get("name") or a.get("title") or aid,
                        "description": a.get("description") or ""
                    })

        # -----------------------------
        # 4) CITATIONS / LEGAL BASIS
        # -----------------------------
        citations_src = (
            final.get("citations")
            or rr.get("citations")
            or rr.get("cited_sections")
            or []
        )

        citations = []
        for c in citations_src:
            if isinstance(c, str):
                citations.append({"label": c, "title": ""})
                continue

            if isinstance(c, dict):
                citations.append({
                    "label": c.get("section_key") or c.get("section_no") or c.get("label") or "",
                    "title": c.get("title") or c.get("name") or ""
                })

        return {
            "summary": summary,
            "remedies": remedies,
            "recommended_steps": actions,
            "legal_basis": citations
        }
