MATCH (d:LegalDocument {doc_id:"CPA_2019"})

WITH d
UNWIND [
  {no:1, title:"Preliminary"},
  {no:2, title:"Consumer Protection Councils"},
  {no:3, title:"Central Consumer Protection Authority"},
  {no:4, title:"Consumer Disputes Redressal Commissions"},
  {no:5, title:"Jurisdiction of the District Commission, the State Commission and the National Commission"},
  {no:6, title:"Consumer Disputes Redressal Commissions"},
  {no:7, title:"Mediation"},
  {no:8, title:"Product Liability"},
  {no:9, title:"Offences and Penalties"},
  {no:10, title:"Miscellaneous"}
] AS ch

MERGE (c:Chapter {chapter_key:"CPA_2019::CH" + toString(ch.no)})
SET c.chapter_no = ch.no,
    c.title = ch.title,
    c.doc_id = "CPA_2019",
    c.updated_at = datetime()
MERGE (d)-[:HAS_CHAPTER]->(c);

