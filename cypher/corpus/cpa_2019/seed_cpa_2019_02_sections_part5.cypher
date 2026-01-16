MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH5"})
WITH d, c

// ----------------------------------------
// CHAPTER V — MEDIATION
// Sections: 74 to 81
// ----------------------------------------

MERGE (s74:Section {section_key:"CPA_2019::S_74"})
SET s74.doc_id="CPA_2019", s74.section_no="74",
    s74.title="Establishment of consumer mediation cell",
    s74.text="
74. Establishment of consumer mediation cell.—(1) The State Government shall establish, by
notification, a consumer mediation cell to be attached to each of the District Commissions and the State
Commissions of that State.
(2) The Central Government shall establish, by notification, a consumer mediation cell to be attached
to the National Commission and each of the regional Benches.
(3) A consumer mediation cell shall consist of such persons as may be prescribed.
(4) Every consumer mediation cell shall maintain—
(a) a list of empanelled mediators;
(b) a list of cases handled by the cell;
(c) record of proceeding; and
(d) any other information as may be specified by regulations.
(5) Every consumer mediation cell shall submit a quarterly report to the District Commission, State
Commission or the National Commission to which it is attached, in the manner specified by regulations.
",
    s74.source=d.source, s74.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s74)

MERGE (s75:Section {section_key:"CPA_2019::S_75"})
SET s75.doc_id="CPA_2019", s75.section_no="75",
    s75.title="Empanelment of mediators",
    s75.text="
75. Empanelment of mediators.—(1) For the purpose of mediation, the National Commission or the
State Commission or the District Commission, as the case may be, shall prepare a panel of the mediators
to be maintained by the consumer mediation cell attached to it, on the recommendation of a selection
committee consisting of the President and a member of that Commission.
(2) The qualifications and experience required for empanelment as mediator, the procedure for
empanelment, the manner of training empanelled mediators, the fee payable to empanelled mediator, the
terms and conditions for empanelment, the code of conduct for empanelled mediators, the grounds on
which, and the manner in which, empanelled mediators shall be removed or empanelment shall be
cancelled and other matters relating thereto, shall be such as may be specified by regulations.
(3) The panel of mediators prepared under sub-section (1) shall be valid for a period of five years, and
the empanelled mediators shall be eligible to be considered for re-empanelment for another term, subject
to such conditions as may be specified by regulations.
",
    s75.source=d.source, s75.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s75)

MERGE (s76:Section {section_key:"CPA_2019::S_76"})
SET s76.doc_id="CPA_2019", s76.section_no="76",
    s76.title="Nomination of mediators from panel",
    s76.text="
76. Nomination of mediators from panel.—The District Commission, the State Commission or the
National Commission shall, while nominating any person from the panel of mediators referred to in
section 75, consider his suitability for resolving the consumer dispute involved.
",
    s76.source=d.source, s76.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s76)

MERGE (s77:Section {section_key:"CPA_2019::S_77"})
SET s77.doc_id="CPA_2019", s77.section_no="77",
    s77.title="Duty of mediator to disclose certain facts",
    s77.text="
77. Duty of mediator to disclose certain facts.—It shall be the duty of the mediator to disclose—
(a) any personal, professional or financial interest in the outcome of the consumer dispute;
(b) the circumstances which may give rise to a justifiable doubt as to his independence or
impartiality; and
(c) such other facts as may be specified by regulations.
",
    s77.source=d.source, s77.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s77)

MERGE (s78:Section {section_key:"CPA_2019::S_78"})
SET s78.doc_id="CPA_2019", s78.section_no="78",
    s78.title="Replacement of mediator in certain cases",
    s78.text="
78. Replacement of mediator in certain cases.—Where the District Commission or the State
Commission or the National Commission, as the case may be, is satisfied, on the information furnished by
the mediator or on the information received from any other person including parties to the complaint and
after hearing the mediator, it shall replace such mediator by another mediator.
",
    s78.source=d.source, s78.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s78)

MERGE (s79:Section {section_key:"CPA_2019::S_79"})
SET s79.doc_id="CPA_2019", s79.section_no="79",
    s79.title="Procedure for mediation",
    s79.text="
79. Procedure for mediation.—(1) The mediation shall be held in the consumer mediation cell
attached to the District Commission, the State Commission or the National Commission, as the case may
be.
(2) Where a consumer dispute is referred for mediation by the District Commission or the State
Commission or the National Commission, as the case may be, the mediator nominated by such
Commission shall have regard to the rights and obligations of the parties, the usages of trade, if any, the
circumstances giving rise to the consumer dispute and such other relevant factors, as he may deem
necessary and shall be guided by the principles of natural justice while carrying out mediation.
(3) The mediator so nominated shall conduct mediation within such time and in such manner as may
be specified by regulations.
",
    s79.source=d.source, s79.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s79)

MERGE (s80:Section {section_key:"CPA_2019::S_80"})
SET s80.doc_id="CPA_2019", s80.section_no="80",
    s80.title="Settlement through mediation",
    s80.text="
80. Settlement through mediation.—(1) Pursuant to mediation, if an agreement is reached between
the parties with respect to all of the issues involved in the consumer dispute or with respect to only some
of the issues, the terms of such agreement shall be reduced to writing accordingly, and signed by the
parties to such dispute or their authorised representatives.
(2) The mediator shall prepare a settlement report of the settlement and forward the signed agreement
along with such report to the concerned Commission.
(3) Where no agreement is reached between the parties within the specified time or the mediator is of
the opinion that settlement is not possible, he shall prepare his report accordingly and submit the same to
the concerned Commission.
",
    s80.source=d.source, s80.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s80)

MERGE (s81:Section {section_key:"CPA_2019::S_81"})
SET s81.doc_id="CPA_2019", s81.section_no="81",
    s81.title="Recording settlement and passing of order",
    s81.text="
81. Recording settlement and passing of order.—(1) The District Commission or the State
Commission or the National Commission, as the case may be, shall, within seven days of the receipt of
the settlement report, pass suitable order recording such settlement of consumer dispute and dispose of the
matter accordingly.
(2) Where the consumer dispute is settled only in part, the District Commission or the State
Commission or the National Commission, as the case may be, shall record settlement of the issues which
have been so settled and continue to hear other issues involved in such consumer dispute.
(3) Where the consumer dispute could not be settled by mediation, the District Commission or the
State Commission or the National Commission, as the case may be, shall continue to hear all the issues
involved in such consumer dispute.
",
    s81.source=d.source, s81.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s81);
