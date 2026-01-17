MERGE (d:LegalDocument {doc_id:"ECOM_RULES_2020"})
SET d.title = "Consumer Protection (E-Commerce) Rules, 2020",
    d.doc_type = "RULES",
    d.year = 2020,
    d.jurisdiction = "India",
    d.source = "Department of Consumer Affairs",
    d.source_url = "https://consumeraffairs.gov.in/pages/consumer-protection-acts",
    d.updated_at = datetime();
