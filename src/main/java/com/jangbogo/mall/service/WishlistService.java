package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.WishlistDto;

import java.util.List;

public interface WishlistService {

    List<WishlistDto> getlist(int idx) throws Exception;

    int delete(Integer prod_idx, Integer user_idx) throws Exception;
}
