MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH2"})
WITH d, c

// ----------------------------------------
// CHAPTER II — CONSUMER PROTECTION COUNCILS
// Sections: 3 to 9
// ----------------------------------------

// Section 3
MERGE (s3:Section {section_key:"CPA_2019::S_3"})
SET s3.doc_id = "CPA_2019",
    s3.section_no = "3",
    s3.title = "Central Consumer Protection Council",
    s3.text = "
3. Central Consumer Protection Council.—(1) The Central Government shall, by notification,
establish with effect from such date as it may specify in that notification, the Central Consumer Protection
Council to be known as the Central Council.
(2) The Central Council shall be an advisory council and consist of the following members,
namely:—
(a) the Minister-in-charge of the Department of Consumer Affairs in the Central Government,
who shall be the Chairperson; and
(b) such number of other official or non-official members representing such interests as may be
prescribed.
",
    s3.source = d.source,
    s3.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s3)

// Section 4
MERGE (s4:Section {section_key:"CPA_2019::S_4"})
SET s4.doc_id = "CPA_2019",
    s4.section_no = "4",
    s4.title = "Procedure for meetings of Central Council",
    s4.text = "
4. Procedure for meetings of Central Council.—(1) The Central Council shall meet as and when
necessary, but at least one meeting of the Council shall be held every year.
(2) The Central Council shall meet at such time and place as the Chairperson may think fit and shall observe such procedure in regard to the transaction of its business as may be prescribed.
",
    s4.source = d.source,
    s4.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s4)

// Section 5
MERGE (s5:Section {section_key:"CPA_2019::S_5"})
SET s5.doc_id = "CPA_2019",
    s5.section_no = "5",
    s5.title = "Objects of Central Council",
    s5.text = "
5. Objects of Central Council.—The objects of the Central Council shall be to render advice on
promotion and protection of the consumers\' rights under this Act.
",
    s5.source = d.source,
    s5.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s5)

// Section 6
MERGE (s6:Section {section_key:"CPA_2019::S_6"})
SET s6.doc_id = "CPA_2019",
    s6.section_no = "6",
    s6.title = "State Consumer Protection Councils",
    s6.text = "
6. State Consumer Protection Councils.—(1) Every State Government shall, by notification,
establish with effect from such date as it may specify in such notification, a State Consumer Protection Council for such State to be known as the State Council.
(2) The State Council shall be an advisory council and consist of the following members, namely:—
(a) the Minister-in-charge of Consumer Affairs in the State Government who shall be the
Chairperson;
(b) such number of other official or non-official members representing such interests as may be
prescribed;
(c) such number of other official or non-official members, not exceeding ten, as may be
nominated by the Central Government.
(3) The State Council shall meet as and when necessary but not less than two meetings shall be held every year.
(4) The State Council shall meet at such time and place as the Chairperson may think fit and shall observe such procedure in regard to the transaction of its business, as may be prescribed.
",
    s6.source = d.source,
    s6.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s6)

// Section 7
MERGE (s7:Section {section_key:"CPA_2019::S_7"})
SET s7.doc_id = "CPA_2019",
    s7.section_no = "7",
    s7.title = "Objects of State Council",
    s7.text = "
7. Objects of State Council.—The objects of every State Council shall be to render advice on
promotion and protection of consumer rights under this Act within the State.
",
    s7.source = d.source,
    s7.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s7)

// Section 8
MERGE (s8:Section {section_key:"CPA_2019::S_8"})
SET s8.doc_id = "CPA_2019",
    s8.section_no = "8",
    s8.title = "District Consumer Protection Council",
    s8.text = "
8. District Consumer Protection Council.—(1) The State Government shall, by notification,
establish for every District with effect from such date as it may specify in such notification, a District Consumer Protection Council to be known as the District Council.
(2) The District Council shall be an advisory council and consist of the following members,
namely:—
(a) the Collector of the district (by whatever name called), who shall be the Chairperson; and
(b) such number of other official and non-official members representing such interests as may be
prescribed.
(3) The District Council shall meet as and when necessary but not less than two meetings shall be held every year.
(4) The District Council shall meet at such time and place within the district as the Chairperson may think fit and shall observe such procedure in regard to the transaction of its business as may be prescribed.
",
    s8.source = d.source,
    s8.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s8)

// Section 9
MERGE (s9:Section {section_key:"CPA_2019::S_9"})
SET s9.doc_id = "CPA_2019",
    s9.section_no = "9",
    s9.title = "Objects of District Council",
    s9.text = "
9. Objects of District Council.—The objects of every District Council shall be to render advice on promotion and protection of consumer rights under this Act within the district.
",
    s9.source = d.source,
    s9.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s9);
