MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH4"})
WITH d, c

// ----------------------------------------
// CHAPTER IV — CONSUMER DISPUTES REDRESSAL COMMISSION
// Part4A: Sections 28 to 41
// ----------------------------------------

MERGE (s28:Section {section_key:"CPA_2019::S_28"})
SET s28.doc_id="CPA_2019", s28.section_no="28",
    s28.title="Establishment of District Consumer Disputes Redressal Commission",
    s28.text="
28. Establishment of District Consumer Disputes Redressal Commission.—(1) The State
Government shall, by notification, establish a District Consumer Disputes Redressal Commission, to be known as the District Commission, in each district of the State:
Provided that the State Government may, if it deems fit, establish more than one District Commission in a district.
(2) Each District Commission shall consist of—
(a) a President; and 
(b) not less than two and not more than such number of members as may be prescribed, in
consultation with the Central Government.
",
    s28.source=d.source, s28.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s28)

MERGE (s29:Section {section_key:"CPA_2019::S_29"})
SET s29.doc_id="CPA_2019", s29.section_no="29",
    s29.title="Qualifications, etc., of President and members of District Commission",
    s29.text="
29. Qualifications, etc., of President and members of District Commission.—The Central
Government may, by notification, make rules to provide for the qualifications, method of recruitment, procedure for appointment, term of office, resignation and removal of the President and members of the District Commission.
",
    s29.source=d.source, s29.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s29)

MERGE (s30:Section {section_key:"CPA_2019::S_30"})
SET s30.doc_id="CPA_2019", s30.section_no="30",
    s30.title="Salaries, allowances and other terms and conditions of service of President and members of District Commission",
    s30.text="
30. Salaries, allowances and other terms and conditions of service of President and members of
District Commission.—The State Government may, by notification, make rules to provide for salaries and allowances and other terms and conditions of service of the President, and members of the District Commission.
",
    s30.source=d.source, s30.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s30)

MERGE (s31:Section {section_key:"CPA_2019::S_31"})
SET s31.doc_id="CPA_2019", s31.section_no="31",
    s31.title="Transitional provision",
    s31.text="
31. Transitional provision.—Any person appointed as President or, as the case may be, a member of the District Commission immediately before the commencement of this Act shall hold office as such as President or, as the case may be, as member till the completion of his term for which he has been appointed.
",
    s31.source=d.source, s31.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s31)

MERGE (s32:Section {section_key:"CPA_2019::S_32"})
SET s32.doc_id="CPA_2019", s32.section_no="32",
    s32.title="Vacancy in office of member of District Commission",
    s32.text="
32. Vacancy in office of member of District Commission.—If, at any time, there is a vacancy in the office of the President or member of a District Commission, the State Government may, by notification, direct—
(a) any other District Commission specified in that notification to exercise the jurisdiction in
respect of that district also; or
(b) the President or a member of any other District Commission specified in that notification to
exercise the powers and discharge the functions of the President or member of that District
Commission also.
",
    s32.source=d.source, s32.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s32)

MERGE (s33:Section {section_key:"CPA_2019::S_33"})
SET s33.doc_id="CPA_2019", s33.section_no="33",
    s33.title="Officers and other employees of District Commission",
    s33.text="
33. Officers and other employees of District Commission.—(1) The State Government shall
provide the District Commission with such officers and other employees as may be required to assist the District Commission in the discharge of its functions.
(2) The officers and other employees of the District Commission shall discharge their functions under the general superintendence of the President of the District Commission.
(3) The salaries and allowances payable to, and the other terms and conditions of service of, the officers and other employees of the District Commission shall be such as may be prescribed.
",
    s33.source=d.source, s33.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s33)

MERGE (s34:Section {section_key:"CPA_2019::S_34"})
SET s34.doc_id="CPA_2019", s34.section_no="34",
    s34.title="Jurisdiction of District Commission",
    s34.text="
34. Jurisdiction of District Commission.—(1) Subject to the other provisions of this Act, the
District Commission shall have jurisdiction to entertain complaints where the value of the goods or services paid as consideration does not exceed one crore rupees:
Provided that where the Central Government deems it necessary so to do, it may prescribe such other value, as it deems fit.
(2) A complaint shall be instituted in a District Commission within the local limits of whose
jurisdiction,—
(a) the opposite party or each of the opposite parties, where there are more than one, at the time of the institution of the complaint, ordinarily resides or carries on business or has a branch office or personally works for gain; or
(b) any of the opposite parties, where there are more than one, at the time of the institution of the complaint, actually and voluntarily resides, or carries on business or has a branch office, or personally works for gain, provided that in such case the permission of the District Commission is given; or
(c) the cause of action, wholly or in part, arises; or
(d) the complainant resides or personally works for gain.
(3) The District Commission shall ordinarily function in the district headquarters and may perform its functions at such other place in the district, as the State Government may, in consultation with the State Commission, notify in the Official Gazette from time to time.
",
    s34.source=d.source, s34.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s34)

