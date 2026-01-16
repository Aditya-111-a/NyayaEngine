// =======================================
// CPA Rules MVP (Stage 2.3)
// 30+ rules with citations, remedies, actions
// =======================================

// Helper: fetch sections
MATCH (s_defect:Section {section_id:"CPA2019_S2_DEFECT"})
MATCH (s_deficiency:Section {section_id:"CPA2019_S2_DEFICIENCY"})
MATCH (s_complaint:Section {section_id:"CPA2019_S2_COMPLAINT"})
MATCH (s_consumer:Section {section_id:"CPA2019_S2_CONSUMER"})
MATCH (s_utp:Section {section_id:"CPA2019_S2_UTP"})
MATCH (s_mislead:Section {section_id:"CPA2019_S2_MISLEADING_AD"})
MATCH (s_ccpa_pow:Section {section_id:"CPA2019_S18_CCPA_POWERS"})
MATCH (s_penalty_ad:Section {section_id:"CPA2019_S21_MISLEADING_AD_PENALTY"})
WITH s_defect, s_deficiency, s_complaint, s_consumer, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad


// -----------------------------------------------------
// RULE GROUP 1: BASIC CONSUMER + COMPLAINT VALIDITY
// -----------------------------------------------------

// RULE 1: Proof of purchase missing -> collect evidence
MERGE (r:Rule {rule_id:"RULE_EVIDENCE_COLLECT"})
SET r.name="Collect evidence when proof missing",
    r.description="If proof of purchase is missing, recommend collecting evidence first.",
    r.priority=1000,
    r.enabled=true
MERGE (r)-[:CITES]->(s_complaint)
WITH r, s_complaint, s_defect, s_deficiency, s_consumer, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
MERGE (c:Condition {cond_id:"COND_RULE_EVIDENCE_COLLECT_1"})
SET c.operator="EQ", c.value="false", c.value_type="BOOL"
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
WITH r
MATCH (a:Action {action_id:"A_COLLECT_EVIDENCE"})
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"R_COMPENSATION"}) // placeholder remedy ensures output not empty
MERGE (r)-[:PRODUCES_REMEDY]->(:Remedy {remedy_id:"R_REFUND"})
;

// RULE 2: Seller not contacted -> send written request first
MERGE (r:Rule {rule_id:"RULE_CONTACT_SELLER_FIRST"})
SET r.name="Contact seller/provider first",
    r.description="If consumer has not contacted seller/provider, recommend written request first.",
    r.priority=950,
    r.enabled=true
MERGE (r)-[:CITES]->(s_complaint)
WITH r, s_defect, s_deficiency, s_complaint, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (f:Fact {fact_id:"F_SELLER_CONTACTED"})
MERGE (c:Condition {cond_id:"COND_RULE_CONTACT_SELLER_FIRST_1"})
SET c.operator="EQ", c.value="false", c.value_type="BOOL"
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
WITH r
MATCH (rem:Remedy {remedy_id:"R_REPAIR"})
MERGE (r)-[:PRODUCES_REMEDY]->(rem)
;

// -----------------------------------------------------
// RULE GROUP 2: DEFECTIVE GOODS
// -----------------------------------------------------

// RULE 3: Defect present within 7 days -> replacement/refund
MERGE (r:Rule {rule_id:"RULE_DEFECT_WITHIN_7"})
SET r.name="Defect within 7 days",
    r.description="If defect exists and purchase within 7 days: replacement/refund.",
    r.priority=800,
    r.enabled=true
MERGE (r)-[:CITES]->(s_defect)
WITH r, s_defect, s_deficiency, s_complaint, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (f_def:Fact {fact_id:"F_DEFECT_PRESENT"})
MATCH (f_days:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
MERGE (c1:Condition {cond_id:"COND_RULE_DEFECT_WITHIN_7_1"})
SET c1.operator="EQ", c1.value="true", c1.value_type="BOOL"
MERGE (c2:Condition {cond_id:"COND_RULE_DEFECT_WITHIN_7_2"})
SET c2.operator="LTE", c2.value="7", c2.value_type="NUMBER"
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f_def)
MERGE (c2)-[:USES_FACT]->(f_days)
WITH r
MATCH (rep:Remedy {remedy_id:"R_REPLACE"}), (ref:Remedy {remedy_id:"R_REFUND"})
MERGE (r)-[:PRODUCES_REMEDY]->(rep)
MERGE (r)-[:PRODUCES_REMEDY]->(ref)
;

// RULE 4: Defect present within 30 days -> replacement/repair/refund
MERGE (r:Rule {rule_id:"RULE_DEFECT_WITHIN_30"})
SET r.name="Defect within 30 days",
    r.description="Defect present within 30 days: replacement/repair/refund.",
    r.priority=780,
    r.enabled=true
