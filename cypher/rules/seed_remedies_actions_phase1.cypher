// =====================================================
// Seed common Remedies + Actions for Phase-1 Rules
// =====================================================

// --------------------
// Remedies
// --------------------
MERGE (r1:Remedy {remedy_id:"REM_REFUND"})
SET
  r1.name="Refund",
  r1.description="Return the paid amount to the consumer.";

MERGE (r2:Remedy {remedy_id:"REM_REPLACEMENT"})
SET
  r2.name="Replacement",
  r2.description="Replace the defective/wrong product with a new product.";

MERGE (r3:Remedy {remedy_id:"REM_REPAIR"})
SET
  r3.name="Repair",
  r3.description="Repair the product within a reasonable time at no extra cost.";

MERGE (r4:Remedy {remedy_id:"REM_COMPENSATION"})
SET
  r4.name="Compensation",
  r4.description="Pay compensation for loss, mental harassment, delay, or inconvenience.";

MERGE (r5:Remedy {remedy_id:"REM_ORDER_CANCELLATION"})
SET
  r5.name="Cancellation of Order",
  r5.description="Cancel the order and reverse/return payment.";

MERGE (r6:Remedy {remedy_id:"REM_STOP_UNFAIR_PRACTICE"})
SET
  r6.name="Stop Unfair Trade Practice",
  r6.description="Stop misleading/unfair practice and ensure corrective compliance.";


// --------------------
// Actions (IMPORTANT: use name + description)
// --------------------
MERGE (a1:Action {action_id:"ACT_COLLECT_INVOICE"})
SET
  a1.name="Collect invoice / proof of purchase",
  a1.description="Keep invoice/receipt/order confirmation and payment proof. This is required for escalation.";

MERGE (a2:Action {action_id:"ACT_COLLECT_PHOTO_VIDEO"})
SET
  a2.name="Collect photo/video proof",
  a2.description="Take photos/videos of the defect, wrong item, packaging, and unboxing evidence.";

MERGE (a3:Action {action_id:"ACT_CONTACT_SELLER"})
SET
  a3.name="Contact seller in writing",
  a3.description="Send complaint in writing through email/app chat and request replacement/refund with proof.";

MERGE (a4:Action {action_id:"ACT_CONTACT_PLATFORM"})
SET
  a4.name="Raise complaint with platform support",
  a4.description="Raise complaint/ticket on the platform helpdesk and keep complaint number/reference.";

MERGE (a5:Action {action_id:"ACT_ESCALATE_GRIEVANCE"})
SET
  a5.name="Escalate to grievance officer",
  a5.description="Escalate complaint to platform grievance officer as per E-Commerce Rules.";

MERGE (a6:Action {action_id:"ACT_LEGAL_NOTICE"})
SET
  a6.name="Send formal legal notice",
  a6.description="Send written notice demanding refund/replacement/compensation with timeline and proof.";

MERGE (a7:Action {action_id:"ACT_FILE_CONSUMER_COMMISSION"})
SET
  a7.name="File complaint before Consumer Commission",
  a7.description="File consumer complaint online/offline with proof. Choose district/state/national based on value.";

MERGE (a8:Action {action_id:"ACT_REQUEST_REFUND"})
SET
  a8.name="Request refund through platform procedure",
  a8.description="Request refund via platform return/refund process and attach invoice + proof.";

MERGE (a9:Action {action_id:"ACT_REQUEST_REPLACEMENT"})
SET
  a9.name="Request replacement through platform procedure",
  a9.description="Request replacement via platform return/replacement process and attach invoice + proof.";

MERGE (a10:Action {action_id:"ACT_REQUEST_CANCELLATION"})
SET
  a10.name="Request cancellation",
  a10.description="Request order cancellation from platform and ensure payment reversal.";
