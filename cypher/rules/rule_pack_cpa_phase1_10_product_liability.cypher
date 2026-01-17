// =====================================================
// CPA Phase 1 Rules: Product Liability (SAFE CITATIONS)
// cypher-shell SAFE MODE: each rule block = one statement ending with ;
// =====================================================

// ---------- R_CPA_PL_001 ----------
MATCH (SEC_CPA_S83:Section {section_key:"CPA_2019::S_83"})
MATCH (SEC_CPA_S84:Section {section_key:"CPA_2019::S_84"})
MERGE (r:Rule {rule_id:"R_CPA_PL_001"})
SET r.name="Defective product + proof: product liability action possible", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_CPA_PL_001_DEFECT_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_CPA_PL_001_PROOF_PURCHASE_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (f2:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONSIDER_PRODUCT_LIABILITY_ACTION"})
MERGE (r)-[:CITES]->(SEC_CPA_S83)
MERGE (r)-[:CITES]->(SEC_CPA_S84);

// ---------- R_CPA_PL_002 ----------
MATCH (SEC_CPA_S83:Section {section_key:"CPA_2019::S_83"})
MATCH (SEC_CPA_S84:Section {section_key:"CPA_2019::S_84"})
MERGE (r:Rule {rule_id:"R_CPA_PL_002"})
SET r.name="Defect with photo/video proof: strengthen product liability evidence", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_CPA_PL_002_DEFECT_TRUE"})
SET c1.operator="EQ", c1.value_type="boolean", c1.value=true
MERGE (c2:Condition {condition_id:"COND_CPA_PL_002_PHOTO_PROOF_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (f2:Fact {fact_id:"F_PHOTO_VIDEO_PROOF"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_COLLECT_PHOTO_VIDEO"})
MERGE (r)-[:CITES]->(SEC_CPA_S83)
MERGE (r)-[:CITES]->(SEC_CPA_S84);

// ---------- R_CPA_PL_003 ----------
MATCH (SEC_CPA_S83:Section {section_key:"CPA_2019::S_83"})
MATCH (SEC_CPA_S85:Section {section_key:"CPA_2019::S_85"})
MERGE (r:Rule {rule_id:"R_CPA_PL_003"})
SET r.name="Deficiency in service: product service provider liability possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PL_003_DEFICIENCY_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"REM_COMPENSATION"})
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONSIDER_PRODUCT_SERVICE_PROVIDER_LIABILITY"})
MERGE (r)-[:CITES]->(SEC_CPA_S83)
MERGE (r)-[:CITES]->(SEC_CPA_S85);

// ---------- R_CPA_PL_004 ----------
MATCH (SEC_CPA_S83:Section {section_key:"CPA_2019::S_83"})
MATCH (SEC_CPA_S86:Section {section_key:"CPA_2019::S_86"})
MERGE (r:Rule {rule_id:"R_CPA_PL_004"})
SET r.name="E-commerce transaction: product seller liability possible", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PL_004_DOMAIN_ECOM"})
SET c.operator="EQ", c.value_type="string", c.value="ECOM"
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONSIDER_PRODUCT_SELLER_LIABILITY"})
MERGE (r)-[:CITES]->(SEC_CPA_S83)
MERGE (r)-[:CITES]->(SEC_CPA_S86);

// ---------- R_CPA_PL_005 ----------
MATCH (SEC_CPA_S87:Section {section_key:"CPA_2019::S_87"})
MERGE (r:Rule {rule_id:"R_CPA_PL_005"})
SET r.name="Product liability: consider exceptions before proceeding", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_PL_005_DEFECT_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CHECK_PRODUCT_LIABILITY_EXCEPTIONS"})
MERGE (r)-[:CITES]->(SEC_CPA_S87);
