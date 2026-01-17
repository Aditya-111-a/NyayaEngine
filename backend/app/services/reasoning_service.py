from app.db.neo4j import neo4j_db

SUPPORTED_OPERATORS = {"EQ", "NEQ", "GT", "GTE", "LT", "LTE", "IN", "CONTAINS", "EXISTS", "NOT_EXISTS"}


def cast_condition_value(value, value_type: str):
    if value is None:
        return None

    vt = (value_type or "").upper()

    if vt in ("BOOL", "BOOLEAN"):
        if isinstance(value, bool):
            return value
        if isinstance(value, str):
            return value.strip().lower() in ("true", "1", "yes", "y")
        return bool(value)

    if vt in ("NUMBER", "FLOAT", "INT", "INTEGER"):
        try:
            return float(value)
        except Exception:
            return None

    if vt in ("STRING", "TEXT"):
        return str(value)

    if vt in ("LIST", "ARRAY"):
        # stored as comma-separated values in Neo4j currently
        if isinstance(value, list):
            return value
        if isinstance(value, str):
            return [x.strip() for x in value.split(",") if x.strip()]
        return [value]

    return value


def eval_condition(op: str, case_value, cond_value):
    op = (op or "").upper()
    if op not in SUPPORTED_OPERATORS:
        raise ValueError(f"Unsupported operator: {op}")

    if op == "EXISTS":
        return case_value is not None

    # ✅ NEW: safe negation of EXISTS
    if op == "NOT_EXISTS":
        return case_value is None

    if op == "EQ":
        return case_value == cond_value
    if op == "NEQ":
        return case_value != cond_value
    
    if op == "NOT_EXISTS":
        return case_value is None

    # FIX: numeric ops must not crash on strings
    if op in ["GT", "GTE", "LT", "LTE"]:
        # string presence check (used in our cypher rules)
        if isinstance(case_value, str) and isinstance(cond_value, str):
            if op == "GT":
                return len(case_value.strip()) > 0
            return False

        try:
            cv = float(case_value)
            dv = float(cond_value)
        except Exception:
            return False

        if op == "GT":
            return cv > dv
        if op == "GTE":
            return cv >= dv
        if op == "LT":
            return cv < dv
        if op == "LTE":
            return cv <= dv

    if op == "IN":
        if isinstance(cond_value, str):
            options = [x.strip() for x in cond_value.split(",")]
        else:
            options = list(cond_value)
        return str(case_value) in options

    if op == "CONTAINS":
        return str(cond_value).lower() in str(case_value).lower()

    return False


