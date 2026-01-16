// =============================
// CPA Fact Dictionary (Stage 2.1)
// =============================

// Optional cleanup (ONLY IF you want reset facts)
// MATCH (f:Fact) DETACH DELETE f;

// ========== BASIC CASE / DOMAIN ==========
MERGE (f:Fact {fact_id:"F_DOMAIN"})
SET f.name="domain",
    f.datatype="STRING",
    f.description="Domain of complaint: GOODS or SERVICES",
    f.category="BASIC";

MERGE (f:Fact {fact_id:"F_COMPLAINT_TYPE"})
SET f.name="complaint_type",
    f.datatype="STRING",
    f.description="Complaint type: DEFECTIVE_GOODS / DEFICIENCY_SERVICE / DELIVERY_ISSUE / REFUND_ISSUE / MISLEADING_AD / OVERCHARGING",
    f.category="BASIC";

// ========== TRANSACTION DETAILS ==========
MERGE (f:Fact {fact_id:"F_AMOUNT_PAID"})
SET f.name="amount_paid",
    f.datatype="NUMBER",
    f.description="Amount paid by consumer",
    f.category="TRANSACTION";

MERGE (f:Fact {fact_id:"F_PAYMENT_MODE"})
SET f.name="payment_mode",
    f.datatype="STRING",
    f.description="Payment mode: CASH / UPI / CARD / NETBANKING / EMI",
    f.category="TRANSACTION";

MERGE (f:Fact {fact_id:"F_INVOICE_AVAILABLE"})
SET f.name="invoice_available",
    f.datatype="BOOL",
    f.description="Invoice/bill proof available",
    f.category="TRANSACTION";

MERGE (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})
SET f.name="proof_of_purchase",
    f.datatype="BOOL",
    f.description="Any proof of purchase exists (invoice/receipt/order ID)",
    f.category="EVIDENCE";

// ========== TIMELINE ==========
MERGE (f:Fact {fact_id:"F_PURCHASE_DATE"})
SET f.name="purchase_date",
    f.datatype="STRING",
    f.description="Purchase date ISO string (YYYY-MM-DD)",
    f.category="TIMELINE";

MERGE (f:Fact {fact_id:"F_DAYS_SINCE_PURCHASE"})
SET f.name="days_since_purchase",
    f.datatype="NUMBER",
    f.description="Days since purchase",
    f.category="TIMELINE";

MERGE (f:Fact {fact_id:"F_COMPLAINT_DATE"})
SET f.name="complaint_date",
    f.datatype="STRING",
    f.description="Complaint date ISO string (YYYY-MM-DD)",
    f.category="TIMELINE";

// ========== PRODUCT / GOODS FACTS ==========
MERGE (f:Fact {fact_id:"F_PRODUCT_TYPE"})
SET f.name="product_type",
    f.datatype="STRING",
    f.description="Type of product involved",
    f.category="GOODS";

MERGE (f:Fact {fact_id:"F_DEFECT_PRESENT"})
SET f.name="defect_present",
    f.datatype="BOOL",
    f.description="Whether defect is present in goods",
    f.category="GOODS";

MERGE (f:Fact {fact_id:"F_DEFECT_TYPE"})
SET f.name="defect_type",
    f.datatype="STRING",
    f.description="Type of defect: MANUFACTURING / PERFORMANCE / SAFETY / OTHER",
    f.category="GOODS";

MERGE (f:Fact {fact_id:"F_WARRANTY_EXISTS"})
SET f.name="warranty_exists",
    f.datatype="BOOL",
    f.description="Warranty exists for the product",
    f.category="GOODS";

MERGE (f:Fact {fact_id:"F_WARRANTY_DENIED"})
SET f.name="warranty_denied",
    f.datatype="BOOL",
    f.description="Warranty claim denied",
    f.category="GOODS";

// ========== SERVICE FACTS ==========
MERGE (f:Fact {fact_id:"F_SERVICE_TYPE"})
SET f.name="service_type",
    f.datatype="STRING",
    f.description="Service type (banking/telecom/travel/hotel/repair etc.)",
    f.category="SERVICES";

MERGE (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})
SET f.name="deficiency_in_service",
    f.datatype="BOOL",
    f.description="Whether deficiency in service is present",
    f.category="SERVICES";

