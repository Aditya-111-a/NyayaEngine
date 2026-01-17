MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH8"})
WITH d, c

// ----------------------------------------
// CHAPTER VIII — MISCELLANEOUS
// Part8B: Sections 101 to 107
// ----------------------------------------

MERGE (s101:Section {section_key:"CPA_2019::S_101"})
SET s101.doc_id="CPA_2019", s101.section_no="101",
    s101.title="Power of Central Government to make rules",
    s101.text="
101. Power of Central Government to make rules.—(1) The Central Government may, by
notification, make rules for carrying out any of the provisions contained in this Act.
(2) Without prejudice to the generality of the foregoing power, such rules may provide for, —
(a) the other class or classes of persons including public utility entities under clause (19) of
section 2;
(b) the contest, lottery, game of chance or skill which are to be exempted under item (b) of sub-
clause (iii) of clause (47) of section 2;
(c) the manner of issuing bill or cash memo or receipt for goods sold or services rendered under
sub-clause (vii) of clause (47) of section 2;
(d) the number of other official or non-official members of the Central Council under clause (b)
of sub-section (2) of section 3;
(e) the time and place of meeting of Central Council and the procedure for the transaction of its
business under sub-section (2) of section 4;
(f) the number of Commissioners in the Central Authority under sub-section (2) of section 10;
(g) the qualifications for appointment, method of recruitment, procedure of appointment, term of
office, salaries and allowances, resignation, removal and other terms and conditions of service of the
Chief Commissioner and other Commissioners of the Central Authority under section 11;
(h) the salaries and allowances payable to, and the other terms and conditions of service of, the
officers and other employees of the Central Authority under sub-section (2) of section 13;
(i) the qualifications for appointment of Director General, Additional Director General, Director,
Joint Director, Deputy Director and Assistant Director and the manner of appointment under sub-
section (2) of section 15;
(j) the manner of taking copies or extracts of document, record or article seized or produced
before returning to the person under sub-section (3) of section 22;
(k) the officer and the manner of disposing of articles which are subject to speedy or natural
decay under sub-section (4) of section 22;
(l) the form and manner for preparing annual statement of accounts by the Central Authority in
consultation with the Comptroller and Auditor-General of India under sub-section (1) of section 26;
(m) the form in which, and the time within which, an annual report, other reports and returns may
be prepared by the Central Authority under sub-section (1) of section 27;
(n) the qualifications for appointment, method of recruitment, procedure for appointment, term of
office, resignation and removal of President and members of the District Commission under section
29;
(o) the other value of goods and services in respect of which the District Commission shall have
jurisdiction to entertain complaints under proviso to sub-section (1) of section 34;
(p) the manner of electronically filing complaint under the proviso to sub-section (1) of section
35;
(q) the fee, electronic form and the manner of payment of fee for filing complaint under
sub-section (2) of section 35;
(r) the cases which may not be referred for settlement by mediation under sub-section (1) of
section 37;
(s) the manner of authentication of goods sampled in case of the National Commission under
clause (c) of sub-section (2) of section 38;
(t) any other matter which may be prescribed under clause (f) of sub-section (9) of section 38;
(u) the fund where the amount obtained may be credited and the manner of utilisation of such
amount under sub-section (2) of section 39;
(v) the form and the manner in which appeal may be preferred to the State Commission under
section 41;
(w) the qualifications for appointment, method of recruitment, procedure for appointment, term of
office, resignation and removal of the President and members of the State Commission under section
43;
(x) the other value of goods and services in respect of which the State Commission shall have
jurisdiction under the proviso to sub-clause (i) of clause (a) of sub-section (1) of section 47;
(y) the form and manner of filing appeal to the National Commission, and the manner of
depositing fifty per cent. of the amount before filing appeal, under sub-section (1) of section 51;
(z) the number of members of the National Commission under clause (b) of section 54;
(za) the qualifications, appointment, term of office, salaries and allowances, resignation, removal
and other terms and conditions of service of the President and members of the National Commission
under sub-section (1) of section 55;
(zb) the salaries and allowances payable to, and other terms and conditions of service of, the
officers and other employees of the National Commission under sub-section (3) of section 57;
(zc) the other value of goods and services in respect of which the National Commission shall have
jurisdiction under the proviso to sub-clause (i) of clause (a) of sub-section (1) of section 58;
(zd) the manner of depositing fifty per cent. of the amount under the second proviso to section 67;
(ze) the form in which the National Commission and the State Commission shall furnish
information to the Central Government under sub-section (4) of section 70;
(zf) the persons in the consumer mediation cell under sub-section (3) of section 74;
(zg) the measures to be taken by the Central Government to prevent unfair trade practices in
e-commerce, direct selling under section 94;
(zh) the amount for compounding offences under sub-section (1) of section 96;
(zi) the fund to which the penalty and amount collected shall be credited under section 97; and
(zj) any other matter which is to be, or may be, prescribed, or in respect of which provisions are to
be, or may be, made by rules
",
    s101.source=d.source, s101.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s101)

