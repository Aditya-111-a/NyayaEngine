// =====================================================
// CPA Phase 1 Utility Pack: Bridge citations for duplicate keys + definitions
// cypher-shell SAFE MODE: each rule block = one statement ending with ;
// =====================================================

// ---------- R_CPA_BRIDGE_001 ----------
MATCH (SEC_DEF_AD:Section {section_key:"CPA_2019::2(1)"})
MATCH (SEC_DEF_DEFECT:Section {section_key:"CPA_2019::2(1)(f)"})
MATCH (SEC_DEF_DEFICIENCY:Section {section_key:"CPA_2019::2(1)(g)"})
MATCH (SEC_DEF_MISLEAD:Section {section_key:"CPA_2019::2(28)"})
MATCH (SEC_DEF_CONSUMER:Section {section_key:"CPA_2019::2(7)"})
MERGE (r:Rule {rule_id:"R_CPA_BRIDGE_001"})
SET r.name="CPA Definitions: cite key definitions for complaint interpretation", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_BRIDGE_001_DOMAIN_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_DEF_AD)
MERGE (r)-[:CITES]->(SEC_DEF_CONSUMER)
MERGE (r)-[:CITES]->(SEC_DEF_DEFECT)
MERGE (r)-[:CITES]->(SEC_DEF_DEFICIENCY)
MERGE (r)-[:CITES]->(SEC_DEF_MISLEAD);

// ---------- R_CPA_BRIDGE_002 ----------
MATCH (SEC_CPA_10:Section {section_key:"CPA_2019::10"})
MATCH (SEC_CPA_S10:Section {section_key:"CPA_2019::S_10"})
MERGE (r:Rule {rule_id:"R_CPA_BRIDGE_002"})
SET r.name="CCPA establishment: cite both duplicate keys", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_BRIDGE_002_DOMAIN_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_10)
MERGE (r)-[:CITES]->(SEC_CPA_S10);

// ---------- R_CPA_BRIDGE_003 ----------
MATCH (SEC_CPA_18:Section {section_key:"CPA_2019::18"})
MATCH (SEC_CPA_S18:Section {section_key:"CPA_2019::S_18"})
MERGE (r:Rule {rule_id:"R_CPA_BRIDGE_003"})
SET r.name="CCPA powers/functions: cite both duplicate keys", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_BRIDGE_003_DOMAIN_EXISTS"})
SET c.operator="EXISTS", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_DOMAIN"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_18)
MERGE (r)-[:CITES]->(SEC_CPA_S18);

// ---------- R_CPA_BRIDGE_004 ----------
MATCH (SEC_CPA_21:Section {section_key:"CPA_2019::21"})
MATCH (SEC_CPA_S21:Section {section_key:"CPA_2019::S_21"})
MERGE (r:Rule {rule_id:"R_CPA_BRIDGE_004"})
SET r.name="Misleading advertisement directions/penalties: cite both duplicate keys", r.enabled=true
MERGE (c:Condition {condition_id:"COND_CPA_BRIDGE_004_MISLEADING_AD_TRUE"})
SET c.operator="EQ", c.value_type="boolean", c.value=true
MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
MERGE (r)-[:CITES]->(SEC_CPA_21)
MERGE (r)-[:CITES]->(SEC_CPA_S21);
