package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

@Repository
public class CanceledAmount {
    // iv
    private Integer total;                                                                                              // 취소된 전체 누적 금액
    private Integer tax_free;                                                                                           // 취소된 비과세 누적 금액
    private Integer vat;                                                                                                // 취소된 부가세 누적 금액
    private Integer point;                                                                                              // 취소된 포인트 누적 금액
    private Integer discount;                                                                                           // 취소된 할인 누적 금액
    private Integer green_deposit;                                                                                      // 컵 보증금

    // constructor
    public CanceledAmount() {}                                                                                          // 기본 생성자

    // getter & setter
    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getTax_free() {
        return tax_free;
    }

    public void setTax_free(Integer tax_free) {
        this.tax_free = tax_free;
    }

    public Integer getVat() {
        return vat;
    }

    public void setVat(Integer vat) {
        this.vat = vat;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getGreen_deposit() {
        return green_deposit;
    }

    public void setGreen_deposit(Integer green_deposit) {
        this.green_deposit = green_deposit;
    }

    // toString

    @Override
    public String toString() {
        return "{" +
                "total=" + total +
                ", tax_free=" + tax_free +
                ", vat=" + vat +
                ", point=" + point +
                ", discount=" + discount +
                ", green_deposit=" + green_deposit +
                '}';
    }
}