MERGE (s102:Section {section_key:"CPA_2019::S_102"})
SET s102.doc_id="CPA_2019", s102.section_no="102",
    s102.title="Power of State Government to make rules",
    s102.text="
102. Power of State Government to make rules.—(1) The State Governments may, by
notification, make rules for carrying out the provisions of this Act:
Provided that the Central Government may, frame model rules in respect of all or any of the
matters with respect to which the State Government may make rules under this section, and where
any such model rules have been framed in respect of any such matter, they shall apply to the State
until the rules in respect of that matter is made by the State Government and while making any such
rules, so far as is practicable, they shall conform to such model rules.
(2) In particular, and without prejudice to the generality of the foregoing power, such rules may
provide for all or any of the following matters, namely:—
(a) the other class or classes of persons including public utility entities under clause (19) of
section 2;
(b) the contest, lottery, game of chance or skill which are to be exempted under item (b) of
sub-clause (iii) of clause (47) of section 2;
(c) the number of other official or non-official members of the State Council under
clause (b) of sub-section (2) of section 6;
(d) the time and place of meeting of the State Council and the procedure for the transaction
of its business under sub-section (4) of section 6;
(e) the number of other official and non-official members of District Council under clause
(b) of sub-section (2) of section 8;
(f) the time and place of meeting of the District Council and procedure for the transaction of
its business under sub-section (4) of section 8;
(g) the number of members of the District Commission under clause (b) of sub-section (2) of
section 28;
(h) the salaries and allowances payable to, and other terms and conditions of service of, the
President and members of the District Commission under section 30;
(i) the salaries and allowances payable to, and other terms and conditions of service of, the
officers and other employees of the District Commission under sub-section (3) of section 33;
(j) the manner of authentication of goods sampled by the State Commission and the District
Commission under clause (c) of sub-section (2) of section 38;
(k) the manner of depositing fifty per cent. of the amount before filing appeal under second
proviso to section 41;
(l) the number of members of the State Commission under sub-section (3) of section 42;
(m) the salaries and allowances payable to, and other terms and conditions of service of, the
President and members of the State Commission under section 44;
(n) the salaries and allowances payable to, and other terms and conditions of service of, the
officers and other employees of the State Commission under sub-section (3) of section 46;
(o) the form in which the State Commission shall furnish information to the State
Government under sub-section (5) of section 70;
(p) the persons in the consumer mediation cell under sub-section (3) of section 74;
(q) any other matter which is to be, or may be prescribed, or in respect of which provisions
are to be, or may be, made by rules.
",
    s102.source=d.source, s102.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s102)

MERGE (s103:Section {section_key:"CPA_2019::S_103"})
SET s103.doc_id="CPA_2019", s103.section_no="103",
    s103.title="Power of National Commission to make regulations",
    s103.text="
