package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.CartDto;

import java.util.List;

public interface CartDao {
    CartDto getUserIdx(String email) throws Exception;

    List<CartDto> selectAll(Integer user_idx) throws Exception;

    int delete(Integer prod_idx, Integer user_idx) throws Exception;

    int addCount(Integer prod_idx, Integer user_idx) throws Exception;

    int subtractCount(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception;
}
