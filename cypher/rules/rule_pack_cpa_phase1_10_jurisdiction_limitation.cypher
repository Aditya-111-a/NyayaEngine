// =====================================================
// CPA Phase 1 Rules (01-12): Jurisdiction + Limitation (SAFE CITATIONS)
// CYTHER-SHELL SAFE MODE: each rule block is ONE statement ending with ;
// =====================================================

// ---------- R_CPA_001 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_001"})
SET r.name="Complaint date provided: limitation check possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_001_COMPLAINT_DATE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CHECK_LIMITATION_PERIOD"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_002 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_002"})
SET r.name="Complaint date missing: ask complaint date for limitation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_002_COMPLAINT_DATE_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ASK_COMPLAINT_DATE"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_003 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_003"})
SET r.name="Purchase date provided: limitation check possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_003_PURCHASE_DATE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_PURCHASE_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CHECK_LIMITATION_PERIOD"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_004 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_004"})
SET r.name="Purchase date missing: ask purchase date for limitation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_004_PURCHASE_DATE_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_PURCHASE_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ASK_PURCHASE_DATE"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_005 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_005"})
SET r.name="Proof of purchase available: attach for CPA filing", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_005_PROOF_PURCHASE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ATTACH_INVOICE_AND_PAYMENT_PROOF"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_006 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_006"})
SET r.name="Proof of purchase missing: collect invoice/order id/payment proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_006_PROOF_PURCHASE_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE_ORDERID_CHAT"})
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_007 ----------
MATCH (SEC_CPA_S34:Section {section_key:"CPA_2019::S_34"})
MATCH (SEC_CPA_S47:Section {section_key:"CPA_2019::S_47"})
MATCH (SEC_CPA_S58:Section {section_key:"CPA_2019::S_58"})
MATCH (SEC_CPA_JUR_2021:Section {section_key:"CPA_2019::Jurisdiction Rules 2021"})
MERGE (r:Rule {rule_id:"R_CPA_007"})
SET r.name="Domain provided: apply pecuniary jurisdiction framework", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_007_DOMAIN_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_DECIDE_FORUM_BY_PECUNIARY_JURISDICTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S34)
MERGE (r)-[:CITES]->(SEC_CPA_S47)
MERGE (r)-[:CITES]->(SEC_CPA_S58)
MERGE (r)-[:CITES]->(SEC_CPA_JUR_2021);

// ---------- R_CPA_008 ----------
MATCH (SEC_CPA_JUR_2021:Section {section_key:"CPA_2019::Jurisdiction Rules 2021"})
MERGE (r:Rule {rule_id:"R_CPA_008"})
SET r.name="Domain missing: ask if ECOM or CONSUMER complaint", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_008_DOMAIN_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ASK_DOMAIN_ECOM_OR_CONSUMER"})
MERGE (r)-[:CITES]->(SEC_CPA_JUR_2021);

// ---------- R_CPA_009 ----------
MATCH (SEC_CPA_S34:Section {section_key:"CPA_2019::S_34"})
MATCH (SEC_CPA_S47:Section {section_key:"CPA_2019::S_47"})
MATCH (SEC_CPA_S58:Section {section_key:"CPA_2019::S_58"})
MERGE (r:Rule {rule_id:"R_CPA_009"})
SET r.name="Complaint type provided: guide appropriate commission filing", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_009_COMPLAINT_TYPE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_TYPE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_SELECT_APPROPRIATE_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_S34)
MERGE (r)-[:CITES]->(SEC_CPA_S47)
MERGE (r)-[:CITES]->(SEC_CPA_S58);

// ---------- R_CPA_010 ----------
MATCH (SEC_CPA_S34:Section {section_key:"CPA_2019::S_34"})
MERGE (r:Rule {rule_id:"R_CPA_010"})
SET r.name="Complaint type missing: ask complaint type for filing guidance", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_010_COMPLAINT_TYPE_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_TYPE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ASK_COMPLAINT_TYPE"})
MERGE (r)-[:CITES]->(SEC_CPA_S34);

// ---------- R_CPA_011 ----------
MATCH (SEC_CPA_S69:Section {section_key:"CPA_2019::S_69"})
MERGE (r:Rule {rule_id:"R_CPA_011"})
SET r.name="CPA filing: cite limitation section", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_011_COMPLAINT_DATE_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_S69);

// ---------- R_CPA_012 ----------
MATCH (SEC_CPA_JUR_2021:Section {section_key:"CPA_2019::Jurisdiction Rules 2021"})
MERGE (r:Rule {rule_id:"R_CPA_012"})
SET r.name="CPA filing: cite pecuniary jurisdiction rules", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_012_DOMAIN_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_JUR_2021);
