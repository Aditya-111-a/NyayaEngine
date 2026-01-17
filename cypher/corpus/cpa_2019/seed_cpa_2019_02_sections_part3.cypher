MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH3"})
WITH d, c

// ----------------------------------------
// CHAPTER III — CENTRAL CONSUMER PROTECTION AUTHORITY
// Sections: 10 to 27
// ----------------------------------------

// Section 10
MERGE (s10:Section {section_key:"CPA_2019::S_10"})
SET s10.doc_id = "CPA_2019",
    s10.section_no = "10",
    s10.title = "Establishment of Central Consumer Protection Authority",
    s10.text = "
10. Establishment of Central Consumer Protection Authority.—(1) The Central Government shall, by notification, establish with effect from such date as it may specify in that notification, a Central Consumer Protection Authority to be known as the Central Authority to regulate matters relating to violation of rights of consumers, unfair trade practices and false or misleading advertisements which are prejudicial to the interests of public and consumers and to promote, protect and enforce the rights of consumers as a class.
(2) The Central Authority shall consist of a Chief Commissioner and such number of other
Commissioners as may be prescribed, to be appointed by the Central Government to exercise the powers and discharge the functions under this Act.
(3) The headquarters of the Central Authority shall be at such place in the National Capital Region of Delhi, and it shall have regional and other offices in any other place in India as the Central Government may decide.
",
    s10.source = d.source,
    s10.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s10)

// Section 11
MERGE (s11:Section {section_key:"CPA_2019::S_11"})
SET s11.doc_id = "CPA_2019",
    s11.section_no = "11",
    s11.title = "Qualifications, method of recruitment, etc., of Chief Commissioner and Commissioners",
    s11.text = "
11. Qualifications, method of recruitment, etc., of Chief Commissioner and Commissioners.—
The Central Government may, by notification, make rules to provide for the qualifications for
appointment, method of recruitment, procedure for appointment, term of office, salaries and allowances, resignation, removal and other terms and conditions of the service of the Chief Commissioner and Commissioners of the Central Authority.
",
    s11.source = d.source,
    s11.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s11)

// Section 12
MERGE (s12:Section {section_key:"CPA_2019::S_12"})
SET s12.doc_id = "CPA_2019",
    s12.section_no = "12",
    s12.title = "Vacancy, etc., not to invalidate proceedings of Central Authority",
    s12.text = "
12. Vacancy, etc., not to invalidate proceedings of Central Authority.—No act or proceeding of
the Central Authority shall be invalid merely by reason of—
(a) any vacancy in, or any defect in the constitution of, the Central Authority; or
(b) any defect in the appointment of a person acting as the Chief Commissioner or as a Commissioner; or
(c) any irregularity in the procedure of the Central Authority not affecting the merits of the case.
",
    s12.source = d.source,
    s12.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s12)

// Section 13
MERGE (s13:Section {section_key:"CPA_2019::S_13"})
SET s13.doc_id = "CPA_2019",
    s13.section_no = "13",
    s13.title = "Appointment of officers, experts, professionals and other employees of Central Authority",
    s13.text = "
13. Appointment of officers, experts, professionals and other employees of Central Authority.—
(1) The Central Government shall provide the Central Authority such number of officers and other
employees as it considers necessary for the efficient performance of its functions under this Act.
(2) The salaries and allowances payable to, and the other terms and conditions of service of, the officers and other employees of the Central Authority appointed under this Act shall be such as may be prescribed.
(3) The Central Authority may engage, in accordance with the procedure specified by regulations,
such number of experts and professionals of integrity and ability, who have special knowledge and experience in the areas of consumer rights and welfare, consumer policy, law, medicine, food safety, health, engineering, product safety, commerce, economics, public affairs or administration, as it deems necessary to assist it in the discharge of its functions under this Act.
",
    s13.source = d.source,
    s13.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s13)