class ReasoningService:
    @staticmethod
    def get_case_facts(case_id: str) -> dict:
        cypher = """
        MATCH (:Case {case_id:$case_id})-[:HAS_FACT]->(cf:CaseFact)
        RETURN cf.fact_id as fact_id, cf.value as value
        """
        rows = neo4j_db.query(cypher, {"case_id": case_id})
        return {r["fact_id"]: r["value"] for r in rows}

    @staticmethod
    def fetch_rules():
        cypher = """
        MATCH (r:Rule {enabled:true})-[:HAS_CONDITION]->(c:Condition)-[:USES_FACT]->(f:Fact)
        RETURN
            r.rule_id as rule_id,
            r.name as rule_name,
            r.description as rule_desc,
            r.priority as priority,
            collect({
                cond_id: c.condition_id,
                operator: c.operator,
                value: c.value,
                value_type: c.value_type,
                fact_id: f.fact_id
            }) as conditions
        ORDER BY priority DESC
        """
        return neo4j_db.query(cypher)

    @staticmethod
    def get_rule_outputs(rule_id: str):
        """
        IMPORTANT:
        Actions can come from:
        1) Rule directly: (r)-[:RECOMMENDS_ACTION]->(a:Action)
        2) Remedy chain: (re)-[:NEXT_ACTION]->(a2:Action)
        """
        cypher = """
        MATCH (r:Rule {rule_id:$rule_id})

        OPTIONAL MATCH (r)-[:PRODUCES_REMEDY]->(re:Remedy)
        OPTIONAL MATCH (r)-[:CITES]->(s:Section)

        // Direct actions from rule
        OPTIONAL MATCH (r)-[:RECOMMENDS_ACTION]->(a:Action)

        // Actions derived from remedy
        OPTIONAL MATCH (re)-[:NEXT_ACTION]->(a2:Action)

        WITH r,
            collect(DISTINCT CASE WHEN re IS NULL THEN NULL ELSE {
                remedy_id: re.remedy_id,
                name: re.name,
                description: re.description
            } END) AS remedies_raw,

            collect(DISTINCT CASE WHEN a IS NULL THEN NULL ELSE {
                action_id: a.action_id,
                name: a.name,
                description: a.description
            } END) AS direct_actions_raw,

            collect(DISTINCT CASE WHEN a2 IS NULL THEN NULL ELSE {
                action_id: a2.action_id,
                name: a2.name,
                description: a2.description
            } END) AS remedy_actions_raw,

            collect(DISTINCT CASE WHEN s IS NULL THEN NULL ELSE {
                section_no: s.section_no,
                title: s.title
            } END) AS sections_raw

        WITH r,
            [x IN remedies_raw WHERE x IS NOT NULL] AS remedies,
            apoc.coll.toSet([x IN (direct_actions_raw + remedy_actions_raw) WHERE x IS NOT NULL]) AS actions,
            [x IN sections_raw WHERE x IS NOT NULL] AS sections

        RETURN
            r.rule_id AS rule_id,
            remedies,
            actions,
            sections
        """
        rows = neo4j_db.query(cypher, {"rule_id": rule_id})
        return rows[0] if rows else {"remedies": [], "actions": [], "sections": []}


    @staticmethod
    def run_reasoning(case_id: str):
        case_facts = ReasoningService.get_case_facts(case_id)
        rules = ReasoningService.fetch_rules()

        fired = []
        failed = []
        all_remedies = {}
        all_actions = {}
        all_sections = {}
        explanation = []

        missing_fact_ids = set()   # ✅ Stage 2 addition

        for r in rules:
            ok = True
            used_fact_ids = []
            fail_reason = None

            for cond in r["conditions"]:
                fact_id = cond["fact_id"]
                op = cond["operator"]

                cond_value_raw = cond.get("value")
                cond_value_type = cond.get("value_type", "STRING")

                cond_value = cast_condition_value(cond_value_raw, cond_value_type)

                # Get case fact
                case_value = case_facts.get(fact_id)

                # Missing fact detection
                if case_value is None and op != "EXISTS":
                    missing_fact_ids.add(fact_id)   # ✅ Stage 2 addition
                    ok = False
                    fail_reason = f'{r["rule_id"]} failed because {fact_id} missing'
                    break

                # Cast case value also
                if (cond_value_type or "").upper() in ("NUMBER", "BOOL", "BOOLEAN", "FLOAT", "INT", "INTEGER"):
                    case_value = cast_condition_value(case_value, cond_value_type)

                if eval_condition(op, case_value, cond_value) is False:
                    ok = False
                    fail_reason = (
                        f'{r["rule_id"]} failed because condition failed: '
                        f'{fact_id} ({case_value}) {op} {cond_value}'
                    )
                    break

                used_fact_ids.append(fact_id)

            if ok:
                outputs = ReasoningService.get_rule_outputs(r["rule_id"])

                fired.append({
                    "rule_id": r["rule_id"],
                    "rule_name": r["rule_name"],
                    "priority": r["priority"],
                    "used_facts": used_fact_ids,
                    "outputs": outputs
                })

                explanation.append({
                    "rule_id": r["rule_id"],
                    "rule_name": r["rule_name"],
                    "trigger_facts": [
                        {"fact_id": fid, "value": case_facts.get(fid)}
                        for fid in used_fact_ids
                    ]
                })

                for rem in outputs.get("remedies", []) or []:
                    if rem and rem.get("remedy_id") and rem.get("name"):
                        all_remedies[rem["remedy_id"]] = rem

                for act in outputs.get("actions", []) or []:
                    if act and act.get("action_id") and act.get("name"):
                        all_actions[act["action_id"]] = act

                for sec in outputs.get("sections", []) or []:
                    if sec and sec.get("section_no") and sec.get("title"):
                        all_sections[sec["section_no"]] = sec

            else:
                failed.append({
                    "rule_id": r["rule_id"],
                    "rule_name": r["rule_name"],
                    "priority": r["priority"],
                    "reason": fail_reason or f'{r["rule_id"]} failed for unknown reason'
                })

        fired_sorted = sorted(fired, key=lambda x: (x.get("priority") is not None, x.get("priority") or 0), reverse=True)
        failed_sorted = sorted(failed, key=lambda x: (x.get("priority") is not None, x.get("priority") or 0), reverse=True)

        final_decision = {
            "summary": None,
            "top_rules": [fr["rule_id"] for fr in fired_sorted[:3]],
            "remedies": list(all_remedies.values()),
            "actions": list(all_actions.values()),
            "citations": list(all_sections.values())
        }

        if fired_sorted:
            top_rule_names = [fr["rule_name"] for fr in fired_sorted[:2]]
            final_decision["summary"] = " & ".join(top_rule_names)
        else:
            final_decision["summary"] = "No applicable rule found. More facts required."

        return {
            "case_id": case_id,
            "final_decision": final_decision,
            "fired_rules": fired_sorted,
            "explanation_trace": explanation,
            "debug_failed_rules": failed_sorted[:20],

            "missing_fact_ids": sorted(list(missing_fact_ids)),
        }
