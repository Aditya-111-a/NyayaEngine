MATCH (d:LegalDocument {doc_id:"CPA_2019"})
MATCH (c:Chapter {chapter_key:"CPA_2019::CH6"})
WITH d, c

// ----------------------------------------
// CHAPTER VI — PRODUCT LIABILITY
// Sections: 82 to 87
// ----------------------------------------

MERGE (s82:Section {section_key:"CPA_2019::S_82"})
SET s82.doc_id="CPA_2019", s82.section_no="82",
    s82.title="Application of Chapter",
    s82.text="
82. Application of Chapter.—This Chapter shall apply to every claim for compensation under a
product liability action by a complainant for any harm caused by a defective product manufactured by a
product manufacturer or serviced by a product service provider or sold by a product seller.
",
    s82.source=d.source, s82.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s82)

MERGE (s83:Section {section_key:"CPA_2019::S_83"})
SET s83.doc_id="CPA_2019", s83.section_no="83",
    s83.title="Product liability action",
    s83.text="
83. Product liability action.—A product liability action may be brought by a complainant against a
product manufacturer or a product service provider or a product seller, as the case may be, for any harm
caused to him on account of a defective product.
",
    s83.source=d.source, s83.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s83)

MERGE (s84:Section {section_key:"CPA_2019::S_84"})
SET s84.doc_id="CPA_2019", s84.section_no="84",
    s84.title="Liability of product manufacturer",
    s84.text="
84. Liability of product manufacturer.—(1) A product manufacturer shall be liable in a product
liability action, if—
(a) the product contains a manufacturing defect; or
(b) the product is defective in design; or
(c) there is a deviation from manufacturing specifications; or
(d) the product does not conform to the express warranty; or
(e) the product fails to contain adequate instructions of correct usage to prevent any harm or any
warning regarding improper or incorrect usage.
(2) A product manufacturer shall be liable in a product liability action even if he proves that he was
not negligent or fraudulent in making the express warranty of a product.
",
    s84.source=d.source, s84.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s84)

MERGE (s85:Section {section_key:"CPA_2019::S_85"})
SET s85.doc_id="CPA_2019", s85.section_no="85",
    s85.title="Liability of product service provider",
    s85.text="
85. Liability of product service provider.—A product service provider shall be liable in a product
liability action, if—
(a) the service provided by him was faulty or imperfect or deficient or inadequate in quality, nature or
manner of performance which is required to be provided by or under any law for the time being in force,
or pursuant to any contract or otherwise; or
(b) there was an act of omission or commission or negligence or conscious withholding any
information which caused harm; or
(c) the service provider did not issue adequate instructions or warnings to prevent any harm; or
(d) the service did not conform to express warranty or the terms and conditions of the contract.
",
    s85.source=d.source, s85.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s85)

MERGE (s86:Section {section_key:"CPA_2019::S_86"})
SET s86.doc_id="CPA_2019", s86.section_no="86",
    s86.title="Liability of product sellers",
    s86.text="
86. Liability of product sellers.—A product seller who is not a product manufacturer shall be liable
in a product liability action, if—
(a) he has exercised substantial control over the designing, testing, manufacturing, packaging or
labelling of a product that caused harm; or
(b) he has altered or modified the product and such alteration or modification was the substantial
factor in causing the harm; or
(c) he has made an express warranty of a product independent of any express warranty made by a
manufacturer and such product failed to conform to the express warranty made by the product seller
which caused the harm; or
(d) the product has been sold by him and the identity of product manufacturer of such product is
not known, or if known, the service of notice or process or warrant cannot be effected on him or he is
not subject to the law which is in force in India or the order, if any, passed or to be passed cannot be
enforced against him; or
(e) he failed to exercise reasonable care in assembling, inspecting or maintaining such product or
he did not pass on the warnings or instructions of the product manufacturer regarding the dangers
involved or proper usage of the product while selling such product and such failure was the proximate
cause of the harm.
",
    s86.source=d.source, s86.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s86)

MERGE (s87:Section {section_key:"CPA_2019::S_87"})
SET s87.doc_id="CPA_2019", s87.section_no="87",
    s87.title="Exceptions to product liability action",
    s87.text="
87. Exceptions to product liability action.—(1) A product liability action cannot be brought against
the product seller if, at the time of harm, the product was misused, altered, or modified.
(2) In any product liability action based on the failure to provide adequate warnings or instructions,
the product manufacturer shall not be liable, if—
(a) the product was purchased by an employer for use at the workplace and the product
manufacturer had provided warnings or instructions to such employer;
(b) the product was sold as a component or material to be used in another product and necessary
warnings or instructions were given by the product manufacturer to the purchaser of such component
or material, but the harm was caused to the complainant by use of the end product in which such
component or material was used;
(c) the product was one which was legally meant to be used or dispensed only by or under the
supervision of an expert or a class of experts and the product manufacturer had employed reasonable
means to give the warnings or instructions for usage of such product to such expert or class of
experts; or
(d) the complainant, while using such product, was under the influence of alcohol or any
prescription drug which had not been prescribed by a medical practitioner.
(3) A product manufacturer shall not be liable for failure to instruct or warn about a danger which is
obvious or commonly known to the user or consumer of such product or which, such user or consumer,
ought to have known, taking into account the characteristics of such product.

",
    s87.source=d.source, s87.updated_at=datetime()
MERGE (c)-[:HAS_SECTION]->(s87);
