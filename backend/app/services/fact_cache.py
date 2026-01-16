import time
from typing import List, Dict, Any
from app.services.fact_service import FactService


class FactCache:
    _facts: List[Dict[str, Any]] = []
    _last_load_ts: float = 0
    _ttl_seconds: int = 600  # 10 minutes

    @classmethod
    def get_facts(cls) -> List[Dict[str, Any]]:
        now = time.time()
        if not cls._facts or (now - cls._last_load_ts) > cls._ttl_seconds:
            cls._facts = FactService.list_facts_with_metadata()
            cls._last_load_ts = now
        return cls._facts
