// =====================================================
// Patch Fact UI/Validation Metadata (Phase-1)
// NO backend hardcoding. UI driven from Neo4j.
// =====================================================

// ------------------------------
// Amount / Numbers
// ------------------------------
MATCH (f:Fact {fact_id:"F_AMOUNT_PAID"})
SET f.value_type="number",
    f.ui_control="number",
    f.question="How much did you pay? (₹)",
    f.placeholder="Example: 15999",
    f.help_text="Enter the amount paid for the product/service (numbers only).",
    f.min_value=0,
    f.max_value=100000000;

MATCH (f:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
SET f.value_type="number",
    f.ui_control="number",
    f.question="How many days ago did you purchase the product?",
    f.placeholder="Example: 5",
    f.help_text="Enter number of days since purchase.",
    f.min_value=0,
    f.max_value=3650;

MATCH (f:Fact {fact_id:"F_DAYS_DELAYED"})
SET f.value_type="number",
    f.ui_control="number",
    f.question="How many days was the delivery delayed?",
    f.placeholder="Example: 10",
    f.help_text="If you received the product late, enter the delay in days.",
    f.min_value=0,
    f.max_value=3650;

MATCH (f:Fact {fact_id:"F_SELLER_RESPONSE_DAYS"})
SET f.value_type="number",
    f.ui_control="number",
    f.question="How many days did the seller/platform take to respond?",
    f.placeholder="Example: 3",
    f.help_text="Enter time taken to respond after you contacted them.",
    f.min_value=0,
    f.max_value=3650;


// ------------------------------
// Boolean flags (checkbox)
// ------------------------------
MATCH (f:Fact {fact_id:"F_DEFECT_PRESENT"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Was the product defective?",
    f.help_text="Tick if the item has a defect / damage / malfunction.";

MATCH (f:Fact {fact_id:"F_WRONG_ITEM_DELIVERED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Did you receive the wrong product?",
    f.help_text="Tick if the delivered product is different from what you ordered.";

MATCH (f:Fact {fact_id:"F_NON_DELIVERY"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Was the product NOT delivered?",
    f.help_text="Tick if the order was never delivered.";

MATCH (f:Fact {fact_id:"F_DELIVERY_DELAYED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Was delivery delayed?",
    f.help_text="Tick if delivery happened but later than promised.";

MATCH (f:Fact {fact_id:"F_REFUND_REQUESTED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Did you request a refund?",
    f.help_text="Tick if you requested refund through platform/seller.";

MATCH (f:Fact {fact_id:"F_REFUND_DENIED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Was your refund request denied?",
    f.help_text="Tick if seller/platform refused refund.";

MATCH (f:Fact {fact_id:"F_REPLACEMENT_REQUESTED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Did you request replacement?",
    f.help_text="Tick if you requested replacement.";

MATCH (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Was your replacement request denied?",
    f.help_text="Tick if seller/platform refused replacement.";

MATCH (f:Fact {fact_id:"F_SELLER_CONTACTED"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Did you contact the seller/platform in writing?",
    f.help_text="Tick if you contacted via email/app chat/support ticket.";

MATCH (f:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Did seller/platform deny your request (refund/replacement/repair)?",
    f.help_text="Tick if they rejected your remedy request.";

MATCH (f:Fact {fact_id:"F_INVOICE_AVAILABLE"})
SET f.value_type="boolean", f.ui_control="checkbox",
    f.question="Do you have invoice / receipt / order proof?",
    f.help_text="Tick if invoice/receipt/order confirmation is available.";


// ------------------------------
// Text proofs / IDs (with validation)
// ------------------------------
MATCH (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="Enter invoice number / receipt number / order proof reference",
    f.placeholder="Example: INV-839201 or ORDER12345",
    f.help_text="Enter your invoice/order ID. Use letters/numbers only.",
    f.validation_regex="^[A-Za-z0-9\\-\\/]{4,60}$";

MATCH (f:Fact {fact_id:"F_COMMUNICATION_PROOF"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="Enter complaint ticket / email subject / chat reference (if any)",
    f.placeholder="Example: Ticket# 192833 or Email dated 10 Jan 2026",
    f.help_text="Any written proof that you contacted seller/platform.",
    f.validation_regex="^.{0,200}$";

MATCH (f:Fact {fact_id:"F_PHOTO_VIDEO_PROOF"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="Do you have photo/video proof? (mention details)",
    f.placeholder="Example: Unboxing video available, photos of defect uploaded",
    f.help_text="Mention what proof you have (unboxing/defect photos).",
    f.validation_regex="^.{0,200}$";

MATCH (f:Fact {fact_id:"F_DEFECT_TYPE"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="What defect did you observe?",
    f.placeholder="Example: screen cracked / not charging / dead on arrival",
    f.help_text="Describe the defect briefly.",
    f.validation_regex="^.{0,120}$";

MATCH (f:Fact {fact_id:"F_PRODUCT_TYPE"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="What product did you purchase?",
    f.placeholder="Example: Smartphone",
    f.help_text="Enter product category or name.",
    f.validation_regex="^.{0,80}$";

MATCH (f:Fact {fact_id:"F_DOMAIN"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="Where did you purchase from? (platform/website/app)",
    f.placeholder="Example: Amazon / Flipkart / Myntra / Website name",
    f.help_text="Enter the platform name (important for e-commerce duties).",
    f.validation_regex="^.{0,80}$";

MATCH (f:Fact {fact_id:"F_PAYMENT_MODE"})
SET f.value_type="string",
    f.ui_control="select",
    f.question="How did you pay?",
    f.allowed_values=["UPI","Credit Card","Debit Card","NetBanking","Wallet","Cash on Delivery","EMI","Other"],
    f.placeholder="Select payment mode",
    f.help_text="Payment mode helps prove transaction.";


// ------------------------------
// Dates (keep string now; later can upgrade to date UI)
// ------------------------------
MATCH (f:Fact {fact_id:"F_PURCHASE_DATE"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="Purchase date (optional)",
    f.placeholder="Example: 2026-01-10",
    f.help_text="Enter purchase date if known (YYYY-MM-DD).",
    f.validation_regex="^$|^\\d{4}-\\d{2}-\\d{2}$";

MATCH (f:Fact {fact_id:"F_COMPLAINT_DATE"})
SET f.value_type="string",
    f.ui_control="text",
    f.question="When did you raise complaint with seller/platform? (optional)",
    f.placeholder="Example: 2026-01-12",
    f.help_text="Enter complaint date if known (YYYY-MM-DD).",
    f.validation_regex="^$|^\\d{4}-\\d{2}-\\d{2}$";


// ------------------------------
// Legal categories / indicators
// ------------------------------
MATCH (f:Fact {fact_id:"F_COMPLAINT_TYPE"})
SET f.value_type="string",
    f.ui_control="select",
    f.allowed_values=["Defective Product","Non Delivery","Delayed Delivery","Wrong Item Delivered","Refund Denied","Replacement Denied","Service Deficiency","Misleading Advertisement","Overcharging","Warranty Denied","Other"],
    f.question="Select complaint category",
    f.placeholder="Select category",
    f.help_text="Used to map the complaint into CPA / E-Commerce rule paths.";

MATCH (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Unfair trade practice suspected?",
    f.help_text="Tick if you believe seller/platform used unfair/misleading methods.";

MATCH (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Misleading advertisement involved?",
    f.help_text="Tick if product/service was misrepresented in listing/ads.";


// ------------------------------
// Warranty / service
// ------------------------------
MATCH (f:Fact {fact_id:"F_WARRANTY_EXISTS"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Was warranty promised/available?",
    f.help_text="Tick if warranty was promised in listing/invoice.";

MATCH (f:Fact {fact_id:"F_WARRANTY_DENIED"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Was warranty claim denied?",
    f.help_text="Tick if seller/service center denied warranty service.";

MATCH (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Deficiency in service involved?",
    f.help_text="Tick if service was poorly performed/not provided.";

MATCH (f:Fact {fact_id:"F_SERVICE_NOT_PROVIDED"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Was the service not provided at all?",
    f.help_text="Tick if service was never delivered after payment.";


// ------------------------------
// Overcharging
// ------------------------------
MATCH (f:Fact {fact_id:"F_OVERCHARGING"})
SET f.value_type="boolean",
    f.ui_control="checkbox",
    f.question="Were you charged extra / overcharged?",
    f.help_text="Tick if price charged was above displayed/agreed amount.";
