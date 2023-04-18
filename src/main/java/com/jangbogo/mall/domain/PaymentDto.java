package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

@Repository
public class PaymentDto {
    // iv 선언
    Integer idx;                                                                    // 결제번호  IDX
    String setl_idx;                                                                // 결제고유번호 SETL_IDX
    Integer ord_idx;                                                                // 주문번호 ORD_IDX

    // Constructor
    public PaymentDto() {}                                                          // 기본 생성자
    public PaymentDto(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    // Getter & Setter
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public String getSetl_idx() {
        return setl_idx;
    }

    public void setSetl_idx(String setl_idx) {
        this.setl_idx = setl_idx;
    }

    public Integer getOrd_idx() {
        return ord_idx;
    }

    public void setOrd_idx(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    // toString()
    @Override
    public String toString() {
        return "{" +
                "idx=" + idx +
                ", setl_idx='" + setl_idx + '\'' +
                ", ord_idx=" + ord_idx +
                '}';
    }
}
