// =====================================================
// ECOM Phase 1 Rules: Scope / Applicability / Definitions (SAFE CITATIONS)
// cypher-shell SAFE MODE
// =====================================================

// ---------- R_ECOM_SD_001 ----------
MATCH (SEC_ECOM_1:Section {section_key:"ECOM_RULES_2020::RULE_1"})
MATCH (SEC_ECOM_2:Section {section_key:"ECOM_RULES_2020::RULE_2"})
MATCH (SEC_ECOM_3:Section {section_key:"ECOM_RULES_2020::RULE_3"})
MERGE (r:Rule {rule_id:"R_ECOM_SD_001"})
SET r.name="E-commerce complaint: cite E-Commerce Rules scope/applicability", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_SD_001_DOMAIN_ECOM"})
SET c.operator="EQ", c.value_type="string", c.value="ECOM"
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_ECOM_2)
MERGE (r)-[:CITES]->(SEC_ECOM_1);

// ---------- R_ECOM_SD_002 ----------
MATCH (SEC_ECOM_3:Section {section_key:"ECOM_RULES_2020::RULE_3"})
MERGE (r:Rule {rule_id:"R_ECOM_SD_002"})
SET r.name="E-commerce complaint: cite key definitions", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_SD_002_DOMAIN_ECOM"})
SET c.operator="EQ", c.value_type="string", c.value="ECOM"
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_ECOM_3);

// ---------- R_ECOM_SD_003 ----------
MATCH (SEC_ECOM_2:Section {section_key:"ECOM_RULES_2020::RULE_2"})
MERGE (r:Rule {rule_id:"R_ECOM_SD_003"})
SET r.name="Domain missing: ask if ECOM or CONSUMER", r.enabled=true
MERGE (c:Condition {condition_id:"COND_ECOM_SD_003_DOMAIN_NOT_EXISTS"})
SET c.operator="NOT_EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:RECOMMENDS_ACTION]->(:Action {action_id:"ACT_ASK_DOMAIN_ECOM_OR_CONSUMER"})
MERGE (r)-[:CITES]->(SEC_ECOM_2);
