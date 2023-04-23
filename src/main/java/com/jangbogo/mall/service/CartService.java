package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.CartDto;

import java.util.List;

public interface CartService {

    // 메서드명 : getList
    // 기   능 : cartDao의 selectAll메서드 호출
    // 반환타입 : List<CartDto>
    // 매개변수 : Integer user_idx
    List<CartDto> getList(Integer user_idx) throws Exception;

    // 메서드명 : remove
    // 기   능 : cartDao의 delete메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    int remove(Integer prod_idx, Integer user_idx) throws Exception;

    // 메서드명 : updateCount
    // 기   능 : cartDao의 updateCount메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt
    int updateCount(Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt) throws Exception;

    // 메서드명 : removeAll
    // 기   능 : cartDao의 deleteAll메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer user_idx
    int removeAll(Integer user_idx) throws Exception;
}
