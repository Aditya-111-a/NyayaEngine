from fastapi import APIRouter
from app.schemas.intake import ComplaintIntakeRequest, ComplaintIntakeResponse
from app.services.fact_cache import FactCache
from app.services.llm_extract_service import LLMExtractService
from app.services.case_service import CaseService
from app.services.reasoning_service import ReasoningService
from app.services.embedding_service import EmbeddingService
from app.services.corpus_search_service import CorpusSearchService
from app.db.neo4j import get_driver
from app.services.user_output_service import UserOutputService
from app.schemas.manual_intake import ManualIntakeRequest, ManualIntakeResponse


router = APIRouter(prefix="/complaint", tags=["complaint-intake"])

@router.post("/intake/manual", response_model=ManualIntakeResponse)
async def complaint_intake_manual(req: ManualIntakeRequest):
    # create case
    case_id = CaseService.create_case(req.complaint_text or "")

    # store provided facts
    if req.facts:
        CaseService.add_facts_bulk(case_id, req.facts)

    # deterministic reasoning
    reasoning_result = ReasoningService.run_reasoning(case_id) or {}
    print("REASONING_RESULT (MANUAL):", reasoning_result)

    # keep output stable for frontend
    reasoning_result.setdefault("fired_rules", [])
    reasoning_result.setdefault("missing_fact_ids", [])
    reasoning_result.setdefault("matched_remedies", [])
    reasoning_result.setdefault("recommended_actions", [])

    # build missing questions
    ask_ids = reasoning_result.get("missing_fact_ids", [])[:6]

    driver = get_driver()
    missing_questions = []
    if ask_ids:
        with driver.session() as session:
            rows = session.run("""
                UNWIND $ids AS fid
                MATCH (f:Fact {fact_id:fid})
                RETURN f.fact_id AS fact_id,
                       coalesce(f.question,"") AS question,
                       coalesce(f.ui_control,"text") AS ui_control,
                       coalesce(f.value_type,"string") AS value_type,
                       coalesce(f.placeholder,"") AS placeholder,
                       coalesce(f.help_text,"") AS help_text,
                       f.validation_regex AS validation_regex,
                       f.min_value AS min_value,
                       f.max_value AS max_value
            """, ids=ask_ids)
            missing_questions = [dict(r) for r in rows]

    user_summary = UserOutputService.simplify_reasoning(reasoning_result)

    return ManualIntakeResponse(
        case_id=case_id,
        extracted_facts=req.facts,
        missing_questions=missing_questions,
        reasoning_result=reasoning_result,
        user_summary=user_summary
    )


@router.post("/intake", response_model=ComplaintIntakeResponse)
async def complaint_intake(req: ComplaintIntakeRequest):
    # 1) load fact dictionary (cached)
    fact_defs = FactCache.get_facts()

    # 2) LLM: validate + extract facts ONLY
    llm = await LLMExtractService.extract_facts_only(
        complaint_text=req.complaint_text,
        fact_defs=fact_defs,
        top_k_questions=req.top_k_questions
    )

    if not llm["is_valid_complaint"]:
        return ComplaintIntakeResponse(
            is_valid_complaint=False,
            validity_reason=llm["validity_reason"]
        )

    # 3) create case
    case_id = CaseService.create_case(req.complaint_text)

    # 4) store extracted facts (bulk)
    CaseService.add_facts_bulk(case_id, llm["facts"])

    # 5) deterministic reasoning (CORE)
    reasoning_result = ReasoningService.run_reasoning(case_id) or {}
    print("REASONING_RESULT (LLM INTAKE):", reasoning_result)
    reasoning_result.setdefault("fired_rules", [])
    reasoning_result.setdefault("missing_fact_ids", [])
    reasoning_result.setdefault("matched_remedies", [])
    reasoning_result.setdefault("recommended_actions", [])

    # 5.1) Embedding-based corpus guidance (NON-DECISION SUPPORT)
    # ✅ Recommended improvement: return guidance even when rules fired
    corpus_guidance_sections = []
    emb = await EmbeddingService.embed_text(req.complaint_text)
    if emb:
        corpus_guidance_sections = CorpusSearchService.search_sections_by_embedding(
            embedding=emb,
            top_k=5
        )

    # 6) Determine missing fact IDs to ask next
    ask_ids = (reasoning_result.get("missing_fact_ids", []) or [])[: req.top_k_questions]

    driver = get_driver()

    # 7) Build missing questions from Neo4j Fact nodes
    missing_questions = []
    if ask_ids:
        with driver.session() as session:
            rows = session.run("""
                UNWIND $ids AS fid
                MATCH (f:Fact {fact_id:fid})
                RETURN f.fact_id AS fact_id,
                       coalesce(f.question,"") AS question,
                       coalesce(f.ui_control,"text") AS ui_control,
                       coalesce(f.value_type,"string") AS value_type,
                       coalesce(f.placeholder,"") AS placeholder,
                       coalesce(f.help_text,"") AS help_text,
                       f.validation_regex AS validation_regex,
                       f.min_value AS min_value,
                       f.max_value AS max_value
            """, ids=ask_ids)

            missing_questions = [dict(r) for r in rows]

    # ✅ user friendly summary (no rule IDs / fact IDs)
    user_summary = UserOutputService.simplify_reasoning(reasoning_result)

    # ✅ ALWAYS RETURN
    return ComplaintIntakeResponse(
        is_valid_complaint=True,
        validity_reason=llm["validity_reason"],
        case_id=case_id,
        extracted_facts=llm["facts"],
        missing_questions=missing_questions,
        reasoning_result=reasoning_result,

        # ✅ UI friendly
        user_summary=user_summary,

        # boundary flags
        decision_mode="DETERMINISTIC_GRAPH",
        corpus_guidance_mode="NON_DECISIONAL",
        corpus_guidance_sections=corpus_guidance_sections,
    )