// Section 14
MERGE (s14:Section {section_key:"CPA_2019::S_14"})
SET s14.doc_id = "CPA_2019",
    s14.section_no = "14",
    s14.title = "Procedure of Central Authority",
    s14.text = "
14. Procedure of Central Authority. —(1) The Central Authority shall regulate the procedure for
transaction of its business and allocation of its business amongst the Chief Commissioner and
Commissioners as may be specified by regulations.
(2) The Chief Commissioner shall have the powers of general superintendence, direction and control in respect of all administrative matters of the Central Authority:
Provided that the Chief Commissioner may delegate such of his powers relating to administrative
matters of the Central Authority, as he may think fit, to any Commissioner (including Commissioner of a regional office) or any other officer of the Central Authority.
",
    s14.source = d.source,
    s14.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s14)

// Section 15
MERGE (s15:Section {section_key:"CPA_2019::S_15"})
SET s15.doc_id = "CPA_2019",
    s15.section_no = "15",
    s15.title = "Investigation Wing",
    s15.text = "
15. Investigation Wing.—(1) The Central Authority shall have an Investigation Wing headed by a
Director-General for the purpose of conducting inquiry or investigation under this Act as may be directed by the Central Authority.
(2) The Central Government may appoint a Director-General and such number of Additional
Director-General, Director, Joint Director, Deputy Director and Assistant Director, from amongst persons who have experience in investigation and possess such qualifications, in such manner, as may be prescribed.
(3) Every Additional Director-General, Director, Joint Director, Deputy Director and Assistant
Director shall exercise his powers, and discharge his functions, subject to the general control, supervision and direction of the Director-General.
(4) The Director-General may delegate all or any of his powers to the Additional Director-General or Director, Joint Director or Deputy Director or Assistant Director, as the case may be, while conducting inquiries or investigations under this Act.
(5) The inquiries or the investigations made by the Director-General shall be submitted to the Central Authority in such form, in such manner and within such time, as may be specified by regulations.
",
    s15.source = d.source,
    s15.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s15)

// Section 16
MERGE (s16:Section {section_key:"CPA_2019::S_16"})
SET s16.doc_id = "CPA_2019",
    s16.section_no = "16",
    s16.title = "Power of District Collector",
    s16.text = "
16. Power of District Collector.—The District Collector (by whatever name called) may, on a
complaint or on a reference made to him by the Central Authority or the Commissioner of a regional office, inquire into or investigate complaints regarding violation of rights of consumers as a class, on matters relating to violations of consumer rights, unfair trade practices and false or misleading advertisements, within his jurisdiction and submit his report to the Central Authority or to the Commissioner of a regional office, as the case may be.
",
    s16.source = d.source,
    s16.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s16)

// Section 17
MERGE (s17:Section {section_key:"CPA_2019::S_17"})
SET s17.doc_id = "CPA_2019",
    s17.section_no = "17",
    s17.title = "Complaints to authorities",
    s17.text = "
17. Complaints to authorities.—A complaint relating to violation of consumer rights or unfair trade practices or false or misleading advertisements which are prejudicial to the interests of consumers as a class, may be forwarded either in writing or in electronic mode, to any one of the authorities, namely, the District Collector or the Commissioner of regional office or the Central Authority.
",
    s17.source = d.source,
    s17.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s17)

// Section 18
MERGE (s18:Section {section_key:"CPA_2019::S_18"})
SET s18.doc_id = "CPA_2019",
    s18.section_no = "18",
    s18.title = "Powers and functions of Central Authority",
    s18.text = "