MERGE (r)-[:CITES]->(s_defect)
WITH r, s_defect, s_deficiency, s_complaint, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (f_def:Fact {fact_id:"F_DEFECT_PRESENT"})
MATCH (f_days:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
MERGE (c1:Condition {cond_id:"COND_RULE_DEFECT_WITHIN_30_1"})
SET c1.operator="EQ", c1.value="true", c1.value_type="BOOL"
MERGE (c2:Condition {cond_id:"COND_RULE_DEFECT_WITHIN_30_2"})
SET c2.operator="LTE", c2.value="30", c2.value_type="NUMBER"
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(f_def)
MERGE (c2)-[:USES_FACT]->(f_days)
WITH r
MATCH (rep:Remedy {remedy_id:"R_REPLACE"}), (ref:Remedy {remedy_id:"R_REFUND"}), (repair:Remedy {remedy_id:"R_REPAIR"})
MERGE (r)-[:PRODUCES_REMEDY]->(rep)
MERGE (r)-[:PRODUCES_REMEDY]->(repair)
MERGE (r)-[:PRODUCES_REMEDY]->(ref)
;

// RULE 5: Warranty exists and denied -> file complaint
MERGE (r:Rule {rule_id:"RULE_WARRANTY_DENIED"})
SET r.name="Warranty denied",
    r.description="If warranty exists but denied, consumer can seek remedy for defect/deficiency.",
    r.priority=760,
    r.enabled=true
MERGE (r)-[:CITES]->(s_defect)
WITH r, s_defect, s_deficiency, s_complaint, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (fw:Fact {fact_id:"F_WARRANTY_EXISTS"})
MATCH (fd:Fact {fact_id:"F_WARRANTY_DENIED"})
MERGE (c1:Condition {cond_id:"COND_RULE_WARRANTY_DENIED_1"})
SET c1.operator="EQ", c1.value="true", c1.value_type="BOOL"
MERGE (c2:Condition {cond_id:"COND_RULE_WARRANTY_DENIED_2"})
SET c2.operator="EQ", c2.value="true", c2.value_type="BOOL"
MERGE (r)-[:HAS_CONDITION]->(c1)
MERGE (r)-[:HAS_CONDITION]->(c2)
MERGE (c1)-[:USES_FACT]->(fw)
MERGE (c2)-[:USES_FACT]->(fd)
WITH r
MATCH (ref:Remedy {remedy_id:"R_REFUND"}), (comp:Remedy {remedy_id:"R_COMPENSATION"})
MERGE (r)-[:PRODUCES_REMEDY]->(ref)
MERGE (r)-[:PRODUCES_REMEDY]->(comp)
;


// -----------------------------------------------------
// RULE GROUP 3: DELIVERY ISSUES
// -----------------------------------------------------

// RULE 6: Non-delivery -> delivery or refund
MERGE (r:Rule {rule_id:"RULE_NON_DELIVERY"})
SET r.name="Non-delivery of goods",
    r.description="If product not delivered, recommend delivery or refund.",
    r.priority=820,
    r.enabled=true
MERGE (r)-[:CITES]->(s_complaint)
WITH r, s_defect, s_deficiency, s_complaint, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (f:Fact {fact_id:"F_NON_DELIVERY"})
MERGE (c:Condition {cond_id:"COND_RULE_NON_DELIVERY_1"})
SET c.operator="EQ", c.value="true", c.value_type="BOOL"
MERGE (r)-[:HAS_CONDITION]->(c)
MERGE (c)-[:USES_FACT]->(f)
WITH r
MATCH (rem:Remedy {remedy_id:"R_DELIVERY_OR_REFUND"}), (comp:Remedy {remedy_id:"R_COMPENSATION"})
MERGE (r)-[:PRODUCES_REMEDY]->(rem)
MERGE (r)-[:PRODUCES_REMEDY]->(comp)
;

// RULE 7: Delivery delayed > 7 days -> compensation + delivery/refund
MERGE (r:Rule {rule_id:"RULE_DELIVERY_DELAYED_GT7"})
SET r.name="Delivery delayed >7 days",
    r.description="If delivery delayed and delay > 7 days, recommend compensation and delivery/refund.",
    r.priority=790,
    r.enabled=true
MERGE (r)-[:CITES]->(s_complaint)
WITH r, s_complaint, s_defect, s_deficiency, s_utp, s_mislead, s_ccpa_pow, s_penalty_ad
MATCH (fd:Fact {fact_id:"F_DELIVERY_DELAYED"})
MATCH (fdd:Fact {fact_id:"F_DAYS_DELAYED"})
MERGE (c1:

