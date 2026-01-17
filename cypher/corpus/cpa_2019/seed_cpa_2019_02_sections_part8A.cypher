MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH8"})
WITH d, c

// ----------------------------------------
// CHAPTER VIII — MISCELLANEOUS
// Part8A: Sections 94 to 100
// ----------------------------------------

MERGE (s94:Section {section_key:"CPA_2019::S_94"})
SET s94.doc_id="CPA_2019", s94.section_no="94",
    s94.title="Measures to prevent unfair trade practices in e-commerce, direct selling, etc.",
    s94.text="
94. Measures to prevent unfair trade practices in e-commerce, direct selling, etc.—For the
purposes of preventing unfair trade practices in e-commerce, direct selling and also to protect the interest
and rights of consumers, the Central Government may take such measures in the manner as may be
prescribed.
",
    s94.source=d.source, s94.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s94)

MERGE (s95:Section {section_key:"CPA_2019::S_95"})
SET s95.doc_id="CPA_2019", s95.section_no="95",
    s95.title="Presidents, members, Chief Commissioner, Commissioner and certain officers to be public servants",
    s95.text="
95. Presidents, members, Chief Commissioner, Commissioner and certain officers to be public
servants.—The Presidents and members of the District Commission, the State Commission and the
National Commission, and officers and other employees thereof, the Chief Commissioner and the
Commissioner of the Central Authority, the Director General, the Additional Director General, the
Director, the Joint Director, the Deputy Director and the Assistant Director and all other officers and
employees of the Central Authority and other persons performing any duty under this Act, while acting or
purporting to act in pursuance of any of the provisions of this Act, shall be deemed to be public servants
within the meaning of section 21 of the Indian Penal Code (45 of 1860).
",
    s95.source=d.source, s95.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s95)

MERGE (s96:Section {section_key:"CPA_2019::S_96"})
SET s96.doc_id="CPA_2019", s96.section_no="96",
    s96.title="Compounding of offences",
    s96.text="
96. Compounding of offences.—(1) Any offence punishable under sections 88 and 89, may, either
before or after the institution of the prosecution, be compounded, on payment of such amount as may be
prescribed:
Provided that no compounding of such offence shall be made without the leave of the court before
which a complaint has been filed under section 92:
Provided further that such sum shall not, in any case, exceed the maximum amount of the fine, which
may be imposed under this Act for the offence so compounded.
(2) The Central Authority or any officer as may be specially authorised by him in this behalf, may
compound offences under sub-section (1).
(3) Nothing in sub-section (1) shall apply to person who commits the same or similar offence, within
a period of three years from the date on which the first offence, committed by him, was compounded.
Explanation.—For the purposes of this sub-section, any second or subsequent offence committed after
the expiry of a period of three years from the date on which the offence was previously compounded,
shall be deemed to be a first offence.
(4) Where an offence has been compounded under sub-section (1), no proceeding or further
proceeding, as the case may be, shall be taken against the offender in respect of the offence so
compounded.
(5) The acceptance of the sum of money for compounding an offence in accordance with sub-section
(1) by the Central Authority or an officer of the Central Authority empowered in this behalf shall be
deemed to amount to an acquittal within the meaning of the Code of Criminal Procedure, 1973 (2 of
1974).
",
    s96.source=d.source, s96.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s96)

MERGE (s97:Section {section_key:"CPA_2019::S_97"})
SET s97.doc_id="CPA_2019", s97.section_no="97",
    s97.title="Manner of crediting penalty",
    s97.text="
97. Manner of crediting penalty.—The penalty collected under section 21 and the amount collected
under section 96 shall be credited to such fund as may be prescribed.
",
    s97.source=d.source, s97.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s97)

MERGE (s98:Section {section_key:"CPA_2019::S_98"})
SET s98.doc_id="CPA_2019", s98.section_no="98",
    s98.title="Protection of action taken in good faith",
    s98.text="
98. Protection of action taken in good faith.—No suit, prosecution or other legal proceeding shall
lie against the Presidents and members of the District Commission, the State Commission and the
National Commission, the Chief Commissioner, the Commissioner, any officer or employee and other
person performing any duty under this Act, for any act which is in good faith done or intended to be done
in pursuance of this Act or under any rule or order made thereunder.
",
    s98.source=d.source, s98.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s98)

MERGE (s99:Section {section_key:"CPA_2019::S_99"})
SET s99.doc_id="CPA_2019", s99.section_no="99",
    s99.title="Power to give directions by Central Government",
    s99.text="
99. Power to give directions by Central Government.—(1) Without prejudice to the foregoing
provisions of this Act, the Central Authority, shall, in exercise of its powers or the performance of its
functions under this Act, be bound by such directions on questions of policy, as the Central Government
may give in writing to it from time to time:
Provided that the Central Authority shall, as far as practicable, be given an opportunity to express its
views before any direction is given under this sub-section.
(2) The decision of the Central Government whether a question is one of policy or not shall be final.
",
    s99.source=d.source, s99.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s99)

MERGE (s100:Section {section_key:"CPA_2019::S_100"})
SET s100.doc_id="CPA_2019", s100.section_no="100",
    s100.title="Act not in derogation of any other",
    s100.text="
100. Act not in derogation of any other law.—The provisions of this Act shall be in addition to and
not in derogation of the provisions of any other law for the time being in force.
",
    s100.source=d.source, s100.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s100);
