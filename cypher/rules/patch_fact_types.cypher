// ============================================
// PATCH: Fix Fact value types for deterministic rules
// ============================================

//
// Convert boolean-like facts currently stored as string -> boolean
//
MATCH (f:Fact {fact_id:"F_DELIVERY_DELAYED"})        SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_NON_DELIVERY"})            SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_WRONG_ITEM_DELIVERED"})    SET f.value_type="boolean", f.ui_control="checkbox";

MATCH (f:Fact {fact_id:"F_REFUND_DENIED"})           SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_REFUND_REQUESTED"})        SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_REPLACEMENT_DENIED"})      SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_REPLACEMENT_REQUESTED"})   SET f.value_type="boolean", f.ui_control="checkbox";

MATCH (f:Fact {fact_id:"F_SELLER_CONTACTED"})        SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_SERVICE_NOT_PROVIDED"})    SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_WARRANTY_DENIED"})         SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_WARRANTY_EXISTS"})         SET f.value_type="boolean", f.ui_control="checkbox";

MATCH (f:Fact {fact_id:"F_OVERCHARGING"})            SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_MISLEADING_ADVERTISEMENT"})SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_UNFAIR_TRADE_PRACTICE"})    SET f.value_type="boolean", f.ui_control="checkbox";

MATCH (f:Fact {fact_id:"F_DEFICIENCY_IN_SERVICE"})   SET f.value_type="boolean", f.ui_control="checkbox";
MATCH (f:Fact {fact_id:"F_ORDER_ID_AVAILABLE"})      SET f.value_type="boolean", f.ui_control="checkbox";

//
// Convert numeric-like facts currently stored as string -> number
//
MATCH (f:Fact {fact_id:"F_DAYS_DELAYED"})            SET f.value_type="number", f.ui_control="number";
MATCH (f:Fact {fact_id:"F_SELLER_RESPONSE_DAYS"})    SET f.value_type="number", f.ui_control="number";

//
// Proof-related: keep as string but assign better UI hints
//
MATCH (f:Fact {fact_id:"F_PROOF_OF_PURCHASE"})       SET f.ui_control="text";
MATCH (f:Fact {fact_id:"F_COMMUNICATION_PROOF"})     SET f.ui_control="text";
MATCH (f:Fact {fact_id:"F_PHOTO_VIDEO_PROOF"})       SET f.ui_control="text";
