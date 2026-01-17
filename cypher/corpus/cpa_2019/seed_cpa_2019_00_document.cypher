MERGE (d:LegalDocument {doc_id:"CPA_2019"})
SET d.title = "Consumer Protection Act, 2019",
    d.doc_type = "ACT",
    d.year = 2019,
    d.jurisdiction = "India",
    d.source = "India Code",
    d.source_url = "https://www.indiacode.nic.in/bitstream/123456789/16939/1/a2019-35.pdf",
    d.updated_at = datetime();
