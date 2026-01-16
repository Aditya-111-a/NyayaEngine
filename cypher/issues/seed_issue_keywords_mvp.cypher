// ---------- Issue keywords (metadata) ----------
WITH [
  {issue_id:"ISSUE_DEFECTIVE_GOODS", terms:["defect","defective","broken","damaged","not working","faulty","replacement","repair"]},
  {issue_id:"ISSUE_DEFICIENCY_SERVICE", terms:["service issue","poor service","delay","no response","unprofessional","deficiency"]},
  {issue_id:"ISSUE_UNFAIR_TRADE_PRACTICE", terms:["unfair trade practice","fraud","scam","misrepresentation","false claim","cheating","fake"]},
  {issue_id:"ISSUE_RESTRICTIVE_TRADE_PRACTICE", terms:["restrictive","forced","bundling","tie-in","condition precedent"]},
  {issue_id:"ISSUE_MISLEADING_ADVERTISEMENT", terms:["misleading ad","false advertisement","fake review","wrong claim","advertisement","influencer"]},
  {issue_id:"ISSUE_REFUND_DENIED", terms:["refund","refund denied","refund pending","chargeback","return refused"]},
  {issue_id:"ISSUE_WARRANTY_DENIED", terms:["warranty","guarantee","service center refused","authorized service"]},
  {issue_id:"ISSUE_OVERCHARGING", terms:["overcharged","extra charges","mrp higher","excess price","hidden fee"]},
  {issue_id:"ISSUE_PRODUCT_LIABILITY", terms:["injury","harm","product liability","unsafe product","dangerous","medical harm"]},
  {issue_id:"ISSUE_ECOM_PLATFORM_COMPLIANCE", terms:["e-commerce","online platform","amazon","flipkart","meesho","marketplace","inventory model"]},
  {issue_id:"ISSUE_ECOM_SELLER_DISCLOSURE", terms:["seller details missing","no address","no contact","no grievance officer","missing information"]},
  {issue_id:"ISSUE_ECOM_CANCELLATION_CHARGE", terms:["cancellation fee","deduction","penalty","return fee","unfair charge"]}
] AS mapping

UNWIND mapping AS m
MATCH (i:Issue {issue_id:m.issue_id})
UNWIND m.terms AS term

MERGE (k:Keyword {term:toLower(trim(term))})
MERGE (i)-[:HAS_KEYWORD]->(k);
