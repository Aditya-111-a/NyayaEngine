// =====================================================
// Phase 1 Rules (21-30): Refund / replacement denial (SAFE CITATIONS)
// =====================================================

MATCH (SEC_ECOM_4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (SEC_ECOM_5:Section {section_key:"ECOM_RULES_2020::RULE_5"})
MATCH (SEC_CPA_COMPLAINT:Section {section_key:"CPA_2019::2(6)"})
MATCH (SEC_CPA_DEFECT:Section {section_key:"CPA_2019::2(10)"})
MATCH (SEC_CPA_UTP:Section {section_key:"CPA_2019::2(47)"})
WITH SEC_ECOM_4,SEC_ECOM_5,SEC_CPA_COMPLAINT,SEC_CPA_DEFECT,SEC_CPA_UTP

// R_ECOM_021 Refund requested => recommend refund process
MERGE (r:Rule {rule_id:"R_ECOM_021"})
SET r.name="Refund requested: follow platform procedure", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_021_REFUND_REQUESTED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REFUND"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_022 Refund denied => escalation
MERGE (r:Rule {rule_id:"R_ECOM_022"})
SET r.name="Refund denied: formal escalation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_022_REFUND_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_ECOM_5)
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_023 Replacement requested
MERGE (r:Rule {rule_id:"R_ECOM_023"})
SET r.name="Replacement requested", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_023_REPL_REQUESTED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REPLACEMENT_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REPLACEMENT"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_024 Replacement denied => escalation
MERGE (r:Rule {rule_id:"R_ECOM_024"})
SET r.name="Replacement denied: escalation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_024_REPL_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_025 Refund denied + invoice available => send notice
MERGE (r:Rule {rule_id:"R_ECOM_025"})
SET r.name="Refund denied + invoice available: send notice", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_025_REFUND_DENIED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_025_INVOICE_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (f2:Fact {fact_id:"F_INVOICE_AVAILABLE"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_026 Replacement denied + defect present => refund route
MERGE (r:Rule {rule_id:"R_ECOM_026"})
SET r.name="Replacement denied + defect: request refund", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_026_REPL_DENIED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_026_DEFECT_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_REPLACEMENT_DENIED"})
MERGE (f2:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REFUND"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFECT);

// R_ECOM_027 Refund denied after seller contacted
MERGE (r:Rule {rule_id:"R_ECOM_027"})
SET r.name="Refund denied after seller contacted", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_027_REFUND_DENIED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_027_SELLER_CONTACTED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (f2:Fact {fact_id:"F_SELLER_CONTACTED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_028 Refund requested + delay > 7 days => compensation
MERGE (r:Rule {rule_id:"R_ECOM_028"})
SET r.name="Refund requested + long delay: compensation", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_028_REFUND_REQUESTED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_028_DAYS_DELAYED_GT_7"})
SET c2.operator="GT", c2.value_type="number", c2.value=7
MERGE (f1:Fact {fact_id:"F_REFUND_REQUESTED"})
MERGE (f2:Fact {fact_id:"F_DAYS_DELAYED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_029 Refund denied as UTP indicator
MERGE (r:Rule {rule_id:"R_ECOM_029"})
SET r.name="Refund denied as unfair trade practice (indicator)", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_029_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_STOP_UNFAIR_PRACTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_UTP);

// R_ECOM_030 Replacement denied + refund denied => file complaint
MERGE (r:Rule {rule_id:"R_ECOM_030"})
SET r.name="Replacement denied + refund denied => file complaint", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_030_REPL_DENIED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_030_REFUND_DENIED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_REPLACEMENT_DENIED"})
MERGE (f2:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);
