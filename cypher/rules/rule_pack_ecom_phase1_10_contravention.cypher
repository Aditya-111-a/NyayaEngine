// =====================================================
// ECOM Phase 1 Rules: Contravention of Rules (SAFE CITATIONS)
// cypher-shell SAFE MODE
// =====================================================

// ---------- R_ECOM_CONTRA_001 ----------
MATCH (SEC_ECOM_8:Section {section_key:"ECOM_RULES_2020::RULE_8"})
MERGE (r:Rule {rule_id:"R_ECOM_CONTRA_001"})
SET r.name="Refund denied: contravention escalation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_CONTRA_001_REFUND_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_8);

// ---------- R_ECOM_CONTRA_002 ----------
MATCH (SEC_ECOM_8:Section {section_key:"ECOM_RULES_2020::RULE_8"})
MERGE (r:Rule {rule_id:"R_ECOM_CONTRA_002"})
SET r.name="Replacement denied: contravention escalation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_CONTRA_002_REPLACEMENT_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_8);

// ---------- R_ECOM_CONTRA_003 ----------
MATCH (SEC_ECOM_8:Section {section_key:"ECOM_RULES_2020::RULE_8"})
MERGE (r:Rule {rule_id:"R_ECOM_CONTRA_003"})
SET r.name="Non-delivery: contravention escalation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_CONTRA_003_NON_DELIVERY_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_NON_DELIVERY"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_8);

// ---------- R_ECOM_CONTRA_004 ----------
MATCH (SEC_ECOM_8:Section {section_key:"ECOM_RULES_2020::RULE_8"})
MERGE (r:Rule {rule_id:"R_ECOM_CONTRA_004"})
SET r.name="Unfair trade practice: contravention escalation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_CONTRA_004_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_TO_CCPA"})
MERGE (r)-[:CITES]->(SEC_ECOM_8);
