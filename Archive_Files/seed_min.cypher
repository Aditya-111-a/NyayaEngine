// ===== Act =====
MERGE (a:Act {act_id:"CPA_2019"})
SET a.name = "Consumer Protection Act",
    a.year = 2019;

// ===== Sections (we will expand later) =====
MERGE (s1:Section {section_id:"CPA2019_S2_1_g"})
SET s1.section_no="2(1)(g)",
    s1.title="Deficiency",
    s1.text="...";

MERGE (s2:Section {section_id:"CPA2019_S2_1_f"})
SET s2.section_no="2(1)(f)",
    s2.title="Defect",
    s2.text="...";

MERGE (a)-[:HAS_SECTION]->(s1);
MERGE (a)-[:HAS_SECTION]->(s2);

// ===== Facts (controlled vocabulary for reasoning engine) =====
MERGE (f1:Fact {fact_id:"F_PRODUCT_TYPE"})
SET f1.name="product_type",
    f1.datatype="STRING",
    f1.description="Type of product/service involved";

MERGE (f2:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
SET f2.name="days_since_purchase",
    f2.datatype="NUMBER",
    f2.description="Days since purchase date";

MERGE (f3:Fact {fact_id:"F_DEFECT_PRESENT"})
SET f3.name="defect_present",
    f3.datatype="BOOL",
    f3.description="Whether defect is present in goods";

MERGE (f4:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
SET f4.name="seller_denied_remedy",
    f4.datatype="BOOL",
    f4.description="Whether seller denied refund/replace/repair";


// ===== Remedies =====
MERGE (r1:Remedy {remedy_id:"R_REPLACE"})
SET r1.name="Replacement",
    r1.description="Replace the goods with defect-free goods";

MERGE (r2:Remedy {remedy_id:"R_REFUND"})
SET r2.name="Refund",
    r2.description="Refund of amount paid";


// ===== Actions =====
MERGE (a1:Action {action_id:"A_CONTACT_SELLER_IN_WRITING"})
SET a1.name="Contact seller in writing",
    a1.description="Send written request and keep proof";

MERGE (a2:Action {action_id:"A_FILE_CONSUMER_COMMISSION"})
SET a2.name="File complaint before Consumer Commission",
    a2.description="File complaint with relevant consumer dispute redressal commission";

MERGE (r1)-[:NEXT_ACTION]->(a1);
MERGE (r2)-[:NEXT_ACTION]->(a1);
MERGE (r2)-[:NEXT_ACTION]->(a2);


// ===== Sample Rule (skeleton) =====
MERGE (rule:Rule {rule_id:"RULE_DEFECT_WITHIN_30_DAYS"})
SET rule.name="Defect in goods within 30 days",
    rule.description="If defect exists and purchase is within 30 days, recommend replacement/refund.",
    rule.priority=100,
    rule.enabled=true;

MERGE (rule)-[:CITES]->(s2);

// Conditions
MERGE (c1:Condition {cond_id:"COND_1"})
SET c1.operator="EQ",
    c1.value="true",
    c1.value_type="BOOL";

MERGE (c2:Condition {cond_id:"COND_2"})
SET c2.operator="LTE",
    c2.value="30",
    c2.value_type="NUMBER";

MERGE (rule)-[:HAS_CONDITION]->(c1);
MERGE (rule)-[:HAS_CONDITION]->(c2);

MERGE (c1)-[:USES_FACT]->(f3); // defect_present == true
MERGE (c2)-[:USES_FACT]->(f2); // days_since_purchase <= 30

// Rule outputs
MERGE (rule)-[:PRODUCES_REMEDY]->(r1);
MERGE (rule)-[:PRODUCES_REMEDY]->(r2);

