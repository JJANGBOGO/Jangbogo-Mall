package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.CartDto;

import java.util.List;

public interface CartService {
    // 메서드명 : getUserIdx
    // 기   능 : cartDao의 getUserIdx메서드 호출
    // 반환타입 : cartDto
    CartDto getUserIdx(String email) throws Exception;

    // 메서드명 : getList
    // 기   능 : cartDao의 selectAll메서드 호출
    // 반환타입 : List<CartDto>
    List<CartDto> getList(Integer user_idx) throws Exception;

    // 메서드명 : remove
    // 기   능 : cartDao의 delete메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    int remove(Integer prod_idx, Integer user_idx) throws Exception;

    // 메서드명 : addCount
    // 기   능 : cartDao의 addCount메서드 호출
    // 반환타입 : Integer prod_idx, Integer user_idx
    int addCount(Integer prod_idx, Integer user_idx) throws Exception;

    // 메서드명 : subtractCount
    // 기   능 : cartDao의 subtractCount메서드 호출
    // 반환타입 : Integer prod_idx, Integer user_idx
    int subtractCount(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception;
}
