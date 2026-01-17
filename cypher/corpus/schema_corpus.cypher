// ---------- Corpus Constraints ----------

CREATE CONSTRAINT legal_doc_id IF NOT EXISTS
FOR (d:LegalDocument) REQUIRE d.doc_id IS UNIQUE;

CREATE CONSTRAINT chapter_key IF NOT EXISTS
FOR (c:Chapter) REQUIRE c.chapter_key IS UNIQUE;

CREATE CONSTRAINT section_key IF NOT EXISTS
FOR (s:Section) REQUIRE s.section_key IS UNIQUE;

