// =====================================================
// CPA Phase 1 Rules: Procedure + Enforcement (SAFE CITATIONS)
// cypher-shell SAFE MODE: each rule block = one statement ending with ;
// =====================================================

// ---------- R_CPA_PROC_001 ----------
MATCH (SEC_CPA_S35:Section {section_key:"CPA_2019::S_35"})
MATCH (SEC_CPA_S38:Section {section_key:"CPA_2019::S_38"})
MERGE (r:Rule {rule_id:"R_CPA_PROC_001"})
SET r.name="CPA filing: cite complaint filing procedure", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PROC_001_COMPLAINT_DATE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_COMPLAINT_BEFORE_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_S35)
MERGE (r)-[:CITES]->(SEC_CPA_S38);

// ---------- R_CPA_PROC_002 ----------
MATCH (SEC_CPA_S65:Section {section_key:"CPA_2019::S_65"})
MATCH (SEC_CPA_S36:Section {section_key:"CPA_2019::S_36"})
MERGE (r:Rule {rule_id:"R_CPA_PROC_002"})
SET r.name="Proceedings: service of notice provisions applicable", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PROC_002_COMPLAINT_DATE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_S36)
MERGE (r)-[:CITES]->(SEC_CPA_S65);

// ---------- R_CPA_PROC_003 ----------
MATCH (SEC_CPA_S71:Section {section_key:"CPA_2019::S_71"})
MATCH (SEC_CPA_S72:Section {section_key:"CPA_2019::S_72"})
MATCH (SEC_CPA_S73:Section {section_key:"CPA_2019::S_73"})
MERGE (r:Rule {rule_id:"R_CPA_PROC_003"})
SET r.name="Refund denied: consider order enforcement routes", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PROC_003_REFUND_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_SEEK_ENFORCEMENT_OF_ORDER"})
MERGE (r)-[:CITES]->(SEC_CPA_S71)
MERGE (r)-[:CITES]->(SEC_CPA_S72)
MERGE (r)-[:CITES]->(SEC_CPA_S73);

// ---------- R_CPA_PROC_004 ----------
MATCH (SEC_CPA_S89:Section {section_key:"CPA_2019::S_89"})
MERGE (r:Rule {rule_id:"R_CPA_PROC_004"})
SET r.name="Misleading advertisement: punishment provision cite", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PROC_004_MISLEADING_AD_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_S89);

// ---------- R_CPA_PROC_005 ----------
MATCH (SEC_CPA_S94:Section {section_key:"CPA_2019::S_94"})
MERGE (r:Rule {rule_id:"R_CPA_PROC_005"})
SET r.name="UTP: cite measures preventing unfair practices", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PROC_005_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_S94);
