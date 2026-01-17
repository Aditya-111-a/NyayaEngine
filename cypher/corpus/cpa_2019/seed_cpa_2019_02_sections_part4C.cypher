MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH4"})
WITH d, c

// ----------------------------------------
// CHAPTER IV — CONSUMER DISPUTES REDRESSAL COMMISSION
// Part4C: Sections 56 to 73
// ----------------------------------------

MERGE (s56:Section {section_key:"CPA_2019::S_56"})
SET s56.doc_id="CPA_2019", s56.section_no="56",
    s56.title="Transitional provision",
    s56.text="
56. Transitional provision.—The President and every other member appointed immediately before
the commencement of section 177 of the Finance Act, 2017 (7 of 2017) shall continue to be governed by
the provisions of the Consumer Protection Act, 1986 (68 of 1986) and the rules made there under as if
this Act had not come into force.
",
    s56.source=d.source, s56.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s56)

MERGE (s57:Section {section_key:"CPA_2019::S_57"})
SET s57.doc_id="CPA_2019", s57.section_no="57",
    s57.title="Other officers and employees of National Commission",
    s57.text="
57. Other officers and employees of National Commission.—(1) The Central Government shall
provide, in consultation with the President of the National Commission, such number of officers and other
employees to assist the National Commission in the discharge of its functions as it may think fit.
(2) The officers and other employees of the National Commission shall discharge their functions
under the general superintendence of the President of the National Commission.
(3) The salaries and allowances payable to, and the other terms and conditions of service of, the
officers and other employees of the National Commission shall be such as may be prescribed.
",
    s57.source=d.source, s57.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s57)

MERGE (s58:Section {section_key:"CPA_2019::S_58"})
SET s58.doc_id="CPA_2019", s58.section_no="58",
    s58.title="Jurisdiction of National Commission",
    s58.text="
58. Jurisdiction of National Commission.—(1) Subject to the other provisions of this Act, the
National Commission shall have jurisdiction—
(a) to entertain—
(i) complaints where the value of the goods or services paid as consideration exceeds rupees
ten crore:
Provided that where the Central Government deems it necessary so to do, it may prescribe
such other value, as it deems fit;
(ii) complaints against unfair contracts, where the value of goods or services paid as
consideration exceeds ten crore rupees;
(iii) appeals against the orders of any State Commission;
(iv) appeals against the orders of the Central Authority; and
(b) to call for the records and pass appropriate orders in any consumer dispute which is pending
before or has been decided by any State Commission where it appears to the National Commission
that such State Commission has exercised a jurisdiction not vested in it by law, or has failed to
exercise a jurisdiction so vested, or has acted in the exercise of its jurisdiction illegally or with
material irregularity.
(2) The jurisdiction, powers and authority of the National Commission may be exercised by Benches
thereof and a Bench may be constituted by the President with one or more members as he may deem fit:
Provided that the senior-most member of the Bench shall preside over the Bench.
(3) Where the members of a Bench differ in opinion on any point, the points shall be decided
according to the opinion of the majority, if there is a majority, but if the members are equally divided, they shall state the point or points on which they differ, and make a reference to the President who shall
either hear the point or points himself or refer the case for hearing on such point or points by one or more
of the other members and such point or points shall be decided according to the opinion of the majority of
the members who have heard the case, including those who first heard it:
Provided that the President or the other member, as the case may be, shall give opinion on the point or
points so referred within a period of two months from the date of such reference.
",
    s58.source=d.source, s58.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s58)

MERGE (s59:Section {section_key:"CPA_2019::S_59"})
SET s59.doc_id="CPA_2019", s59.section_no="59",
    s59.title="Procedure applicable to National Commission",
    s59.text="
59. Procedure applicable to National Commission.—(1) The provisions relating to complaints
under sections 35, 36, 37, 38 and 39 shall, with such modifications as may be considered necessary, be
applicable to the disposal of complaints by the National Commission.
(2) Without prejudice to sub-section (1), the National Commission may also declare any terms of
contract, which is unfair to any consumer to be null and void.
",
    s59.source=d.source, s59.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s59)