MERGE (f:Fact {fact_id:"F_SERVICE_NOT_PROVIDED"})
SET f.name="service_not_provided",
    f.datatype="BOOL",
    f.description="Paid service not provided at all",
    f.category="SERVICES";

// ========== DELIVERY / ORDER ==========
MERGE (f:Fact {fact_id:"F_ORDER_ID_AVAILABLE"})
SET f.name="order_id_available",
    f.datatype="BOOL",
    f.description="Order ID available",
    f.category="DELIVERY";

MERGE (f:Fact {fact_id:"F_DELIVERY_DELAYED"})
SET f.name="delivery_delayed",
    f.datatype="BOOL",
    f.description="Delivery delayed beyond promised date",
    f.category="DELIVERY";

MERGE (f:Fact {fact_id:"F_DAYS_DELAYED"})
SET f.name="days_delayed",
    f.datatype="NUMBER",
    f.description="Number of days delayed",
    f.category="DELIVERY";

MERGE (f:Fact {fact_id:"F_NON_DELIVERY"})
SET f.name="non_delivery",
    f.datatype="BOOL",
    f.description="Product not delivered at all",
    f.category="DELIVERY";

MERGE (f:Fact {fact_id:"F_WRONG_ITEM_DELIVERED"})
SET f.name="wrong_item_delivered",
    f.datatype="BOOL",
    f.description="Wrong item delivered / mismatch",
    f.category="DELIVERY";

// ========== SELLER / MERCHANT ACTIONS ==========
MERGE (f:Fact {fact_id:"F_SELLER_CONTACTED"})
SET f.name="seller_contacted",
    f.datatype="BOOL",
    f.description="Consumer contacted seller/provider",
    f.category="MERCHANT";

MERGE (f:Fact {fact_id:"F_SELLER_RESPONSE_DAYS"})
SET f.name="seller_response_days",
    f.datatype="NUMBER",
    f.description="Days taken by seller to respond",
    f.category="MERCHANT";

MERGE (f:Fact {fact_id:"F_SELLER_DENIED_REMEDY"})
SET f.name="seller_denied_remedy",
    f.datatype="BOOL",
    f.description="Seller denied remedy (refund/replace/repair)",
    f.category="MERCHANT";

// ========== REFUND / REPLACEMENT ==========
MERGE (f:Fact {fact_id:"F_REFUND_REQUESTED"})
SET f.name="refund_requested",
    f.datatype="BOOL",
    f.description="Refund requested by consumer",
    f.category="REFUND";

MERGE (f:Fact {fact_id:"F_REFUND_DENIED"})
SET f.name="refund_denied",
    f.datatype="BOOL",
    f.description="Refund denied by seller/provider",
    f.category="REFUND";

MERGE (f:Fact {fact_id:"F_REPLACEMENT_REQUESTED"})
SET f.name="replacement_requested",
    f.datatype="BOOL",
    f.description="Replacement requested by consumer",
    f.category="REFUND";

MERGE (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})
SET f.name="replacement_denied",
    f.datatype="BOOL",
    f.description="Replacement denied by seller/provider",
    f.category="REFUND";

// ========== LEGAL / VIOLATION CLASSIFICATION ==========
MERGE (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})
SET f.name="unfair_trade_practice",
    f.datatype="BOOL",
    f.description="Indicates unfair trade practice (misleading claims / false representation etc.)",
    f.category="LEGAL";

MERGE (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})
SET f.name="misleading_advertisement",
    f.datatype="BOOL",
    f.description="Misleading advertisement involved",
    f.category="LEGAL";

MERGE (f:Fact {fact_id:"F_OVERCHARGING"})
SET f.name="overcharging",
    f.datatype="BOOL",
    f.description="Consumer charged higher than MRP/advertised price",
    f.category="LEGAL";

// ========== EVIDENCE ==========
MERGE (f:Fact {fact_id:"F_COMMUNICATION_PROOF"})
SET f.name="communication_proof",
    f.datatype="BOOL",
    f.description="Proof of communication (email/chat/call logs) available",
    f.category="EVIDENCE";

MERGE (f:Fact {fact_id:"F_PHOTO_VIDEO_PROOF"})
SET f.name="photo_video_proof",
    f.datatype="BOOL",
    f.description="Photo/video proof available",
    f.category="EVIDENCE";

