// ---------- Issue/Keyword constraints ----------
CREATE CONSTRAINT issue_id IF NOT EXISTS
FOR (i:Issue) REQUIRE i.issue_id IS UNIQUE;

CREATE CONSTRAINT keyword_term IF NOT EXISTS
FOR (k:Keyword) REQUIRE k.term IS UNIQUE;

// Indexes for search
CREATE INDEX issue_name IF NOT EXISTS
FOR (i:Issue) ON (i.name);

CREATE INDEX section_doc_no IF NOT EXISTS
FOR (s:Section) ON (s.doc_id, s.section_no);
