MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH7"})
WITH d, c

// ----------------------------------------
// CHAPTER VII — OFFENCES AND PENALTIES
// Sections: 88 to 93
// ----------------------------------------

MERGE (s88:Section {section_key:"CPA_2019::S_88"})
SET s88.doc_id="CPA_2019", s88.section_no="88",
    s88.title="Penalty for non-compliance of direction of Central Authority",
    s88.text="
88. Penalty for non-compliance of direction of Central Authority.—Whoever, fails to comply
with any direction of the Central Authority under sections 20 and 21, shall be punished with
imprisonment for a term which may extend to six months or with fine which may extend to twenty lakh
rupees, or with both.
",
    s88.source=d.source, s88.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s88)

MERGE (s89:Section {section_key:"CPA_2019::S_89"})
SET s89.doc_id="CPA_2019", s89.section_no="89",
    s89.title="Punishment for false or misleading advertisement",
    s89.text="
89. Punishment for false or misleading advertisement.—Any manufacturer or service provider
who causes a false or misleading advertisement to be made which is prejudicial to the interest of
consumers shall be punished with imprisonment for a term which may extend to two years and with fine
which may extend to ten lakh rupees; and for every subsequent offence, be punished with imprisonment
for a term which may extend to five years and with fine which may extend to fifty lakh rupees.
",
    s89.source=d.source, s89.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s89)

MERGE (s90:Section {section_key:"CPA_2019::S_90"})
SET s90.doc_id="CPA_2019", s90.section_no="90",
    s90.title="Punishment for manufacturing for sale or storing, selling or distributing or importing products containing adulterant",
    s90.text="
90. Punishment for manufacturing for sale or storing, selling or distributing or importing
products containing adulterant.—(1) Whoever, by himself or by any other person on his behalf,
manufactures for sale or stores or sells or distributes or imports any product containing an adulterant shall
be punished, if such act—
(a) does not result in any injury to the consumer, with imprisonment for a term which may extend
to six months and with fine which may extend to one lakh rupees;
(b) causing injury not amounting to grievous hurt to the consumer, with imprisonment for a term
which may extend to one year and with fine which may extend to three lakh rupees;
(c) causing injury resulting in grievous hurt to the consumer, with imprisonment for a term which
may extend to seven years and with fine which may extend to five lakh rupees; and
(d) results in the death of a consumer, with imprisonment for a term which shall not be less than
seven years, but which may extend to imprisonment for life and with fine which shall not be less than
ten lakh rupees.
(2) The offences under clauses (c) and (d) of sub-section (1) shall be cognizable and non-bailable.
(3) Notwithstanding the punishment under sub-section (1), the court may, in case of first conviction,
suspend any licence issued to the person referred to in that sub-section, under any law for the time being
in force, for a period up to two years, and in case of second or subsequent conviction, cancel the licence.
Explanation.—For the purposes of this section,—
(a) 'adulterant' means any material including extraneous matter which is employed or used for
making a product unsafe;
(b) 'grievous hurt' shall have the same meaning as assigned to it in section 320 of the Indian
Penal Code (45 of 1860).
",
    s90.source=d.source, s90.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s90)

MERGE (s91:Section {section_key:"CPA_2019::S_91"})
SET s91.doc_id="CPA_2019", s91.section_no="91",
    s91.title="Punishment for manufacturing for sale or for storing or selling or distributing or importing spurious goods",
    s91.text="
91. Punishment for manufacturing for sale or for storing or selling or distributing or importing
spurious goods.—(1) Whoever, by himself or by any other person on his behalf, manufactures for sale or
stores or sells or distributes or imports any spurious goods shall be punished, if such act—
(a) causing injury not amounting to grievous hurt to the consumer, with imprisonment for a term
which may extend to one year and with fine which may extend to three lakh rupees;
(b) causing injury resulting in grievous hurt to the consumer, with imprisonment for a term which
may extend to seven years and with fine which may extend to five lakh rupees;
(c) results in the death of a consumer, with imprisonment for a term which shall not be less than
seven years, but may extend to imprisonment for life and with fine which shall not be less than ten
lakh rupees.
(2) The offences under clauses (b) and (c) of sub-section (1) shall be cognizable and non-bailable.
(3) Notwithstanding the punishment under sub-section (1), the court may, in case of first
conviction, suspend any licence issued to the person referred to in that sub-section, under any law for the time being in force, for a period up to two years, and in case of second or subsequent conviction,
cancel the licence.
",
    s91.source=d.source, s91.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s91)

MERGE (s92:Section {section_key:"CPA_2019::S_92"})
SET s92.doc_id="CPA_2019", s92.section_no="92",
    s92.title="Cognizance of offence by court",
    s92.text="
92. Cognizance of offence by court.—No cognizance shall be taken by a competent court of any
offence under sections 88 and 89 except on a complaint filed by the Central Authority or any officer
authorised by it in this behalf.
",
    s92.source=d.source, s92.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s92)

MERGE (s93:Section {section_key:"CPA_2019::S_93"})
SET s93.doc_id="CPA_2019", s93.section_no="93",
    s93.title="Vexatious search",
    s93.text="
93. Vexatious search.—The Director General or any other officer, exercising powers under section
22, who knows that there are no reasonable grounds for so doing, and yet—
(a) searches, or causes to be searched any premises; or
(b) seizes any record, register or other document or article, shall, for every such offence, be punished
with imprisonment for a term which may extend to one year, or with fine which may extend to ten
thousand rupees or with both.
",
    s93.source=d.source, s93.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s93);
