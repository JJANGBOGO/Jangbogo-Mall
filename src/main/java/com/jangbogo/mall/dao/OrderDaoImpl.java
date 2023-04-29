package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired SqlSession session;                                                                                      // SqlSession 자동 주입

    private static String namespace="com.jangbogo.mall.dao.OrderMapper."; // 대소문자 구분X

    // 메서드명 : insertPayment
    // 기   능 : '결제'(SETL) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto
    @Override
    public int insertPayment(PaymentDto paymentDto) { return session.insert(namespace + "insertPayment", paymentDto);}

    // 메서드명 : getPayment
    // 기   능 : '결제'(SETL) 테이블에 저장된 특정 데이터를 조회(select)하는 메서드
    // 반환타입 : PaymentDto
    // 매개변수 : String tid
    @Override
    public PaymentDto getPayment(String tid) {
        return session.selectOne(namespace + "selectPayment", tid);
    }

    // 메서드명 : insertOrder
    // 기   능 : '주문'(ORD) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    @Override
    public int insertOrder(OrderDto orderDto) {
        return session.insert(namespace + "insertOrder", orderDto);
    }

    // 메서드명 : getOrder
    // 기   능 : 주문번호가 #{idx}인 주문을 조회하는 메서드
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    @Override
    public OrderDto getOrder(Integer idx) {
        return session.selectOne(namespace + "selectOrder", idx);
    }

    // 메서드명 : updateCanceledSetl
    // 기   능 : 결제고유번호가 #{tid}인 결제 데이터를 '승인' 에서 '취소' 상태로 변경하는 메서드
    // 반환타입 : int
    // 매개변수 : String tid
    @Override
    public int updateCanceledSetl(String tid) {
        return session.update(namespace + "updateCanceledSetl", tid);
    }

    // 메서드명 : addOrderDetail
    // 기   능 : '주문상세'(ORD_DTL) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    @Override
    public int insertOrderDetail(OrderDto orderDto, CartDto cartDto) {
        Map map = new HashMap();                                                                                        // 변수명 : map - 저장값 : 메서드의 두 매개변수 저장소
        map.put("orderDto", orderDto);                                                                                  // 매개변수 orderDto를 K/V로 저장
        map.put("cartDto", cartDto);                                                                                    // 매개변수 cartDto를 K/V로 저장
        return session.insert(namespace + "insertOrderDetail", map);                                                 // session.insert메서드 반환값 리턴g
    }

    // 메서드명 : getOrderDetailDto
    // 기   능 : 주문번호가 #{idx}인 주문의 '주문상세' 데이터를 조회하는 메서드
    // 반환타입 : OrderDetailDto orderDetailDto
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    @Override
    public List<OrderDetailDto> getOrderDetailDto(OrderDto orderDto) {
        return session.selectList(namespace + "selectOrderDetail", orderDto);
    }

    // 메서드명 : insertOrderHistory
    // 기   능 : '주문이력'(ORD_HIST) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : List<OrderDetailDto> orderDetails
    @Override
    public int insertOrderHistory(List<OrderDetailDto> orderDetails) {
        return session.insert(namespace + "insertOrderHistory", orderDetails);
    }

    // 메서드명 : getOrderHistoryDto
    // 기   능 : '주문이력' 데이터를 조회하는 메서드
    // 반환타입 : List<OrderHistoryDto>
    // 매개변수 : List<OrderDetailDto> orderDetails
    @Override
    public List<OrderHistoryDto> getOrderHistoryDto(List<OrderDetailDto> orderDetails) {
        return session.selectList(namespace + "selectOrderHistory", orderDetails);
    }

    // 메서드명 : insertDelivery
    // 기   능 : '배송'(DLVRY) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : DeliveryDto deliveryDto
    @Override
    public int insertDelivery(DeliveryDto deliveryDto) {
        return session.insert(namespace + "insertDelivery", deliveryDto);
    }
}