18. Powers and functions of Central Authority.—(1) The Central Authority shall—
(a) protect, promote and enforce the rights of consumers as a class, and prevent violation of
consumers rights under this Act;
(b) prevent unfair trade practices and ensure that no person engages himself in unfair trade
practices;
(c) ensure that no false or misleading advertisement is made of any goods or services which
contravenes the provisions of this Act or the rules or regulations made thereunder;
(d) ensure that no person takes part in the publication of any advertisement which is false or
misleading.
(2) Without prejudice to the generality of the provisions contained in sub-section (1), the Central Authority may, for any of the purposes aforesaid,--
(a) inquire or cause an inquiry or investigation to be made into violations of consumer rights or unfair trade practices, either suo motu or on a complaint received or on the directions from the Central Government;
(b) file complaints before the District Commission, the State Commission or the National
Commission, as the case may be, under this Act;
(c) intervene in any proceedings before the District Commission or the State Commission or the
National Commission, as the case may be, in respect of any allegation of violation of consumer rights or unfair trade practices;
(d) review the matters relating to, and the factors inhibiting enjoyment of, consumer rights,
including safeguards provided for the protection of consumers under any other law for the time being in force and recommend appropriate remedial measures for their effective implementation;
(e) recommend adoption of international covenants and best international practices on consumer
rights to ensure effective enforcement of consumer rights;
(f) undertake and promote research in the field of consumer rights;
(g) spread and promote awareness on consumer rights;
(h) encourage non-Governmental organisations and other institutions working in the field of
consumer rights to co-operate and work with consumer protection agencies;
(i) mandate the use of unique and universal goods identifiers in such goods, as may be necessary, to prevent unfair trade practices and to protect consumers\' interest;
(j) issue safety notices to alert consumers against dangerous or hazardous or unsafe goods or
services;
(k) advise the Ministries and Departments of the Central and State Governments on consumer
welfare measures;
(l) issue necessary guidelines to prevent unfair trade practices and protect consumers\' interest.
",
    s18.source = d.source,
    s18.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s18)

// Section 19
MERGE (s19:Section {section_key:"CPA_2019::S_19"})
SET s19.doc_id = "CPA_2019",
    s19.section_no = "19",
    s19.title = "Power of Central Authority to refer matter for investigation or to other Regulator",
    s19.text = "
19. Power of Central Authority to refer matter for investigation or to other Regulator.—(1) The
Central Authority may, after receiving any information or complaint or directions from the Central Government or of its own motion, conduct or cause to be conducted a preliminary inquiry as to whether there exists a prima facie case of violation of consumer rights or any unfair trade practice or any false or misleading advertisement, by any person, which is prejudicial to the public interest or to the interests of consumers and if it is satisfied that there exists a prima facie case, it shall cause investigation to be made by the Director-General or by the District Collector.
(2) Where, after preliminary inquiry, the Central Authority is of the opinion that the matter is to be dealt with by a Regulator established under any other law for the time being in force, it may refer such matter to the concerned Regulator along with its report.
(3) For the purposes of investigation under sub-section (1), the Central Authority, the Director
General or the District Collector may call upon a person referred to in sub-section (1) and also direct him to produce any document or record in his possession.
",
    s19.source = d.source,
    s19.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s19)

// Section 20
MERGE (s20:Section {section_key:"CPA_2019::S_20"})
SET s20.doc_id = "CPA_2019",
    s20.section_no = "20",
    s20.title = "Power of Central Authority to recall goods, etc.",
    s20.text = "
20. Power of Central Authority to recall goods, etc.—Where the Central Authority is satisfied on
the basis of investigation that there is sufficient evidence to show violation of consumer rights or unfair trade practice by a person, it may pass such order as may be necessary, including—
(a) recalling of goods or withdrawal of services which are dangerous, hazardous or unsafe;
(b) reimbursement of the prices of goods or services so recalled to purchasers of such goods or
services; and
(c) discontinuation of practices which are unfair and prejudicial to consumers\' interest:
Provided that the Central Authority shall give the person an opportunity of being heard before passing an order under this section.
",
    s20.source = d.source,
    s20.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s20)

