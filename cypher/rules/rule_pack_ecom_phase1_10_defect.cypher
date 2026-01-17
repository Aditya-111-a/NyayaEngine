// =====================================================
// Phase 1 Rules (11-20): Defective / wrong item (SAFE CITATIONS)
// =====================================================

MATCH (SEC_ECOM_4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (SEC_ECOM_5:Section {section_key:"ECOM_RULES_2020::RULE_5"})
MATCH (SEC_ECOM_6:Section {section_key:"ECOM_RULES_2020::RULE_6"})
MATCH (SEC_CPA_DEFECT:Section {section_key:"CPA_2019::2(10)"})
MATCH (SEC_CPA_DEFICIENCY:Section {section_key:"CPA_2019::2(11)"})
MATCH (SEC_CPA_COMPLAINT:Section {section_key:"CPA_2019::2(6)"})
WITH SEC_ECOM_4,SEC_ECOM_5,SEC_ECOM_6,SEC_CPA_DEFECT,SEC_CPA_DEFICIENCY,SEC_CPA_COMPLAINT

// R_ECOM_011 Defect present => replacement/refund possible
MERGE (r:Rule {rule_id:"R_ECOM_011"})
SET r.name="Defective product delivered", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_011_DEFECT_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_PHOTO_VIDEO"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFECT)
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_012 Wrong item delivered
MERGE (r:Rule {rule_id:"R_ECOM_012"})
SET r.name="Wrong item delivered", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_012_WRONG_ITEM_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_WRONG_ITEM_DELIVERED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_PLATFORM"})
MERGE (r)-[:CITES]->(SEC_ECOM_5)
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_013 Defect within 30 days
MERGE (r:Rule {rule_id:"R_ECOM_013"})
SET r.name="Defect within 30 days from purchase", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_013_DAYS_LTE_30"})
SET c.operator="LTE", c.value_type="number", c.value=30
MERGE (f:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFECT);

// R_ECOM_014 Defect alleged: collect proof
MERGE (r:Rule {rule_id:"R_ECOM_014"})
SET r.name="Defect alleged: collect photo/video proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_014_DEFECT_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_PHOTO_VIDEO"})
MERGE (r)-[:CITES]->(SEC_CPA_COMPLAINT);

// R_ECOM_015 Defect + replacement requested
MERGE (r:Rule {rule_id:"R_ECOM_015"})
SET r.name="Defect + replacement requested", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_015_DEFECT_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_015_REPL_REQ_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (f2:Fact {fact_id:"F_REPLACEMENT_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPLACEMENT"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REPLACEMENT"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_016 Wrong item + refund requested
MERGE (r:Rule {rule_id:"R_ECOM_016"})
SET r.name="Wrong item + refund requested", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_016_WRONG_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_016_REFUND_REQ_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_WRONG_ITEM_DELIVERED"})
MERGE (f2:Fact {fact_id:"F_REFUND_REQUESTED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_REQUEST_REFUND"})
MERGE (r)-[:CITES]->(SEC_ECOM_5);

// R_ECOM_017 Seller contacted regarding defect
MERGE (r:Rule {rule_id:"R_ECOM_017"})
SET r.name="Seller contacted regarding defect", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_017_SELLER_CONTACTED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SELLER_CONTACTED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_SELLER"})
MERGE (r)-[:CITES]->(SEC_ECOM_6);

// R_ECOM_018 Seller denied remedy: escalate
MERGE (r:Rule {rule_id:"R_ECOM_018"})
SET r.name="Seller denied remedy: escalate grievance", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_018_SELLER_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_019 Defect + refund denied
MERGE (r:Rule {rule_id:"R_ECOM_019"})
SET r.name="Defect + refund denied", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_019_REFUND_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_020 Defective item + amount paid => compensation possible
MERGE (r:Rule {rule_id:"R_ECOM_020"})
SET r.name="Defective item + amount paid: compensation claim possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_020_AMOUNT_GT_0"})
SET c.operator="GT", c.value_type="number", c.value=0
MERGE (f:Fact {fact_id:"F_AMOUNT_PAID"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);