MERGE (s35:Section {section_key:"CPA_2019::S_35"})
SET s35.doc_id="CPA_2019", s35.section_no="35",
    s35.title="Manner in which complaint shall be made",
    s35.text="
35. Manner in which complaint shall be made.—(1) A complaint, in relation to any goods sold or
delivered or agreed to be sold or delivered or any service provided or agreed to be provided, may be filed with a District Commission by—
(a) the consumer,—
(i) to whom such goods are sold or delivered or agreed to be sold or delivered or such service
is provided or agreed to be provided; or
(ii) who alleges unfair trade practice in respect of such goods or service;
(b) any recognised consumer association, whether the consumer to whom such goods are sold or
delivered or agreed to be sold or delivered or such service is provided or agreed to be provided, or who alleges unfair trade practice in respect of such goods or service, is a member of such association
or not;
(c) one or more consumers, where there are numerous consumers having the same interest, with
the permission of the District Commission, on behalf of, or for the benefit of, all consumers so
interested; or
(d) the Central Government, the Central Authority or the State Government, as the case may be:
Provided that the complaint under this sub-section may be filed electronically in such manner as may be prescribed.
Explanation.—For the purposes of this sub-section, 'recognised consumer association' means any
voluntary consumer association registered under any law for the time being in force.
(2) Every complaint filed under sub-section (1) shall be accompanied with such fee and payable in such manner, including electronic form, as may be prescribed.
",
    s35.source=d.source, s35.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s35)

MERGE (s36:Section {section_key:"CPA_2019::S_36"})
SET s36.doc_id="CPA_2019", s36.section_no="36",
    s36.title="Proceedings before District Commission",
    s36.text="
36. Proceedings before District Commission.—(1) Every proceeding before the District
Commission shall be conducted by the President of that Commission and atleast one member thereof, sitting together:
Provided that where a member, for any reason, is unable to conduct a proceeding till it is completed, the President and the other member shall continue the proceeding from the stage at which it was last heard by the previous member.
(2) On receipt of a complaint made under section 35, the District Commission may, by order, admit the complaint for being proceeded with or reject the same:
Provided that a complaint shall not be rejected under this section unless an opportunity of being heard has been given to the complainant:
Provided further that the admissibility of the complaint shall ordinarily be decided within twenty-one days from the date on which the complaint was filed.
(3) Where the District Commission does not decide the issue of admissibility of the complaint within the period so specified, it shall be deemed to have been admitted.
",
    s36.source=d.source, s36.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s36)

MERGE (s37:Section {section_key:"CPA_2019::S_37"})
SET s37.doc_id="CPA_2019", s37.section_no="37",
    s37.title="Reference to mediation",
    s37.text="
37. Reference to mediation.—(1) At the first hearing of the complaint after its admission, or at any later stage, if it appears to the District Commission that there exists elements of a settlement which may be acceptable to the parties, except in such cases as may be prescribed, it may direct the parties to give in writing, within five days, consent to have their dispute settled by mediation in accordance with the provisions of Chapter V.
(2) Where the parties agree for settlement by mediation and give their consent in writing, the District Commission shall, within five days of receipt of such consent, refer the matter for mediation, and in such case, the provisions of Chapter V, relating to mediation, shall apply.
",
    s37.source=d.source, s37.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s37)

MERGE (s38:Section {section_key:"CPA_2019::S_38"})
SET s38.doc_id="CPA_2019", s38.section_no="38",
    s38.title="Procedure on admission of complaint",
    s38.text="
