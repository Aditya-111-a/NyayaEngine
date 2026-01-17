// =====================================================
// ECOM Phase 1 Rules: Inventory E-commerce Entity Duties (SAFE CITATIONS)
// cypher-shell SAFE MODE
// =====================================================

// ---------- R_ECOM_INV_001 ----------
MATCH (SEC_ECOM_7:Section {section_key:"ECOM_RULES_2020::RULE_7"})
MERGE (r:Rule {rule_id:"R_ECOM_INV_001"})
SET r.name="E-commerce purchase with proof: inventory entity duties may apply", r.enabled=true
MERGE (c1:Condition {condition_id:"COND_ECOM_INV_001_DOMAIN_ECOM"})
SET c1.operator="EQ", c1.value_type="string", c1.value="ECOM"
MERGE (c2:Condition {condition_id:"COND_ECOM_INV_001_PROOF_PURCHASE_TRUE"})
SET c2.operator="EQ", c2.value_type="boolean", c2.value=true
MERGE (f1:Fact {fact_id:"F_DOMAIN"})
MERGE (f2:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f1)
MERGE (c2)-[:USES_FACT]->(f2)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CHECK_INVENTORY_ECOM_ENTITY_DUTIES"})
MERGE (r)-[:CITES]->(SEC_ECOM_7);

// ---------- R_ECOM_INV_002 ----------
MATCH (SEC_ECOM_7:Section {section_key:"ECOM_RULES_2020::RULE_7"})
MERGE (r:Rule {rule_id:"R_ECOM_INV_002"})
SET r.name="Service not provided in e-commerce: escalation to platform grievance", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_INV_002_SERVICE_NOT_PROVIDED_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_SERVICE_NOT_PROVIDED"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
MERGE (r)-[:CITES]->(SEC_ECOM_7);

// ---------- R_ECOM_INV_003 ----------
MATCH (SEC_ECOM_7:Section {section_key:"ECOM_RULES_2020::RULE_7"})
MERGE (r:Rule {rule_id:"R_ECOM_INV_003"})
SET r.name="Defect present: check inventory entity obligations", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_INV_003_DEFECT_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_CONTACT_PLATFORM"})
MERGE (r)-[:CITES]->(SEC_ECOM_7);