MERGE (s60:Section {section_key:"CPA_2019::S_60"})
SET s60.doc_id="CPA_2019", s60.section_no="60",
    s60.title="Review by National Commission in certain cases",
    s60.text="
60. Review by National Commission in certain cases.—The National Commission shall have the
power to review any of the order passed by it if there is an error apparent on the face of the record, either
of its own motion or on an application made by any of the parties within thirty days of such order.
",
    s60.source=d.source, s60.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s60)

MERGE (s61:Section {section_key:"CPA_2019::S_61"})
SET s61.doc_id="CPA_2019", s61.section_no="61",
    s61.title="Power to set aside ex parte orders",
    s61.text="
61. Power to set aside ex parte orders.—Where an order is passed by the National Commission ex
parte, the aggrieved party may make an application to the Commission for setting aside such order.
",
    s61.source=d.source, s61.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s61)

MERGE (s62:Section {section_key:"CPA_2019::S_62"})
SET s62.doc_id="CPA_2019", s62.section_no="62",
    s62.title="Transfer of cases",
    s62.text="
62. Transfer of cases.—On the application of the complainant or of its own motion, the National
Commission may, at any stage of the proceeding, in the interest of justice, transfer any complaint pending
before the District Commission of one State to a District Commission of another State or before one State
Commission to another State Commission.
",
    s62.source=d.source, s62.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s62)

MERGE (s63:Section {section_key:"CPA_2019::S_63"})
SET s63.doc_id="CPA_2019", s63.section_no="63",
    s63.title="Vacancy in office of President of National Commission",
    s63.text="
63. Vacancy in office of President of National Commission.—When the office of President of the
National Commission is vacant or a person occupying such office is, by reason of absence or otherwise,
unable to perform the duties of his office, these shall be performed by the senior-most member of the
National Commission:
Provided that where a retired Judge of a High Court or a person who has been a Judicial Member is a
member of the National Commission, such member or where the number of such members is more than
one, the senior-most person amongst such members, shall preside over the National Commission in the
absence of President of that Commission.
",
    s63.source=d.source, s63.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s63)

MERGE (s64:Section {section_key:"CPA_2019::S_64"})
SET s64.doc_id="CPA_2019", s64.section_no="64",
    s64.title="Vacancies or defects in appointment not to invalidate orders",
    s64.text="
64. Vacancies or defects in appointment not to invalidate orders.—No act or proceeding of the
District Commission, the State Commission or the National Commission shall be invalid by reason only
of the existence of any vacancy amongst its members or any defect in the constitution thereof.
",
    s64.source=d.source, s64.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s64)

MERGE (s65:Section {section_key:"CPA_2019::S_65"})
SET s65.doc_id="CPA_2019", s65.section_no="65",
    s65.title="Service of notice, etc.",
    s65.text="
65. Service of notice, etc.—(1) All notices, required by this Act to be served, shall be served by
delivering or transmitting a copy thereof by registered post acknowledgment due addressed to opposite
party against whom complaint is made or to the complainant by speed post or by such courier service,
approved by the District Commission, the State Commission or the National Commission, as the case
may be, or by any other mode of transmission of documents including electronic means.
(2) Without prejudice to the provisions contained in sub-section (1), the notice required by this Act
may be served on an electronic service provider at the address provided by it on the electronic platform
from where it provides its services as such and for this purpose, the electronic service provider shall
designate a nodal officer to accept and process such notices.
(3) When an acknowledgment or any other receipt purporting to be signed by the opposite party or his
agent or, as the case may be, by the complainant is received by the District Commission, the State
Commission or the National Commission, as the case may be, or postal article containing the notice is
received back by such District Commission, State Commission or the National Commission, with an
endorsement purporting to have been made by a postal employee or by any person authorised by the
courier service to the effect that the opposite party or his agent or complainant had refused to take
delivery of the postal article containing the notice or had refused to accept the notice by any other means
specified in sub-section (1) when tendered or transmitted to him, the District Commission or the State Commission or the National Commission, as the case may be, shall declare that the notice has been duly
served on the opposite party or to the complainant, as the case may be:
Provided that where the notice was properly addressed, pre-paid and duly sent by registered post
acknowledgment due, a declaration referred to in this sub-section shall be made notwithstanding the fact
that the acknowledgment has been lost or misplaced, or for any other reason, has not been received by the
District Commission, the State Commission or the National Commission, as the case may be, within
thirty days from the date of issue of notice.
(4) All notices required to be served on an opposite party or to complainant, as the case may be, shall
be deemed to be sufficiently served, if addressed in the case of the opposite party, to the place where
business or profession is carried on, and in case of the complainant, the place where such person actually
and voluntarily resides.
",
    s65.source=d.source, s65.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s65)

