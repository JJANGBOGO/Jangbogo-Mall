package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.CartDto;

import java.util.List;

public interface CartDao {

    // 메서드명 : selectAll
    // 기   능 : 회원번호가 #{user_idx}에 해당하는 회원의 장바구니 목록을 조회하는 메서드
    // 반환타입 : List<CartDto>
    // 매개변수 : Integer user_idx
    List<CartDto> selectAll(Integer user_idx) throws Exception;

    // 메서드명 : delete
    // 기   능 : 장바구니 상품을 삭제하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    int delete(Integer prod_idx, Integer user_idx) throws Exception;

    // 메서드명 : addCount
    // 기   능 : 개수조절버튼 중 '+' 버튼을 눌렀을 때, 장바구니상품 개수를 #{prod_cnt} + 1 처리하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    int addCount(Integer prod_idx, Integer user_idx) throws Exception;

    // 메서드명 : subtractCount
    // 기   능 : 개수조절버튼 중 '-' 버튼을 눌렀을 때, 장바구니상품 개수를 #{prod_cnt} - 1 처리하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx, Integer prod_cnt
    int subtractCount(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception;

    // 메서드명 : removeAll
    // 기   능 : 회원번호가 #{user_idx}에 해당하는 회원의 장바구니 목록을 삭제하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer user_idx
    int removeAll(Integer user_idx) throws Exception;
}
