// ---------- Map issues to CPA corpus sections ----------
MATCH (doc:LegalDocument {doc_id:"CPA_2019"})

// Defect & deficiency definitions
MATCH (s2:Section {section_key:"CPA_2019::S_2"})
MATCH (defectIssue:Issue {issue_id:"ISSUE_DEFECTIVE_GOODS"})
MATCH (serviceIssue:Issue {issue_id:"ISSUE_DEFICIENCY_SERVICE"})
MATCH (utpIssue:Issue {issue_id:"ISSUE_UNFAIR_TRADE_PRACTICE"})
MATCH (misleadIssue:Issue {issue_id:"ISSUE_MISLEADING_ADVERTISEMENT"})

MERGE (defectIssue)-[:SUPPORTED_BY]->(s2)
MERGE (serviceIssue)-[:SUPPORTED_BY]->(s2)
MERGE (utpIssue)-[:SUPPORTED_BY]->(s2)
MERGE (misleadIssue)-[:SUPPORTED_BY]->(s2);