MERGE (s66:Section {section_key:"CPA_2019::S_66"})
SET s66.doc_id="CPA_2019", s66.section_no="66",
    s66.title="Experts to assist National Commission or State Commission",
    s66.text="
66. Experts to assist National Commission or State Commission.—Where the National
Commission or the State Commission, as the case may be, on an application by a complainant or
otherwise, is of the opinion that it involves the larger interest of consumers, it may direct any individual
or organisation or expert to assist the National Commission or the State Commission, as the case may be.
",
    s66.source=d.source, s66.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s66)

MERGE (s67:Section {section_key:"CPA_2019::S_67"})
SET s67.doc_id="CPA_2019", s67.section_no="67",
    s67.title="Appeal against order of National Commission",
    s67.text="
67. Appeal against order of National Commission.—Any person, aggrieved by an order made by
the National Commission in exercise of its powers conferred by sub-clause (i) or (ii) of clause (a) of
sub-section (1) of section 58, may prefer an appeal against such order to the Supreme Court within a
period of thirty days from the date of the order:
Provided that the Supreme Court may entertain an appeal after the expiry of the said period of thirty
days if it is satisfied that there was sufficient cause for not filing it within that period:
Provided further that no appeal by a person who is required to pay any amount in terms of an order of
the National Commission shall be entertained by the Supreme Court unless that person has deposited fifty
per cent. of that amount in the manner as may be prescribed.
",
    s67.source=d.source, s67.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s67)

MERGE (s68:Section {section_key:"CPA_2019::S_68"})
SET s68.doc_id="CPA_2019", s68.section_no="68",
    s68.title="Finality of orders",
    s68.text="
68. Finality of orders.—Every order of a District Commission or the State Commission or the
National Commission, as the case may be, shall, if no appeal has been preferred against such order under
the provisions of this Act, be final.
",
    s68.source=d.source, s68.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s68)

MERGE (s69:Section {section_key:"CPA_2019::S_69"})
SET s69.doc_id="CPA_2019", s69.section_no="69",
    s69.title="Limitation period",
    s69.text="
69. Limitation period.—(1) The District Commission, the State Commission or the National
Commission shall not admit a complaint unless it is filed within two years from the date on which the
cause of action has arisen.
(2) Notwithstanding anything contained in sub-section (1), a complaint may be entertained after the
period specified in sub-section (1), if the complainant satisfies the District Commission, the State
Commission or the National Commission, as the case may be, that he had sufficient cause for not filing
the complaint within such period:
Provided that no such complaint shall be entertained unless the District Commission or the State
Commission or the National Commission, as the case may be, records its reasons for condoning such
delay.
",
    s69.source=d.source, s69.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s69)

MERGE (s70:Section {section_key:"CPA_2019::S_70"})
SET s70.doc_id="CPA_2019", s70.section_no="70",
    s70.title="Administrative control",
    s70.text="