38. Procedure on admission of complaint.—(1) The District Commission shall, on admission of a
complaint, or in respect of cases referred for mediation on failure of settlement by mediation, proceed with such complaint.
(2) Where the complaint relates to any goods, the District Commission shall,—
(a) refer a copy of the admitted complaint, within twenty-one days from the date of its admission to the opposite party mentioned in the complaint directing him to give his version of the case within a period of thirty days or such extended period not exceeding fifteen days as may be granted by it;
(b) if the opposite party on receipt of a complaint referred to him under clause (a) denies or
disputes the allegations contained in the complaint, or omits or fails to take any action to represent his case within the time given by the District Commission, proceed to settle the consumer dispute in the manner specified in clauses (c) to (g);
(c) if the complaint alleges a defect in the goods which cannot be determined without proper
analysis or test of the goods, obtain a sample of the goods from the complainant, seal it and
authenticate it in the manner as may be prescribed and refer the sample so sealed to the appropriate laboratory along with a direction that such laboratory to make an analysis or test, whichever may be necessary, with a view to finding out whether such goods suffer from any defect alleged in the complaint or from any other defect and to report its findings thereon to the District Commission within a period of forty-five days of the receipt of the reference or within such extended period as may be granted by it;
(d) before any sample of the goods is referred to any appropriate laboratory under clause (c),
require the complainant to deposit to the credit of the Commission such fees as may be specified, for payment to the appropriate laboratory for carrying out the necessary analysis or test in relation to the goods in question;
(e) remit the amount deposited to its credit under clause (d) to the appropriate laboratory to enable it to carry out the analysis or test mentioned in clause (c) and on receipt of the report from the appropriate laboratory, it shall forward a copy of the report along with such remarks as it may feel appropriate to the opposite party;
(f) if any of the parties disputes the correctness of the findings of the appropriate laboratory, or disputes the correctness of the methods of analysis or test adopted by the appropriate laboratory, require the opposite party or the complainant to submit in writing his objections with regard to the report made by the appropriate laboratory;
(g) give a reasonable opportunity to the complainant as well as the opposite party of being heard as to the correctness or otherwise of the report made by the appropriate laboratory and also as to the objection made in relation thereto under clause (f) and issue an appropriate order under section 39.
(3) The District Commission shall, if the complaint admitted by it under sub-section (2) of section 36 relates to goods in respect of which the procedure specified in sub-section (2) cannot be followed, or if the complaint relates to any services,—
(a) refer a copy of such complaint to the opposite party directing him to give his version of the case within a period of thirty days or such extended period not exceeding fifteen days as may be granted by the District Commission;
(b) if the opposite party, on receipt of a copy of the complaint, referred to him under clause (a) denies or disputes the allegations contained in the complaint, or omits or fails to take any action to represent his case within the time given by the District Commission, it shall proceed to settle the consumer dispute—
(i) on the basis of evidence brought to its notice by the complainant and the opposite party, if the opposite party denies or disputes the allegations contained in the complaint, or
(ii) ex parte on the basis of evidence brought to its notice by the complainant, where the
opposite party omits or fails to take any action to represent his case within the time given by the Commission;
(c) decide the complaint on merits if the complainant fails to appear on the date of hearing.
(4) For the purposes of sub-sections (2) and (3), the District Commission may, by order, require an electronic service provider to provide such information, documents or records, as may be specified in that order.
(5) No proceedings complying with the procedure laid down in [sub-sections (2) and (3)] shall be
called in question in any court on the ground that the principles of natural justice have not been complied with.
(6) Every complaint shall be heard by the District Commission on the basis of affidavit and
documentary evidence placed on record:
Provided that where an application is made for hearing or for examination of parties in person or through video conferencing, the District Commission may, on sufficient cause being shown, and after recording its reasons in writing, allow the same.
(7) Every complaint shall be disposed of as expeditiously as possible and endeavour shall be made to decide the complaint within a period of three months from the date of receipt of notice by opposite party where the complaint does not require analysis or testing of commodities and within five months if it requires analysis or testing of commodities:
Provided that no adjournment shall ordinarily be granted by the District Commission unless sufficient cause is shown and the reasons for grant of adjournment have been recorded in writing by the
Commission:
Provided further that the District Commission shall make such orders as to the costs occasioned by the adjournment as may be specified by regulations:
Provided also that in the event of a complaint being disposed of after the period so specified, the District Commission shall record in writing, the reasons for the same at the time of disposing of the said complaint.
(8) Where during the pendency of any proceeding before the District Commission, if it appears
necessary, it may pass such interim order as is just and proper in the facts and circumstances of the case.
(9) For the purposes of this section, the District Commission shall have the same powers as are vested in a civil court under the Code of Civil Procedure, 1908 (5 of 1908) while trying a suit in respect of the following matters, namely:—
(a) the summoning and enforcing the attendance of any defendant or witness and examining the
witness on oath;
(b) requiring the discovery and production of any document or other material object as evidence;
(c) receiving of evidence on affidavits;
(d) the requisitioning of the report of the concerned analysis or test from the appropriate
laboratory or from any other relevant source;
(e) issuing of commissions for the examination of any witness, or document; and
(f) any other matter which may be prescribed by the Central Government.
(10) Every proceeding before the District Commission shall be deemed to be a judicial proceeding
within the meaning of section 193 and 228 of the Indian Penal Code (45 of 1860), and the District Commission shall be deemed to be a criminal court for the purposes of section 195 and Chapter XXVI of the Code of Criminal Procedure, 1973 (2 of 1974).
(11) Where the complainant is a consumer referred to in sub-clause (v) of clause (5) of section 2, the provisions of Order I Rule 8 of the First Schedule to the Code of Civil Procedure, 1908 (5 of 1908) shall apply subject to the modification that every reference therein to a suit or decree shall be construed as a reference to a complaint or the order of the District Commission thereon.
(12) In the event of death of a complainant who is a consumer or of the opposite party against whom the complaint has been filed, the provisions of Order XXII of the First Schedule to the Code of Civil Procedure, 1908 (5 of 1908) shall apply subject to the modification that every reference therein to the plaintiff and the defendant shall be construed as reference to a complainant or the opposite party, as the case may be.
",
    s38.source=d.source, s38.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s38)