// Section 21
MERGE (s21:Section {section_key:"CPA_2019::S_21"})
SET s21.doc_id = "CPA_2019",
    s21.section_no = "21",
    s21.title = "Power of Central Authority to issue directions and penalties against false or misleading advertisements",
    s21.text = "
21. Power of Central Authority to issue directions and penalties against false or misleading
advertisements.—(1) Where the Central Authority is satisfied after investigation that any advertisement is false or misleading and is prejudicial to the interest of any consumer or is in contravention of consumer rights, it may, by order, issue directions to the concerned trader or manufacturer or endorser or advertiser or publisher, as the case may be, to discontinue such advertisement or to modify the same in such manner and within such time as may be specified in that order.
(2) Notwithstanding the order passed under sub-section (1), if the Central Authority is of the opinion that it is necessary to impose a penalty in respect of such false or misleading advertisement, by a manufacturer or an endorser, it may, by order, impose on manufacturer or endorser a penalty which may extend to ten lakh rupees:
Provided that the Central Authority may, for every subsequent contravention by a manufacturer or
endorser, impose a penalty, which may extend to fifty lakh rupees.
(3) Notwithstanding any order under sub-sections (1) and (2), where the Central Authority deems it necessary, it may, by order, prohibit the endorser of a false or misleading advertisement from making endorsement of any product or service for a period which may extend to one year:
Provided that the Central Authority may, for every subsequent contravention, prohibit such endorser from making endorsement in respect of any product or service for a period which may extend to three years.
(4) Where the Central Authority is satisfied after investigation that any person is found to publish, or is a party to the publication of, a misleading advertisement, it may impose on such person a penalty which may extend to ten lakh rupees.
(5) No endorser shall be liable to a penalty under sub-sections (2) and (3) if he has exercised due diligence to verify the veracity of the claims made in the advertisement regarding the product or service being endorsed by him.
(6) No person shall be liable to such penalty if he proves that he had published or arranged for the publication of such advertisement in the ordinary course of his business:
Provided that no such defence shall be available to such person if he had previous knowledge of the order passed by the Central Authority for withdrawal or modification of such advertisement.
(7) While determining the penalty under this section, regard shall be had to the following, namely: —
(a) the population and the area impacted or affected by such offence;
(b) the frequency and duration of such offence;
(c) the vulnerability of the class of persons likely to be adversely affected by such offence; and
(d) the gross revenue from the sales effected by virtue of such offence.
(8) The Central Authority shall give the person an opportunity of being heard before an order under this section is passed.
",
    s21.source = d.source,
    s21.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s21)

// Section 22
MERGE (s22:Section {section_key:"CPA_2019::S_22"})
SET s22.doc_id = "CPA_2019",
    s22.section_no = "22",
    s22.title = "Search and seizure",
    s22.text = "
22. Search and seizure.—(1) For the purpose of conducting an investigation after preliminary
inquiry under sub-section (1) of section 19, the Director-General or any other officer authorised by him in this behalf, or the District Collector, as the case may be, may, if he has any reason to believe that any person has violated any consumer rights or committed unfair trade practice or causes any false or
misleading advertisement to be made, shall,--
(a) enter at any reasonable time into any such premises and search for any document or record or
article or any other form of evidence and seize such document, record, article or such evidence;
(b) make a note or an inventory of such record or article; or
(c) require any person to produce any record, register or other document or article.
(2) The provisions of the Code of Criminal Procedure, 1973 (2 of 1974), relating to search and seizure shall apply, as far as may be, for search and seizure under this Act.
(3) Every document, record or article seized under clause (a) of sub-section (1) or produced under clause (c) of that sub-section shall be returned to the person, from whom they were seized or who produced the same, within a period of twenty days of the date of such seizure or production, as the case may be, after copies thereof or extracts therefrom certified by that person, in such manner as may be prescribed, have been taken.
(4) Where any article seized under sub-section (1) are subject to speedy or natural decay, the
Director-General or such other officer may dispose of the article in such manner as may be prescribed.
(5) In the case of articles other than the articles referred to in sub-section (4), provisions contained in clause (c) of sub-section (2) of section 38 shall mutatis mutandis apply in relation to analysis or tests.
",
    s22.source = d.source,
    s22.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s22)

