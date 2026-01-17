// =====================================================
// CPA Phase 1 Rules: Mediation (SAFE CITATIONS)
// cypher-shell SAFE MODE: each rule block = one statement ending with ;
// =====================================================

// ---------- R_CPA_MED_001 ----------
MATCH (SEC_CPA_S37:Section {section_key:"CPA_2019::S_37"})
MATCH (SEC_CPA_S74:Section {section_key:"CPA_2019::S_74"})
MERGE (r:Rule {rule_id:"R_CPA_MED_001"})
SET r.name="Complaint exists (defect): mediation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_MED_001_DEFECT_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_OFFER_MEDIATION_OPTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S37)
MERGE (r)-[:CITES]->(SEC_CPA_S74);

// ---------- R_CPA_MED_002 ----------
MATCH (SEC_CPA_S37:Section {section_key:"CPA_2019::S_37"})
MATCH (SEC_CPA_S74:Section {section_key:"CPA_2019::S_74"})
MERGE (r:Rule {rule_id:"R_CPA_MED_002"})
SET r.name="Deficiency in service: mediation possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_MED_002_DEFICIENCY_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_OFFER_MEDIATION_OPTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S37)
MERGE (r)-[:CITES]->(SEC_CPA_S74);

// ---------- R_CPA_MED_003 ----------
MATCH (SEC_CPA_S37:Section {section_key:"CPA_2019::S_37"})
MERGE (r:Rule {rule_id:"R_CPA_MED_003"})
SET r.name="Refund denied: mediation before escalation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_MED_003_REFUND_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_OFFER_MEDIATION_OPTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S37);

// ---------- R_CPA_MED_004 ----------
MATCH (SEC_CPA_S37:Section {section_key:"CPA_2019::S_37"})
MERGE (r:Rule {rule_id:"R_CPA_MED_004"})
SET r.name="Replacement denied: mediation before escalation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_MED_004_REPLACEMENT_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_OFFER_MEDIATION_OPTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S37);
