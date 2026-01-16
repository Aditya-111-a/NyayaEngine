// =======================================
// Remedies & Actions (Stage 2.3)
// =======================================

// ===== Remedies =====
MERGE (re:Remedy {remedy_id:"R_REPAIR"})
SET re.name="Repair",
    re.description="Repair the goods/service issue at no extra charge";

MERGE (re:Remedy {remedy_id:"R_REPLACE"})
SET re.name="Replacement",
    re.description="Replace with defect-free product";

MERGE (re:Remedy {remedy_id:"R_REFUND"})
SET re.name="Refund",
    re.description="Refund the amount paid";

MERGE (re:Remedy {remedy_id:"R_COMPENSATION"})
SET re.name="Compensation",
    re.description="Compensation for loss/injury/harassment";

MERGE (re:Remedy {remedy_id:"R_STOP_UNFAIR_PRACTICE"})
SET re.name="Stop Unfair Trade Practice",
    re.description="Stop misleading claims/unfair practices and provide corrective actions";

MERGE (re:Remedy {remedy_id:"R_PENALTY_MISLEADING_AD"})
SET re.name="Penalty for Misleading Advertisement",
    re.description="Seek CCPA direction/penalty for misleading ads";

MERGE (re:Remedy {remedy_id:"R_DELIVERY_OR_REFUND"})
SET re.name="Delivery or Refund",
    re.description="Deliver product immediately or refund the amount";


// ===== Actions =====
MERGE (a:Action {action_id:"A_COLLECT_EVIDENCE"})
SET a.name="Collect evidence",
    a.description="Invoice/order ID, chat/email screenshots, photos/videos, warranty card etc.";

MERGE (a:Action {action_id:"A_SEND_WRITTEN_REQUEST"})
SET a.name="Send written request",
    a.description="Send written complaint to seller/service provider (email/letter) and keep proof.";

MERGE (a:Action {action_id:"A_ESCALATE_TO_PLATFORM"})
SET a.name="Escalate to platform",
    a.description="If e-commerce purchase, escalate via platform support and keep ticket IDs.";

MERGE (a:Action {action_id:"A_SEND_LEGAL_NOTICE"})
SET a.name="Send legal notice",
    a.description="Send legal notice demanding remedy within a timeline.";

MERGE (a:Action {action_id:"A_FILE_E_DAAKHIL"})
SET a.name="File complaint on e-Daakhil",
    a.description="File consumer complaint through e-Daakhil portal with supporting documents.";

MERGE (a:Action {action_id:"A_FILE_CONSUMER_COMMISSION"})
SET a.name="File complaint before Consumer Commission",
    a.description="Approach District/State/National Consumer Commission depending on pecuniary jurisdiction.";

MERGE (a:Action {action_id:"A_REPORT_TO_CCPA"})
SET a.name="Report to CCPA",
    a.description="File complaint to Central Consumer Protection Authority for unfair trade/misleading ads.";


// ===== Link Remedies -> Actions =====
MATCH (r1:Remedy {remedy_id:"R_REPAIR"}), (a1:Action {action_id:"A_SEND_WRITTEN_REQUEST"}) MERGE (r1)-[:NEXT_ACTION]->(a1);
MATCH (r2:Remedy {remedy_id:"R_REPLACE"}), (a1:Action {action_id:"A_SEND_WRITTEN_REQUEST"}) MERGE (r2)-[:NEXT_ACTION]->(a1);
MATCH (r3:Remedy {remedy_id:"R_REFUND"}), (a1:Action {action_id:"A_SEND_WRITTEN_REQUEST"}) MERGE (r3)-[:NEXT_ACTION]->(a1);

MATCH (r3:Remedy {remedy_id:"R_REFUND"}), (a2:Action {action_id:"A_FILE_E_DAAKHIL"}) MERGE (r3)-[:NEXT_ACTION]->(a2);
MATCH (r4:Remedy {remedy_id:"R_COMPENSATION"}), (a2:Action {action_id:"A_FILE_E_DAAKHIL"}) MERGE (r4)-[:NEXT_ACTION]->(a2);

MATCH (r5:Remedy {remedy_id:"R_STOP_UNFAIR_PRACTICE"}), (a6:Action {action_id:"A_REPORT_TO_CCPA"}) MERGE (r5)-[:NEXT_ACTION]->(a6);
MATCH (r6:Remedy {remedy_id:"R_PENALTY_MISLEADING_AD"}), (a6:Action {action_id:"A_REPORT_TO_CCPA"}) MERGE (r6)-[:NEXT_ACTION]->(a6);

MATCH (r7:Remedy {remedy_id:"R_DELIVERY_OR_REFUND"}), (a3:Action {action_id:"A_ESCALATE_TO_PLATFORM"}) MERGE (r7)-[:NEXT_ACTION]->(a3);
MATCH (r7:Remedy {remedy_id:"R_DELIVERY_OR_REFUND"}), (a5:Action {action_id:"A_FILE_CONSUMER_COMMISSION"}) MERGE (r7)-[:NEXT_ACTION]->(a5);

