// =====================================================
// Coverage Tracking (Phase 1 = 50 scenarios)
// =====================================================

MERGE (c1:CoverageCategory {category_id:"CAT_ECOM_DELIVERY"}) SET c1.name="Delivery Failures";
MERGE (c2:CoverageCategory {category_id:"CAT_ECOM_DEFECT"}) SET c2.name="Defective / Wrong / Missing Item";
MERGE (c3:CoverageCategory {category_id:"CAT_ECOM_REFUND"}) SET c3.name="Refund / Replacement Denial";
MERGE (c4:CoverageCategory {category_id:"CAT_ECOM_PLATFORM"}) SET c4.name="Platform Liability & Grievance";
MERGE (c5:CoverageCategory {category_id:"CAT_ECOM_PAYMENT"}) SET c5.name="Payment / Transaction Issues";
MERGE (c6:CoverageCategory {category_id:"CAT_ECOM_ADS"}) SET c6.name="Misleading Ads / Unfair Trade Practice";
MERGE (c7:CoverageCategory {category_id:"CAT_ECOM_WARRANTY"}) SET c7.name="Warranty / Service Denial";

// Helper: link scenario to citation
// We cite ECOM Rule 4/5/6 by default + CPA definitions where relevant

WITH 1 as _
MATCH (sec4:Section {section_key:"ECOM_RULES_2020::RULE_4"})
MATCH (sec5:Section {section_key:"ECOM_RULES_2020::RULE_5"})
MATCH (sec6:Section {section_key:"ECOM_RULES_2020::RULE_6"})
MATCH (utp:Section {section_key:"CPA_2019::2(47)"})
RETURN sec4,sec5,sec6,utp;
