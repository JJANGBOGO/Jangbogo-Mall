package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

@Repository
public class KakaoReadyRequestDto {
    // iv
    private String item_name;                                                                                           // 주문상품명 "그레놀라 외 1개
    private Integer quantity;                                                                                           // 주문상품수량
    private Integer total_amount;                                                                                       // 주문총금액
    private OrderDto orderDto;                                                                                          // 주문 객체

    // constructor
    public KakaoReadyRequestDto() {};                                                                                   // 기본 생성자

    // getter & setter
    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(Integer total_amount) {
        this.total_amount = total_amount;
    }

    public OrderDto getOrderDto() {
        return orderDto;
    }

    public void setOrderDto(OrderDto orderDto) {
        this.orderDto = orderDto;
    }

    // toString

    @Override
    public String toString() {
        return "KakaoReadyRequestDto{" +
                "item_name='" + item_name + '\'' +
                ", quantity=" + quantity +
                ", total_amount=" + total_amount +
                ", orderDto=" + orderDto +
                '}';
    }
}
