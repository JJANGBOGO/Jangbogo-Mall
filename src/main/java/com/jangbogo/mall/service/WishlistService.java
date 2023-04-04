package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.WishlistDto;

import java.util.List;

public interface WishlistService {

    List<WishlistDto> getlist(int idx) throws Exception;

    int delete(Integer prod_idx, Integer user_idx) throws Exception;

    int insertCart(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception;

    int updateCartCnt(Integer prod_idx, Integer user_idx, Integer cnt) throws Exception;

    int checkCart(Integer prod_idx, Integer user_idx) throws Exception;
}
