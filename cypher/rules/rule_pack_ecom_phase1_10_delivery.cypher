// =====================================================
// Phase 1 Rules (1-10): Delivery failures (SAFE CITATIONS)
// =====================================================

MATCH (SEC_ECOM_4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (SEC_ECOM_5:Section {section_key:"ECOM_RULES_2020::RULE_5"})
MATCH (SEC_ECOM_6:Section {section_key:"ECOM_RULES_2020::RULE_6"})
MATCH (SEC_CPA_COMPLAINT:Section {section_key:"CPA_2019::2(6)"})
MATCH (SEC_CPA_DEFICIENCY:Section {section_key:"CPA_2019::2(11)"})
WITH SEC_ECOM_4,SEC_ECOM_5,SEC_ECOM_6,SEC_CPA_COMPLAINT,SEC_CPA_DEFICIENCY

// R_ECOM_001 Non-delivery
MERGE (r:Rule {rule_id:"R_ECOM_001"})
SET r.name="Non-delivery of order", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_001_NON_DELIVERY_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_NON_DELIVERY"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_PLATFORM"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_ECOM_4)
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_002 Delivery delayed
MERGE (r:Rule {rule_id:"R_ECOM_002"})
SET r.name="Delivery delayed", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_002_DELIVERY_DELAYED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DELIVERY_DELAYED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_PLATFORM"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_ECOM_4)
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_003 Delay > 7 days
MERGE (r:Rule {rule_id:"R_ECOM_003"})
SET r.name="Delivery delayed more than 7 days", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_003_DAYS_DELAYED_GT_7"})
SET c.operator="GT", c.value_type="number", c.value=7
MERGE (f:Fact {fact_id:"F_DAYS_DELAYED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_004 Proof missing => collect invoice
MERGE (r:Rule {rule_id:"R_ECOM_004"})
SET r.name="Collect proof of purchase when missing", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_004_INVOICE_FALSE"})
SET c.operator="EQ", c.value_type="boolean", c.value=false
MERGE (f:Fact {fact_id:"F_INVOICE_AVAILABLE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_005 Order ID missing => collect
MERGE (r:Rule {rule_id:"R_ECOM_005"})
SET r.name="Collect order ID when missing", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_005_ORDERID_FALSE"})
SET c.operator="EQ", c.value_type="boolean", c.value=false
MERGE (f:Fact {fact_id:"F_ORDER_ID_AVAILABLE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_006 Non-delivery + refund requested
MERGE (r:Rule {rule_id:"R_ECOM_006"})
SET r.name="Non-delivery + refund requested", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_006_NON_DELIVERY_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_006_REFUND_REQUESTED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_NON_DELIVERY"})
MERGE (f2:Fact {fact_id:"F_REFUND_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REFUND"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_007 Delayed delivery + refund requested
MERGE (r:Rule {rule_id:"R_ECOM_007"})
SET r.name="Delivery delayed + refund requested", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_007_DELIVERY_DELAYED_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_007_REFUND_REQUESTED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_DELIVERY_DELAYED"})
MERGE (f2:Fact {fact_id:"F_REFUND_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_008 Delay within 7 days => contact seller first
MERGE (r:Rule {rule_id:"R_ECOM_008"})
SET r.name="Short delay: contact seller", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_008_DAYS_DELAYED_LTE_7"})
SET c.operator="LTE", c.value_type="number", c.value=7
MERGE (f:Fact {fact_id:"F_DAYS_DELAYED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_SELLER"})
MERGE (r)-[:CITES]->(SEC_ECOM_6);

// R_ECOM_009 Delay > 15 days => file complaint
MERGE (r:Rule {rule_id:"R_ECOM_009"})
SET r.name="Long delay: suggest filing consumer complaint", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_009_DAYS_DELAYED_GT_15"})
SET c.operator="GT", c.value_type="number", c.value=15
MERGE (f:Fact {fact_id:"F_DAYS_DELAYED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_010 Non-delivery + invoice exists => legal notice
MERGE (r:Rule {rule_id:"R_ECOM_010"})
SET r.name="Non-delivery + invoice available: send notice", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_010_NON_DELIVERY_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_010_INVOICE_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_NON_DELIVERY"})
MERGE (f2:Fact {fact_id:"F_INVOICE_AVAILABLE"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);
