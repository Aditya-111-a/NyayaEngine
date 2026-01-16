// =======================================
// CPA 2019 Section Library (Stage 2.2)
// =======================================

// Create/ensure Act node exists
MERGE (a:Act {act_id:"CPA_2019"})
SET a.name = "Consumer Protection Act",
    a.year = 2019;


// ========== SECTION 2: DEFINITIONS ==========
MERGE (s_consumer:Section {section_id:"CPA2019_S2_CONSUMER"})
SET s_consumer.section_no = "2(7)",
    s_consumer.title = "Consumer (definition)",
    s_consumer.topic = "DEFINITION",
    s_consumer.summary = "Defines consumer and excludes commercial purpose (except self-employment).";

MERGE (s_complaint:Section {section_id:"CPA2019_S2_COMPLAINT"})
SET s_complaint.section_no = "2(6)",
    s_complaint.title = "Complaint (definition)",
    s_complaint.topic = "DEFINITION",
    s_complaint.summary = "Defines complaint grounds including defect, deficiency, overcharging, hazardous goods/services, and product liability.";

MERGE (s_defect:Section {section_id:"CPA2019_S2_DEFECT"})
SET s_defect.section_no = "2(10)",
    s_defect.title = "Defect (definition)",
    s_defect.topic = "DEFINITION",
    s_defect.summary = "Defines defect in goods (quality/quantity/potency/purity/standard).";

MERGE (s_deficiency:Section {section_id:"CPA2019_S2_DEFICIENCY"})
SET s_deficiency.section_no = "2(11)",
    s_deficiency.title = "Deficiency (definition)",
    s_deficiency.topic = "DEFINITION",
    s_deficiency.summary = "Defines deficiency in service (fault, imperfection, shortcoming, inadequacy).";

MERGE (s_utp:Section {section_id:"CPA2019_S2_UTP"})
SET s_utp.section_no = "2(47)",
    s_utp.title = "Unfair Trade Practice (definition)",
    s_utp.topic = "DEFINITION",
    s_utp.summary = "Defines unfair trade practice including misleading representations, false claims etc.";

MERGE (s_advertisement:Section {section_id:"CPA2019_S2_ADVERTISEMENT"})
SET s_advertisement.section_no = "2(1)",
    s_advertisement.title = "Advertisement (definition)",
    s_advertisement.topic = "DEFINITION",
    s_advertisement.summary = "Defines advertisement including electronic media, internet, website, labels etc.";

MERGE (s_misleading_ad:Section {section_id:"CPA2019_S2_MISLEADING_AD"})
SET s_misleading_ad.section_no = "2(28)",
    s_misleading_ad.title = "Misleading advertisement (definition)",
    s_misleading_ad.topic = "DEFINITION",
    s_misleading_ad.summary = "Defines misleading advertisement: false description/guarantee, concealment, misleading representation.";


// ========== CENTRAL CONSUMER PROTECTION AUTHORITY ==========
MERGE (s_ccpa:Section {section_id:"CPA2019_S10_CCPA"})
SET s_ccpa.section_no="10",
    s_ccpa.title="Establishment of Central Consumer Protection Authority",
    s_ccpa.topic="CCPA",
    s_ccpa.summary="Establishes CCPA for protecting consumer rights as a class.";

MERGE (s_ccpa_powers:Section {section_id:"CPA2019_S18_CCPA_POWERS"})
SET s_ccpa_powers.section_no="18",
    s_ccpa_powers.title="Powers and functions of Central Authority",
    s_ccpa_powers.topic="CCPA",
    s_ccpa_powers.summary="Powers/functions of CCPA regarding violation of consumer rights, unfair trade practices, misleading advertisements.";

MERGE (s_misleading_penalty:Section {section_id:"CPA2019_S21_MISLEADING_AD_PENALTY"})
SET s_misleading_penalty.section_no="21",
    s_misleading_penalty.title="Directions and penalties against false or misleading advertisements",
    s_misleading_penalty.topic="CCPA",
    s_misleading_penalty.summary="CCPA can issue directions and impose penalties for misleading ads.";


// ========== CONSUMER COMMISSIONS / FORUMS (JURISDICTION REFERENCE) ==========
MERGE (s_jurisdiction_rules:Section {section_id:"CPA_RULES_2021_JURISDICTION"})
SET s_jurisdiction_rules.section_no="Jurisdiction Rules 2021",
    s_jurisdiction_rules.title="Pecuniary jurisdiction of District/State/National Commissions",
    s_jurisdiction_rules.topic="JURISDICTION",
    s_jurisdiction_rules.summary="District: up to ₹50 lakh; State: >₹50 lakh to ₹2 crore; National: >₹2 crore (Rules 2021).";


// Link sections to Act
MERGE (a)-[:HAS_SECTION]->(s_consumer);
MERGE (a)-[:HAS_SECTION]->(s_complaint);
MERGE (a)-[:HAS_SECTION]->(s_defect);
MERGE (a)-[:HAS_SECTION]->(s_deficiency);
MERGE (a)-[:HAS_SECTION]->(s_utp);
MERGE (a)-[:HAS_SECTION]->(s_advertisement);
MERGE (a)-[:HAS_SECTION]->(s_misleading_ad);
MERGE (a)-[:HAS_SECTION]->(s_ccpa);
MERGE (a)-[:HAS_SECTION]->(s_ccpa_powers);
MERGE (a)-[:HAS_SECTION]->(s_misleading_penalty);
MERGE (a)-[:HAS_SECTION]->(s_jurisdiction_rules);

