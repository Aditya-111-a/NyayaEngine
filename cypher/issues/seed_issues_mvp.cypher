// ---------- CPA 2019 + ECOM 2020 Issues (MVP) ----------
UNWIND [
  {issue_id:"ISSUE_DEFECTIVE_GOODS", name:"Defective goods", domain:"CPA", severity:4},
  {issue_id:"ISSUE_DEFICIENCY_SERVICE", name:"Deficiency in service", domain:"CPA", severity:4},
  {issue_id:"ISSUE_UNFAIR_TRADE_PRACTICE", name:"Unfair trade practice", domain:"CPA", severity:5},
  {issue_id:"ISSUE_RESTRICTIVE_TRADE_PRACTICE", name:"Restrictive trade practice", domain:"CPA", severity:3},
  {issue_id:"ISSUE_MISLEADING_ADVERTISEMENT", name:"Misleading advertisement", domain:"CPA", severity:5},
  {issue_id:"ISSUE_REFUND_DENIED", name:"Refund denied / not processed", domain:"CPA", severity:4},
  {issue_id:"ISSUE_WARRANTY_DENIED", name:"Warranty denied", domain:"CPA", severity:3},
  {issue_id:"ISSUE_OVERCHARGING", name:"Overcharging / excess price charged", domain:"CPA", severity:3},
  {issue_id:"ISSUE_PRODUCT_LIABILITY", name:"Product liability", domain:"CPA", severity:5},
  {issue_id:"ISSUE_ECOM_PLATFORM_COMPLIANCE", name:"E-commerce platform compliance", domain:"ECOM", severity:4},
  {issue_id:"ISSUE_ECOM_SELLER_DISCLOSURE", name:"Seller disclosure missing", domain:"ECOM", severity:4},
  {issue_id:"ISSUE_ECOM_CANCELLATION_CHARGE", name:"Unfair cancellation charges", domain:"ECOM", severity:3}
] AS x

MERGE (i:Issue {issue_id:x.issue_id})
SET i.name = x.name,
    i.domain = x.domain,
    i.severity = x.severity,
    i.updated_at = datetime();
