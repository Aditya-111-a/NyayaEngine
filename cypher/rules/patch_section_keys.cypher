// =====================================================
// PATCH: Add doc_id and section_key to all Section nodes
// =====================================================

// 1) Set doc_id from parent LegalDocument relationship
MATCH (d:LegalDocument)-[:HAS_SECTION]->(s:Section)
WHERE s.doc_id IS NULL
SET s.doc_id = d.doc_id;

// 2) Fallback doc_id (if still null)
// - If your graph missed HAS_SECTION links, assign CPA_2019 default
MATCH (s:Section)
WHERE s.doc_id IS NULL
SET s.doc_id = "CPA_2019";

// 3) Create deterministic section_key using doc_id + section_no
// Example:
// CPA_2019::2(47)
// CPA_2019::10
// ECOM_RULES_2020::RULE_4
MATCH (s:Section)
WHERE s.section_key IS NULL
  AND s.section_no IS NOT NULL
SET s.section_key = s.doc_id + "::" + toString(s.section_no);

// 4) For extra safety: if section_no missing, fallback to section_id
MATCH (s:Section)
WHERE s.section_key IS NULL
  AND s.section_id IS NOT NULL
SET s.section_key = s.doc_id + "::" + toString(s.section_id);

// 5) Optional cleanup: trim whitespace
MATCH (s:Section)
WHERE s.section_key IS NOT NULL
SET s.section_key = trim(toString(s.section_key));
