// =====================================================
// Phase 1 Rules (31-40): Platform + payment signals (SAFE CITATIONS)
// =====================================================

MATCH (SEC_ECOM_4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (SEC_ECOM_6:Section {section_key:"ECOM_RULES_2020::RULE_6"})
MATCH (SEC_CPA_COMPLAINT:Section {section_key:"CPA_2019::2(6)"})
MATCH (SEC_CPA_UTP:Section {section_key:"CPA_2019::2(47)"})
WITH SEC_ECOM_4,SEC_ECOM_6,SEC_CPA_COMPLAINT,SEC_CPA_UTP

// R_ECOM_031 Escalate to grievance officer
MERGE (r:Rule {rule_id:"R_ECOM_031"})
SET r.name="Escalate to grievance officer (platform accountability)", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_031_SELLER_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_032 Contact seller first if not contacted
MERGE (r:Rule {rule_id:"R_ECOM_032"})
SET r.name="Contact seller in writing first", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_032_SELLER_CONTACTED_FALSE"})
SET c.operator="EQ", c.value_type="boolean", c.value=false
MERGE (f:Fact {fact_id:"F_SELLER_CONTACTED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_SELLER"})
MERGE (r)-[:CITES]->(SEC_ECOM_6);

// R_ECOM_033 Seller response delayed > 7 days
MERGE (r:Rule {rule_id:"R_ECOM_033"})
SET r.name="Seller response delayed > 7 days", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_033_SELLER_RESP_GT_7"})
SET c.operator="GT", c.value_type="number", c.value=7
MERGE (f:Fact {fact_id:"F_SELLER_RESPONSE_DAYS"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_034 Amount paid > 0 => preserve invoice
MERGE (r:Rule {rule_id:"R_ECOM_034"})
SET r.name="Amount paid recorded: preserve invoice", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_034_AMOUNT_GT_0"})
SET c.operator="GT", c.value_type="number", c.value=0
MERGE (f:Fact {fact_id:"F_AMOUNT_PAID"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_035 Overcharging => UTP
MERGE (r:Rule {rule_id:"R_ECOM_035"})
SET r.name="Overcharging indicates unfair trade practice", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_035_OVERCHARGING_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_OVERCHARGING"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_STOP_UNFAIR_PRACTICE"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_CPA_UTP);

// R_ECOM_036 Payment mode provided => keep proof
MERGE (r:Rule {rule_id:"R_ECOM_036"})
SET r.name="Payment mode recorded: keep transaction proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_036_PAYMENT_MODE_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_PAYMENT_MODE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_037 Communication proof missing => collect
MERGE (r:Rule {rule_id:"R_ECOM_037"})
SET r.name="Collect communication proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_037_COMM_PROOF_MISSING"})
SET c.operator="EQ", c.value_type="string", c.value=""
MERGE (f:Fact {fact_id:"F_COMMUNICATION_PROOF"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_038 Photo/video proof missing => collect
MERGE (r:Rule {rule_id:"R_ECOM_038"})
SET r.name="Collect photo/video proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_038_PHOTO_PROOF_MISSING"})
SET c.operator="EQ", c.value_type="string", c.value=""
MERGE (f:Fact {fact_id:"F_PHOTO_VIDEO_PROOF"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_PHOTO_VIDEO"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_039 Complaint type present => filing possible
MERGE (r:Rule {rule_id:"R_ECOM_039"})
SET r.name="Complaint identified: filing possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_039_COMPLAINT_TYPE_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_COMPLAINT_TYPE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_040 Complaint date exists => preserve timeline
MERGE (r:Rule {rule_id:"R_ECOM_040"})
SET r.name="Timeline preservation for complaint", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_040_COMPLAINT_DATE_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);
