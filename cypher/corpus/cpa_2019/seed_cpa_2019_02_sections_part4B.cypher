MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH4"})
WITH d, c

// ----------------------------------------
// CHAPTER IV — CONSUMER DISPUTES REDRESSAL COMMISSION
// Part4B: Sections 42 to 55
// ----------------------------------------

MERGE (s42:Section {section_key:"CPA_2019::S_42"})
SET s42.doc_id="CPA_2019", s42.section_no="42",
    s42.title="Establishment of State Consumer Disputes Redressal Commission",
    s42.text="
42. Establishment of State Consumer Disputes Redressal Commission.—(1) The State
Government shall, by notification, establish a State Consumer Disputes Redressal Commission, to be known as the State Commission, in the State.
(2) The State Commission shall ordinarily function at the State capital and perform its functions at such other places as the State Government may in consultation with the State Commission notify in the Official Gazette:
Provided that the State Government may, by notification, establish regional benches of the State
Commission, at such places, as it deems fit.
(3) Each State Commission shall consist of—
(a) a President; and
(b) not less than four or not more than such number of members as may be prescribed in
consultation with the Central Government.
",
    s42.source=d.source, s42.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s42)

MERGE (s43:Section {section_key:"CPA_2019::S_43"})
SET s43.doc_id="CPA_2019", s43.section_no="43",
    s43.title="Qualifications, etc., of President and members of State Commission",
    s43.text="
43. Qualifications, etc., of President and members of State Commission.—The Central
Government may, by notification, make rules to provide for the qualification for appointment, method of recruitment, procedure of appointment, term of office, resignation and removal of the President and members of the State Commission.
",
    s43.source=d.source, s43.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s43)

MERGE (s44:Section {section_key:"CPA_2019::S_44"})
SET s44.doc_id="CPA_2019", s44.section_no="44",
    s44.title="Salaries, allowances and other terms and conditions of service of President and members of State Commission",
    s44.text="
44. Salaries, allowances and other terms and conditions of service of President and members of
State Commission.—The State Government may, by notification, make rules to provide for salaries and allowances and other terms and conditions of service of the President and members of the State Commission.
",
    s44.source=d.source, s44.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s44)

MERGE (s45:Section {section_key:"CPA_2019::S_45"})
SET s45.doc_id="CPA_2019", s45.section_no="45",
    s45.title="Transitional provision",
    s45.text="
45. Transitional provision.—Any person appointed as President or, as the case may be, a member of the State Commission immediately before the commencement of this Act shall hold office as such, as President or member, as the case may be, till the completion of his term.
",
    s45.source=d.source, s45.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s45)

MERGE (s46:Section {section_key:"CPA_2019::S_46"})
SET s46.doc_id="CPA_2019", s46.section_no="46",
    s46.title="Officers and employees of State Commission",
    s46.text="
46. Officers and employees of State Commission.—(1) The State Government shall determine the
nature and categories of the officers and other employees required to assist the State Commission in the discharge of its functions and provide the Commission with such officers and other employees as it may think fit.
(2) The officers and other employees of the State Commission shall discharge their functions under the general superintendence of the President.
(3) The salaries and allowances payable to and the other terms and conditions of service of, the
officers and other employees of the State Commission shall be such as may be prescribed.
",
    s46.source=d.source, s46.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s46)

MERGE (s47:Section {section_key:"CPA_2019::S_47"})
SET s47.doc_id="CPA_2019", s47.section_no="47",
    s47.title="Jurisdiction of State Commission",
    s47.text="
47. Jurisdiction of State Commission.—(1) Subject to the other provisions of this Act, the State
Commission shall have jurisdiction—
(a) to entertain—
(i) complaints where the value of the goods or services paid as consideration, exceeds rupees
one crore, but does not exceed rupees ten crore:
Provided that where the Central Government deems it necessary so to do, it may prescribe
such other value, as it deems fit;
(ii) complaints against unfair contracts, where the value of goods or services paid as
consideration does not exceed ten crore rupees;
(iii) appeals against the orders of any District Commission within the State; and
(b) to call for the records and pass appropriate orders in any consumer dispute which is pending
before or has been decided by any District Commission within the State, where it appears to the State Commission that such District Commission has exercised a jurisdiction not vested in it by law, or has failed to exercise a jurisdiction so vested or has acted in exercise of its jurisdiction illegally or with material irregularity.
(2) The jurisdiction, powers and authority of the State Commission may be exercised by Benches
thereof, and a Bench may be constituted by the President with one or more members as the President may deem fit:
Provided that the senior-most member shall preside over the Bench.
(3) Where the members of a Bench differ in opinion on any point, the points shall be decided
according to the opinion of the majority, if there is a majority, but if the members are equally divided, they shall state the point or points on which they differ, and make a reference to the President who shall either hear the point or points himself or refer the case for hearing on such point or points by one or more of the other members and such point or points shall be decided according to the opinion of the majority of the members who have heard the case, including those who first heard it:
Provided that the President or the other members, as the case may be, shall give opinion on the point or points so referred within a period of one month from the date of such reference.
(4) A complaint shall be instituted in a State Commission within the limits of whose jurisdiction,--
(a) the opposite party or each of the opposite parties, where there are more than one, at the time of the institution of the complaint, ordinarily resides or carries on business or has a branch office or personally works for gain; or
(b) any of the opposite parties, where there are more than one, at the time of the institution of the complaint, actually and voluntarily resides, or carries on business or has a branch office or personally works for gain, provided in such case, the permission of the State Commission is given;
or
(c) the cause of action, wholly or in part, arises; or
(d) the complainant resides or personally works for gain.
",
    s47.source=d.source, s47.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s47)

MERGE (s48:Section {section_key:"CPA_2019::S_48"})
SET s48.doc_id="CPA_2019", s48.section_no="48",
    s48.title="Transfer of cases",
    s48.text="
48. Transfer of cases.—On the application of the complainant or of its own motion, the State
Commission may, at any stage of the proceeding, transfer any complaint pending before a District
Commission to another District Commission within the State if the interest of justice so requires.
",
    s48.source=d.source, s48.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s48)

MERGE (s49:Section {section_key:"CPA_2019::S_49"})
SET s49.doc_id="CPA_2019", s49.section_no="49",
    s49.title="Procedure applicable to State Commission",
    s49.text="
49. Procedure applicable to State Commission.—(1) The provisions relating to complaints under
sections 35, 36, 37, 38 and 39 shall, with such modifications as may be necessary, be applicable to the disposal of complaints by the State Commission.
(2) Without prejudice to the provisions of sub-section (1), the State Commission may also declare any terms of contract, which is unfair to any consumer, to be null and void.
",
    s49.source=d.source, s49.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s49)

MERGE (s50:Section {section_key:"CPA_2019::S_50"})
SET s50.doc_id="CPA_2019", s50.section_no="50",
    s50.title="Review by State Commission in certain cases",
    s50.text="
50. Review by State Commission in certain cases.—The State Commission shall have the power to
review any of the order passed by it if there is an error apparent on the face of the record, either of its own motion or on an application made by any of the parties within thirty days of such order.
",
    s50.source=d.source, s50.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s50)

MERGE (s51:Section {section_key:"CPA_2019::S_51"})
SET s51.doc_id="CPA_2019", s51.section_no="51",
    s51.title="Appeal to National Commission",
    s51.text="
51. Appeal to National Commission.—(1) Any person aggrieved by an order made by the State
Commission in exercise of its powers conferred by sub-clause (i) or (ii) of clause (a) of sub-section (1) of section 47 may prefer an appeal against such order to the National Commission within a period of thirty days from the date of the order in such form and manner as may be prescribed:
Provided that the National Commission shall not entertain the appeal after the expiry of the said period of thirty days unless it is satisfied that there was sufficient cause for not filing it within that period:
Provided further that no appeal by a person, who is required to pay any amount in terms of an order of the State Commission, shall be entertained by the National Commission unless the appellant has
deposited fifty per cent. of that amount in the manner as may be prescribed.
(2) Save as otherwise expressly provided under this Act or by any other law for the time being in force, an appeal shall lie to the National Commission from any order passed in appeal by any State Commission, if the National Commission is satisfied that the case involves a substantial question of law.
(3) In an appeal involving a question of law, the memorandum of appeal shall precisely state the
substantial question of law involved in the appeal.
(4) Where the National Commission is satisfied that a substantial question of law is involved in any case, it shall formulate that question and hear the appeal on that question:
Provided that nothing in this sub-section shall be deemed to take away or abridge the power of the National Commission to hear, for reasons to be recorded in writing, the appeal on any other substantial question of law, if it is satisfied that the case involves such question of law.
(5) An appeal may lie to the National Commission under this section from an order passed ex parte by the State Commission.
",
    s51.source=d.source, s51.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s51)

MERGE (s52:Section {section_key:"CPA_2019::S_52"})
SET s52.doc_id="CPA_2019", s52.section_no="52",
    s52.title="Hearing of appeal",
    s52.text="
52. Hearing of appeal.—An appeal filed before the State Commission or the National Commission,
as the case may be, shall be heard as expeditiously as possible and every endeavour shall be made to dispose of the appeal within a period of ninety days from the date of its admission:
Provided that no adjournment shall ordinarily be granted by the State Commission or the National
Commission, as the case may be, unless sufficient cause is shown and the reasons for grant of
adjournment have been recorded in writing by such Commission:
Provided further that the State Commission or the National Commission, as the case may be, shall
make such orders as to the costs occasioned by the adjournment, as may be specified by regulations:
Provided also that in the event of an appeal being disposed of after the period so specified, the State Commission or the National Commission, as the case may be, shall record in writing the reasons for the same at the time of disposing of the said appeal.
",
    s52.source=d.source, s52.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s52)

MERGE (s53:Section {section_key:"CPA_2019::S_53"})
SET s53.doc_id="CPA_2019", s53.section_no="53",
    s53.title="Establishment of National Consumer Disputes Redressal Commission",
    s53.text="
53. Establishment of National Consumer Disputes Redressal Commission.—(1) The Central
Government shall, by notification, establish a National Consumer Disputes Redressal Commission, to be known as the National Commission.
(2) The National Commission shall ordinarily function at the National Capital Region and perform its functions at such other places as the Central Government may in consultation with the National Commission notify in the Official Gazette:
Provided that the Central Government may, by notification, establish regional Benches of the
National Commission, at such places, as it deems fit.
",
    s53.source=d.source, s53.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s53)

MERGE (s54:Section {section_key:"CPA_2019::S_54"})
SET s54.doc_id="CPA_2019", s54.section_no="54",
    s54.title="Composition of National Commission",
    s54.text="
54. Composition of National Commission.—The National Commission shall consist of—
(a) a President; and
(b) not less than four and not more than such number of members as may be prescribed.
",
    s54.source=d.source, s54.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s54)

MERGE (s55:Section {section_key:"CPA_2019::S_55"})
SET s55.doc_id="CPA_2019", s55.section_no="55",
    s55.title="Qualifications, etc., of President and members of National Commission",
    s55.text="
55. Qualifications, etc., of President and members of National Commission.—(1) The Central
Government may, by notification, make rules to provide for qualifications, appointment, term of office, salaries and allowances, resignation, removal and other terms and conditions of service of the President and members of the National Commission:
Provided that the President and members of the National Commission shall hold office for such term as specified in the rules made by the Central Government but not exceeding five years from the date on which he enters upon his office and shall be eligible for re-appointment:
Provided further that no President or members shall hold office as such after he has attained such age as specified in the rules made by the Central Government which shall not exceed,—
(a) in the case of the President, the age of seventy years;
(b) in the case of any other member, the age of sixty-seven years.
(2) Neither the salary and allowances nor the other terms and conditions of service of President and members of the National Commission shall be varied to his disadvantage after his appointment.
",
    s55.source=d.source, s55.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s55);