// Section 23
MERGE (s23:Section {section_key:"CPA_2019::S_23"})
SET s23.doc_id = "CPA_2019",
    s23.section_no = "23",
    s23.title = "Designation of any statutory authority or body to function as Central Authority",
    s23.text = "
23. Designation of any statutory authority or body to function as Central Authority.—The
Central Government may, if it considers necessary, by notification, designate any statutory authority or body to exercise the powers and perform the functions of the Central Authority referred to in section 10.
",
    s23.source = d.source,
    s23.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s23)

// Section 24
MERGE (s24:Section {section_key:"CPA_2019::S_24"})
SET s24.doc_id = "CPA_2019",
    s24.section_no = "24",
    s24.title = "Appeal",
    s24.text = "
24. Appeal.—A person aggrieved by any order passed by the Central Authority under sections 20 and 21 may file an appeal to the National Commission within a period of thirty days from the date of receipt of such order.
",
    s24.source = d.source,
    s24.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s24)

// Section 25
MERGE (s25:Section {section_key:"CPA_2019::S_25"})
SET s25.doc_id = "CPA_2019",
    s25.section_no = "25",
    s25.title = "Grants by Central Government",
    s25.text = "
25. Grants by Central Government.—The Central Government may, after due appropriation made
by Parliament by law in this behalf, make to the Central Authority grants of such sums of money as that Government may think fit for being utilised for the purposes of this Act.
",
    s25.source = d.source,
    s25.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s25)

// Section 26
MERGE (s26:Section {section_key:"CPA_2019::S_26"})
SET s26.doc_id = "CPA_2019",
    s26.section_no = "26",
    s26.title = "Accounts and audit",
    s26.text = "
26. Accounts and audit.—(1) The Central Authority shall maintain proper accounts and other
relevant records and prepare an annual statement of accounts in such form and manner as may be
prescribed in consultation with the Comptroller and Auditor-General of India.
(2) The accounts of the Central Authority shall be audited by the Comptroller and Auditor-General of India at such intervals as may be specified by him and any expenditure incurred in connection with such audit shall be payable by the Central Authority to the Comptroller and Auditor-General of India.
(3) The Comptroller and Auditor-General of India or any other person appointed by him in
connection with the audit of the accounts of the Central Authority shall have the same rights, privileges and authority in connection with such audit as the Comptroller and Auditor-General of India generally has, in connection with the audit of the Government accounts and, in particular, shall have the right to demand the production of books, accounts, connected vouchers and other documents and papers and to inspect any of the offices of the Central Authority.
(4) The accounts of the Central Authority as certified by the Comptroller and Auditor-General of
India or any other person appointed by him in this behalf together with the audit report thereon shall be forwarded annually to the Central Government which shall cause the same to be laid before each House of Parliament.
",
    s26.source = d.source,
    s26.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s26)

// Section 27
MERGE (s27:Section {section_key:"CPA_2019::S_27"})
SET s27.doc_id = "CPA_2019",
    s27.section_no = "27",
    s27.title = "Furnishing of annual reports, etc.",
    s27.text = "
27. Furnishing of annual reports, etc.—(1) The Central Authority shall prepare once in every year, in such form, manner and at such time as may be prescribed, an annual report giving full account of its activities during the previous year and such other reports and returns, as may be directed, and copies of such report and returns shall be forwarded to the Central Government.
(2) A copy of the annual report received under sub-section (1) shall be laid, as soon as may be after it is received, before each House of Parliament.
",
    s27.source = d.source,
    s27.updated_at = datetime()
MERGE (c)-[:HAS_SECTION]->(s27);
