// =====================================================
// Phase 1 Rules (41-50): Warranty/service + misleading ads (SAFE CITATIONS)
// =====================================================

MATCH (SEC_ECOM_2:Section {section_key:"ECOM_RULES_2020::RULE_2"})
MATCH (SEC_ECOM_4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (SEC_ECOM_8:Section {section_key:"ECOM_RULES_2020::RULE_8"})
MATCH (SEC_CPA_DEFECT:Section {section_key:"CPA_2019::2(10)"})
MATCH (SEC_CPA_DEFICIENCY:Section {section_key:"CPA_2019::2(11)"})
MATCH (SEC_CPA_MISLEADING:Section {section_key:"CPA_2019::2(28)"})
MATCH (SEC_CPA_UTP:Section {section_key:"CPA_2019::2(47)"})
MATCH (SEC_CPA_21:Section {section_key:"CPA_2019::21"})
WITH SEC_ECOM_2,SEC_ECOM_4,SEC_ECOM_8,SEC_CPA_DEFECT,SEC_CPA_DEFICIENCY,SEC_CPA_MISLEADING,SEC_CPA_UTP,SEC_CPA_21

// R_ECOM_041 Warranty exists but denied
MERGE (r:Rule {rule_id:"R_ECOM_041"})
SET r.name="Warranty exists but denied", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_041_WARRANTY_EXISTS_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_041_WARRANTY_DENIED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_WARRANTY_EXISTS"})
MERGE (f2:Fact {fact_id:"F_WARRANTY_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REPAIR"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_042 Service not provided
MERGE (r:Rule {rule_id:"R_ECOM_042"})
SET r.name="Service not provided as promised", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_042_SERVICE_NOT_PROVIDED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SERVICE_NOT_PROVIDED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_REFUND"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_043 Deficiency in service indicated
MERGE (r:Rule {rule_id:"R_ECOM_043"})
SET r.name="Deficiency in service indicated", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_043_DEFICIENCY_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFICIENCY);

// R_ECOM_044 Misleading advertisement
MERGE (r:Rule {rule_id:"R_ECOM_044"})
SET r.name="Misleading advertisement indicated", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_044_MISLEADING_AD_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_STOP_UNFAIR_PRACTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_MISLEADING)
MERGE (r)-[:CITES]->(SEC_CPA_21);

// R_ECOM_045 Unfair trade practice indicated
MERGE (r:Rule {rule_id:"R_ECOM_045"})
SET r.name="Unfair trade practice indicated", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_045_UTP_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_STOP_UNFAIR_PRACTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_UTP);

// R_ECOM_046 Misleading ad + refund denied
MERGE (r:Rule {rule_id:"R_ECOM_046"})
SET r.name="Misleading ad + refund denied", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_046_MISLEADING_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_ECOM_046_REFUND_DENIED_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (f2:Fact {fact_id:"F_REFUND_DENIED"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
MERGE (r)-[:CITES]->(SEC_CPA_21);

// R_ECOM_047 Defect type present => mention with proof
MERGE (r:Rule {rule_id:"R_ECOM_047"})
SET r.name="Defect type should be mentioned with proof", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_047_DEFECT_TYPE_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_DEFECT_TYPE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_LEGAL_NOTICE"})
MERGE (r)-[:CITES]->(SEC_CPA_DEFECT);

// R_ECOM_048 Preserve product listing/details
MERGE (r:Rule {rule_id:"R_ECOM_048"})
SET r.name="Preserve product listing/details", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_048_PRODUCT_TYPE_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_PRODUCT_TYPE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_INVOICE"})
MERGE (r)-[:CITES]->(SEC_ECOM_4);

// R_ECOM_049 Domain: scope applies
MERGE (r:Rule {rule_id:"R_ECOM_049"})
SET r.name="E-commerce domain: scope applies", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_049_DOMAIN_PRESENT"})
SET c.operator="GT", c.value_type="string", c.value=" "
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_ECOM_2);

// R_ECOM_050 Contravention indicator (cite Rule 8)
MERGE (r:Rule {rule_id:"R_ECOM_050"})
SET r.name="Contravention of E-commerce rules (indicator)", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_050_SELLER_DENIED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_ECOM_8);