MERGE (s39:Section {section_key:"CPA_2019::S_39"})
SET s39.doc_id="CPA_2019", s39.section_no="39",
    s39.title="Findings of District Commission",
    s39.text="
39. Findings of District Commission.—(1) Where the District Commission is satisfied that the
goods complained against suffer from any of the defects specified in the complaint or that any of the allegations contained in the complaint about the services or any unfair trade practices, or claims for compensation under product liability are proved, it shall issue an order to the opposite party directing him
to do one or more of the following, namely:—
(a) to remove the defect pointed out by the appropriate laboratory from the goods in question;
(b) to replace the goods with new goods of similar description which shall be free from any
defect;
(c) to return to the complainant the price, or, as the case may be, the charges paid by the
complainant along with such interest on such price or charges as may be decided;
(d) to pay such amount as may be awarded by it as compensation to the consumer for any loss or
injury suffered by the consumer due to the negligence of the opposite party:
Provided that the District Commission shall have the power to grant punitive damages in such
circumstances as it deems fit;
(e) to pay such amount as may be awarded by it as compensation in a product liability action
under Chapter VI;
(f) to remove the defects in goods or deficiencies in the services in question;
(g) to discontinue the unfair trade practice or restrictive trade practice and not to repeat them;
(h) not to offer the hazardous or unsafe goods for sale;
(i) to withdraw the hazardous goods from being offered for sale;
(j) to cease manufacture of hazardous goods and to desist from offering services which are
hazardous in nature;
(k) to pay such sum as may be determined by it, if it is of the opinion that loss or injury has been suffered by a large number of consumers who are not identifiable conveniently:
Provided that the minimum amount of sum so payable shall not be less than twenty-five per cent.
of the value of such defective goods sold or service provided, as the case may be, to such consumers;
(l) to issue corrective advertisement to neutralise the effect of misleading advertisement at the cost of the opposite party responsible for issuing such misleading advertisement;
(m) to provide for adequate costs to parties; and (n) to cease and desist from issuing any misleading advertisement.
(2) Any amount obtained under sub-section (1) shall be credited to such fund and utilised in such manner as may be prescribed.
(3) In any proceeding conducted by the President and a member and if they differ on any point or
points, they shall state the point or points on which they differ and refer the same to another member for hearing on such point or points and the opinion of the majority shall be the order of the District Commission:
Provided that the other member shall give his opinion on such point or points referred to him within a period of one month from the date of such reference.
(4) Every order made by the District Commission under sub-section (1) shall be signed by the
President and the member who conducted the proceeding:
Provided that where the order is made as per majority opinion under sub-section (3), such order shall also be signed by the other member.
",
    s39.source=d.source, s39.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s39)

MERGE (s40:Section {section_key:"CPA_2019::S_40"})
SET s40.doc_id="CPA_2019", s40.section_no="40",
    s40.title="Review by District Commission in certain cases",
    s40.text="
40. Review by District Commission in certain cases.—The District Commission shall have the
power to review any of the order passed by it if there is an error apparent on the face of the record, either of its own motion or on an application made by any of the parties within thirty days of such order.
",
    s40.source=d.source, s40.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s40)

MERGE (s41:Section {section_key:"CPA_2019::S_41"})
SET s41.doc_id="CPA_2019", s41.section_no="41",
    s41.title="Appeal against order of District Commission",
    s41.text="
41. Appeal against order of District Commission.—Any person aggrieved by an order made by the
District Commission may prefer an appeal against such order to the State Commission on the grounds of facts or law within a period of forty-five days from the date of the order, in such form and manner, as may be prescribed:
Provided that the State Commission may entertain an appeal after the expiry of the said period of forty-five days, if it is satisfied that there was sufficient cause for not filing it within that period:
Provided further that no appeal by a person, who is required to pay any amount in terms of an order of the District Commission, shall be entertained by the State Commission unless the appellant has deposited fifty per cent. of that amount in the manner as may be prescribed:
Provided also that no appeal shall lie from any order passed under sub-section (1) of section 81 by the District Commission pursuant to a settlement by mediation under section 80.
",
    s41.source=d.source, s41.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s41);
