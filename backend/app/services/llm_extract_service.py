import json
import re
import httpx
from typing import List, Dict, Any

from app.core.config import settings


class LLMExtractService:
    """
    STRICT RULE:
    LLM is used ONLY for query processing (complaint intake + fact extraction).
    LLM MUST NOT decide remedies, actions, rule firing, or legal conclusions.
    """

    @staticmethod
    def _safe_json_extract(text: str) -> Dict[str, Any]:
        """
        Extract first JSON object from model output.
        """
        match = re.search(r"\{.*\}", text, re.DOTALL)
        if not match:
            return {}
        try:
            return json.loads(match.group(0))
        except json.JSONDecodeError:
            return {}

    @staticmethod
    def _cast_value(value: Any, value_type: str):
        """
        Cast model values into system types.
        """
        if value is None:
            return None

        if value_type == "boolean":
            if isinstance(value, bool):
                return value
            if isinstance(value, str):
                v = value.strip().lower()
                if v in ["true", "yes", "y", "1"]:
                    return True
                if v in ["false", "no", "n", "0"]:
                    return False
            if isinstance(value, (int, float)):
                return bool(value)

        if value_type == "number":
            try:
                if isinstance(value, str):
                    value = value.replace(",", "").strip()
                return float(value) if "." in str(value) else int(value)
            except Exception:
                return None

        # default -> string
        return str(value).strip()

    @staticmethod
    async def extract_facts_only(
        complaint_text: str,
        fact_defs: List[Dict[str, Any]],
        top_k_questions: int = 6
    ) -> Dict[str, Any]:
        """
        Output only:
        - is_valid_complaint
        - validity_reason
        - facts (fact_id + value)
        - ask_fact_ids (missing facts to ask next)
        """
        if not settings.LLM_ENABLED:
            return {
                "is_valid_complaint": True,
                "validity_reason": "LLM disabled; bypass intake validity + extraction",
                "facts": [],
            }
        allowed_map = {f["fact_id"]: f for f in fact_defs}

        # DEV MODE: bypass Ollama completely
        if str(getattr(settings, "LLM_ENABLED", True)).lower() in ["false", "0", "no"]:
            return {
                "is_valid_complaint": True,
                "validity_reason": "LLM disabled (dev mode). Complaint accepted for deterministic evaluation.",
                "facts": [],
                "ask_fact_ids": []
            }

        payload = {
            "task": "Convert consumer complaint text into structured facts for CPA India rule engine.",
            "complaint_text": complaint_text,
            "allowed_fact_ids": list(allowed_map.keys()),
            "fact_dictionary": [
                {
                    "fact_id": f["fact_id"],
                    "value_type": f.get("value_type", "string"),
                    "question": f.get("question", ""),
                    "example": f.get("example", "")
                }
                for f in fact_defs
            ],
            "output_format": {
                "is_valid_complaint": True,
                "validity_reason": "string",
                "facts": [{"fact_id": "F_...", "value": "typed"}],
                "ask_fact_ids": ["F_...", "F_..."]
            },
            "hard_rules": [
                "Return ONLY JSON.",
                "If input is nonsense/abuse/irrelevant -> is_valid_complaint=false.",
                "If not related to consumer goods/services transaction -> invalid.",
                "Do NOT invent fact_id.",
                f"ask_fact_ids length <= {top_k_questions}",
                "NEVER output remedies/actions/sections/rules. Only facts."
            ]
        }

        url = f"{settings.OLLAMA_BASE_URL}/api/generate"
        body = {
            "model": settings.OLLAMA_MODEL,
            "prompt": json.dumps(payload, ensure_ascii=False),
            "stream": False
        }

        async with httpx.AsyncClient(timeout=120.0) as client:
            resp = await client.post(url, json=body)
            resp.raise_for_status()
            raw = resp.json()

        parsed = LLMExtractService._safe_json_extract(raw.get("response", ""))

        # normalize + cast values
        facts_out = []
        for item in (parsed.get("facts") or []):
            fid = item.get("fact_id")
            if fid not in allowed_map:
                continue

            vtype = allowed_map[fid].get("value_type", "string")
            casted = LLMExtractService._cast_value(item.get("value"), vtype)

            # filter invalid / empty facts
            if casted is None:
                continue
            if isinstance(casted, str) and casted.strip() == "":
                continue

            facts_out.append({
                "fact_id": fid,
                "value": casted,
                "source": settings.FACT_SOURCE
            })

        # sanitize ask_fact_ids
        ask_fact_ids = []
        for fid in (parsed.get("ask_fact_ids") or []):
            if fid in allowed_map:
                ask_fact_ids.append(fid)

        validity_reason = (parsed.get("validity_reason") or "").strip()
        
        if not validity_reason:
            validity_reason = "Complaint accepted for deterministic graph evaluation."

        # permissive validity
        # If parsing failed OR key missing -> default TRUE
        raw_valid = parsed.get("is_valid_complaint", None)

        if raw_valid is None:
            is_valid = True
        else:
            is_valid = bool(raw_valid)

        return {
            "is_valid_complaint": is_valid,
            "validity_reason": validity_reason,
            "facts": facts_out,
            "ask_fact_ids": ask_fact_ids[:top_k_questions]
        }

