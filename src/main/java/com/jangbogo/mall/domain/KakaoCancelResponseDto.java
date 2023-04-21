package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

@Repository
public class KakaoCancelResponseDto {
    // iv
    private String aid;                                                                                                 // 요청 고유 번호
    private String tid;                                                                                                 // 결제 고유 번호
    private String cid;                                                                                                 // 가맹점 코드
    private String status;                                                                                              // 결제 상태
    private String partner_order_id;                                                                                    // 가맹점 주문 번호
    private String partner_user_id;                                                                                     // 가맹점 회원 id
    private String payment_method_type;                                                                                 // 결제 수단
    private Amount amount;                                                                                              // 결제 금액 정보
    private ApprovedCancelAmount approved_cancel_amount;                                                                // 결제 금액 정보
    private CanceledAmount canceled_amount;                                                                             // 결제 금액 정보
    private CancelAvailableAmount cancel_available_amount;                                                              // 결제 금액 정보
    private String item_name;                                                                                           // 상품명
    private String item_code;                                                                                           // 상품 코드
    private Integer quantity;                                                                                           // 상품 수량
    private String created_at;                                                                                          // 결제 준비 요청 시각
    private String approved_at;                                                                                         // 결제 승인 시각
    private String canceled_at;                                                                                         // 결제 취소 시각
    private String payload;                                                                                             // 결제 승인 요청에 대해 저장 값, 요청 시 전달 내용

    // constructor
    public KakaoCancelResponseDto() {}                                                                                  // 기본 생성자

    // getter & setter
    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPartner_order_id() {
        return partner_order_id;
    }

    public void setPartner_order_id(String partner_order_id) {
        this.partner_order_id = partner_order_id;
    }

    public String getPartner_user_id() {
        return partner_user_id;
    }

    public void setPartner_user_id(String partner_user_id) {
        this.partner_user_id = partner_user_id;
    }

    public String getPayment_method_type() {
        return payment_method_type;
    }

    public void setPayment_method_type(String payment_method_type) {
        this.payment_method_type = payment_method_type;
    }

    public Amount getAmount() {
        return amount;
    }

    public void setAmount(Amount amount) {
        this.amount = amount;
    }

    public ApprovedCancelAmount getApproved_cancel_amount() {
        return approved_cancel_amount;
    }

    public void setApproved_cancel_amount(ApprovedCancelAmount approved_cancel_amount) {
        this.approved_cancel_amount = approved_cancel_amount;
    }

    public CanceledAmount getCanceled_amount() {
        return canceled_amount;
    }

    public void setCanceled_amount(CanceledAmount canceled_amount) {
        this.canceled_amount = canceled_amount;
    }

    public CancelAvailableAmount getCancel_available_amount() {
        return cancel_available_amount;
    }

    public void setCancel_available_amount(CancelAvailableAmount cancel_available_amount) {
        this.cancel_available_amount = cancel_available_amount;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getItem_code() {
        return item_code;
    }

    public void setItem_code(String item_code) {
        this.item_code = item_code;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getApproved_at() {
        return approved_at;
    }

    public void setApproved_at(String approved_at) {
        this.approved_at = approved_at;
    }

    public String getCanceled_at() {
        return canceled_at;
    }

    public void setCanceled_at(String canceled_at) {
        this.canceled_at = canceled_at;
    }

    public String getPayload() {
        return payload;
    }

    public void setPayload(String payload) {
        this.payload = payload;
    }

    // toString
    @Override
    public String toString() {
        return "{" +
                "aid='" + aid + '\'' +
                ", tid='" + tid + '\'' +
                ", cid='" + cid + '\'' +
                ", status='" + status + '\'' +
                ", partner_order_id='" + partner_order_id + '\'' +
                ", partner_user_id='" + partner_user_id + '\'' +
                ", payment_method_type='" + payment_method_type + '\'' +
                ", amount=" + amount +
                ", approved_cancel_amount=" + approved_cancel_amount +
                ", canceled_amount=" + canceled_amount +
                ", cancel_available_amount=" + cancel_available_amount +
                ", item_name='" + item_name + '\'' +
                ", item_code='" + item_code + '\'' +
                ", quantity=" + quantity +
                ", created_at='" + created_at + '\'' +
                ", approved_at='" + approved_at + '\'' +
                ", canceled_at='" + canceled_at + '\'' +
                ", payload='" + payload + '\'' +
                '}';
    }
}