70. Administrative control.—(1) The National Commission shall have the authority to lay down
such adequate standards in consultation with the Central Government from time to time, for better
protection of the interests of consumers and for that purpose, shall have administrative control over all the
State Commissions in the following matters, namely:—
(a) monitoring performance of the State Commissions in terms of their disposal by calling for
periodical returns regarding the institution, disposal and pendency of cases;
(b) investigating into any allegations against the President and members of a State Commission
and submitting inquiry report to the State Government concerned along with copy endorsed to the
Central Government for necessary action;
(c) issuance of instructions regarding adoption of uniform procedure in the hearing of matters,
prior service of copies of documents produced by one party to the opposite parties, furnishing of
english translation of judgments written in any language, speedy grant of copies of documents;
(d) overseeing the functioning of the State Commission or the District Commission either by way
of inspection or by any other means, as the National Commission may like to order from time to time,
to ensure that the objects and purposes of the Act are best served and the standards set by the National
Commission are implemented without interfering with their quasi-judicial freedom.
(2) There shall be a monitoring cell to be constituted by the President of the National Commission to
oversee the functioning of the State Commissions from the administrative point of view.
(3) The State Commission shall have administrative control over all the District Commissions within
its jurisdiction in all matters referred to in sub-section (1).
(4) The National Commission and the State Commissions shall furnish to the Central Government
periodically or as and when required, any information including the pendency of cases in such form and
manner as may be prescribed.
(5) The State Commission shall furnish, periodically or as and when required to the State Government
any information including pendency of cases in such form and manner as may be prescribed.
",
    s70.source=d.source, s70.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s70)

MERGE (s71:Section {section_key:"CPA_2019::S_71"})
SET s71.doc_id="CPA_2019", s71.section_no="71",
    s71.title="Enforcement of orders of District Commission, State Commission and National Commission",
    s71.text="
71. Enforcement of orders of District Commission, State Commission and National
Commission.—Every order made by a District Commission, State Commission or the National
Commission shall be enforced by it in the same manner as if it were a decree made by a Court in a suit
before it and the provisions of Order XXI of the First Schedule to the Code of Civil Procedure, 1908 (5 of
1908) shall, as far as may be, applicable, subject to the modification that every reference therein to the
decree shall be construed as reference to the order made under this Act.
",
    s71.source=d.source, s71.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s71)

MERGE (s72:Section {section_key:"CPA_2019::S_72"})
SET s72.doc_id="CPA_2019", s72.section_no="72",
    s72.title="Penalty for non-compliance of order",
    s72.text="
72. Penalty for non-compliance of order.—(1) Whoever fails to comply with any order made by the
District Commission or the State Commission or the National Commission, as the case may be, shall be
punishable with imprisonment for a term which shall not be less than one month, but which may extend to
three years, or with fine, which shall not be less than twenty-five thousand rupees, but which may extend
to one lakh rupees, or with both.
(2) Notwithstanding anything contained in the Code of Criminal Procedure, 1973 (2 of 1974), the
District Commission, the State Commission or the National Commission, as the case may be, shall have
the power of a Judicial Magistrate of first class for the trial of offences under sub-section (1), and on
conferment of such powers, the District Commission or the State Commission or the National
Commission, as the case may be, shall be deemed to be a Judicial Magistrate of first class for the
purposes of the Code of Criminal Procedure, 1973.
(3) Save as otherwise provided, the offences under sub-section (1) shall be tried summarily by the
District Commission or the State Commission or the National Commission, as the case may be.
",
    s72.source=d.source, s72.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s72)

MERGE (s73:Section {section_key:"CPA_2019::S_73"})
SET s73.doc_id="CPA_2019", s73.section_no="73",
    s73.title="Appeal against order passed under section 72",
    s73.text="
73. Appeal against order passed under section 72.—(1) Notwithstanding anything contained in the
Code of Criminal Procedure, 1973 (2 of 1974), where an order is passed under sub-section (1) of section
72, an appeal shall lie, both on facts and on law from—
(a) the order made by the District Commission to the State Commission;
(b) the order made by the State Commission to the National Commission; and
(c) the order made by the National Commission to the Supreme Court.
(2) Except as provided in sub-section (1), no appeal shall lie before any court, from any order of a
District Commission or a State Commission or the National Commission, as the case may be.
(3) Every appeal under this section shall be preferred within a period of thirty days from the date of
order of a District Commission or a State Commission or the National Commission, as the case may be:
Provided that the State Commission or the National Commission or the Supreme Court, as the case
may be, may entertain an appeal after the expiry of the said period of thirty days, if it is satisfied that the
appellant had sufficient cause for not preferring the appeal within the said period of thirty days.
",
    s73.source=d.source,
    s73.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s73);
