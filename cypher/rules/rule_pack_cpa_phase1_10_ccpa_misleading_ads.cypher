// =====================================================
// CPA Phase 1 Rules: CCPA + Misleading Ads (SAFE CITATIONS)
// cypher-shell SAFE MODE: each rule block = one statement ending with ;
// =====================================================

// ---------- R_CPA_CCPA_001 ----------
MATCH (SEC_CPA_S21:Section {section_key:"CPA_2019::S_21"})
MATCH (SEC_CPA_S18:Section {section_key:"CPA_2019::S_18"})
MERGE (r:Rule {rule_id:"R_CPA_CCPA_001"})
SET r.name="Misleading advertisement: CCPA directions/penalty possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_CCPA_001_MISLEADING_AD_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_STOP_MISLEADING_AD"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_TO_CCPA"})
MERGE (r)-[:CITES]->(SEC_CPA_S21)
MERGE (r)-[:CITES]->(SEC_CPA_S18);

// ---------- R_CPA_CCPA_002 ----------
MATCH (SEC_CPA_S18:Section {section_key:"CPA_2019::S_18"})
MATCH (SEC_CPA_S10:Section {section_key:"CPA_2019::S_10"})
MERGE (r:Rule {rule_id:"R_CPA_CCPA_002"})
SET r.name="Unfair trade practice: CCPA investigation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_CCPA_002_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_CCPA_INVESTIGATION"})
MERGE (r)-[:CITES]->(SEC_CPA_S18)
MERGE (r)-[:CITES]->(SEC_CPA_S10);

// ---------- R_CPA_CCPA_003 ----------
MATCH (SEC_CPA_S22:Section {section_key:"CPA_2019::S_22"})
MERGE (r:Rule {rule_id:"R_CPA_CCPA_003"})
SET r.name="Misleading ad: collect ad evidence", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_CCPA_003_MISLEADING_AD_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_AD_SCREENSHOTS_LINKS"})
MERGE (r)-[:CITES]->(SEC_CPA_S22);

// ---------- R_CPA_CCPA_004 ----------
MATCH (SEC_CPA_S20:Section {section_key:"CPA_2019::S_20"})
MERGE (r:Rule {rule_id:"R_CPA_CCPA_004"})
SET r.name="UTP: consider recall/withdrawal directions (if applicable)", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_CCPA_004_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONSIDER_RECALL_WITHDRAWAL_DIRECTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S20);