103. Power of National Commission to make regulations.—(1) The National Commission may,
with the previous approval of the Central Government, by notification, make regulations not inconsistent with this Act to provide for all matters for which provision is necessary or expedient for the purpose of
giving effect to the provisions of this Act.
(2) In particular, and without prejudice to the generality of the foregoing power, such regulations may
make provisions for—
(a) the costs for adjournment to be imposed by the District Commission under the second
proviso to sub-section (7) of section 38;
(b) the costs for adjournment to be imposed by the State Commission or the National
Commission, as the case may be, under the second proviso to section 52;
(c) the maintenance of any other information by the consumer mediation cell under
sub-section (4) of section 74;
(d) the manner of submission of quarterly report by consumer mediation cell to the District
Commission, the State Commission or the National Commission under sub-section (5) of
section 74;
(e) the qualifications and experience required for empanelment as mediator, the procedure for
empanelment, the manner of training empanelled mediators, the fee payable to empanelled
mediator, the terms and conditions for empanelment, the code of conduct for empanelled mediators,
the grounds on which, and the manner in which, empanelled mediators shall be removed or
empanelment shall be cancelled and the other matters relating thereto under sub-section (2) of
section 75;
(f) the conditions for re-empanelment of mediators for another term under sub-section (3) of
section 75;
(g) the other facts to be disclosed by mediators under clause (c) of section 77;
(h) the time within which, and the manner in which, mediation may be conducted under
sub-section (3) of section 79; and
(i) such other matter for which provision is to be, or may be, made by regulation.
",
    s103.source=d.source, s103.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s103)

MERGE (s104:Section {section_key:"CPA_2019::S_104"})
SET s104.doc_id="CPA_2019", s104.section_no="104",
    s104.title="Power of Central Authority to make regulations",
    s104.text="
104. Power of Central Authority to make regulations.—(1) The Central Authority may, with the
previous approval of the Central Government, by notification, make regulations not inconsistent with this
Act, for the purpose of giving effect to the provisions of this Act.
(2) In particular, and without prejudice to the generality of the foregoing power, such regulations may
provide for all or any of the following matters, namely:—
(a) the procedure for engaging experts and professionals and the number of such experts and
professionals under sub-section (3) of section 13;
(b) the procedure for transaction of business and the allocation of business of the Chief
Commissioner and Commissioner under sub-section (1) of section 14;
(c) the form, manner and time within which, inquiries or investigation made by the
Director-General shall be submitted to the Central Authority under sub-section (5) of section 15;
and
(d) such other matter for which provision is to be, or may be, made by regulation.
",
    s104.source=d.source, s104.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s104)

MERGE (s105:Section {section_key:"CPA_2019::S_105"})
SET s105.doc_id="CPA_2019", s105.section_no="105",
    s105.title="Rules and regulations to be laid before each House of Parliament",
    s105.text="
105. Rules and regulations to be laid before each House of Parliament.—(1) Every rule and every
regulation made under this Act shall be laid, as soon as may be after it is made, before each House of
Parliament, while it is in session, for a total period of thirty days which may be comprised in one session
or in two or more successive sessions, and if, before the expiry of the session immediately following the
session or the successive sessions aforesaid, both Houses agree in making any modification in the rule or
regulation or both Houses agree that the rule or regulation shall thereafter have effect only in such
modified form or be of no effect, as the case may be; so, however, that any such modification or
annulment shall be without prejudice to the validity of anything previously done under that rule or
regulation.
(2) Every rule made by a State Government under this Act shall be laid as soon as may be after it is
made, before the State Legislature.
",
    s105.source=d.source, s105.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s105)

MERGE (s106:Section {section_key:"CPA_2019::S_106"})
SET s106.doc_id="CPA_2019", s106.section_no="106",
    s106.title="Power to Remove Difficulties",
    s106.text="
106. Power to Remove Difficulties.—If any difficulty arises in giving effect to the provisions of this
Act, the Central Government may, by order in the Official Gazette, make such provisions not inconsistent
with the provisions of this Act as appear to it to be necessary or expedient for removing the difficulty:
Provided that no such order shall be made after the expiry of a period of two years from the
commencement of this Act.
",
    s106.source=d.source, s106.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s106)

MERGE (s107:Section {section_key:"CPA_2019::S_107"})
SET s107.doc_id="CPA_2019", s107.section_no="107",
    s107.title="Repeal and savings",
    s107.text="
107. Repeal and savings.—(1) The Consumer Protection Act, 1986 (68 of 1986) is hereby repealed.
(2) Notwithstanding such repeal, anything done or any action taken or purported to have been done or
taken under the Act hereby repealed shall, in so far as it is not inconsistent with the provisions of this Act,
be deemed to have been done or taken under the corresponding provisions of this Act.
(3) The mention of particular matters in sub-section (2) shall not be held to prejudice or affect the
general application of section 6 of the General Clauses Act, 1897 (10 of 1897) with regard to the effect of
repeal.
",
    s107.source=d.source, s107.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s107);
