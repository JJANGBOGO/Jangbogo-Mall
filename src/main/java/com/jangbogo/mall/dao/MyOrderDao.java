package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.OrderDto;

import java.util.List;

public interface MyOrderDao {
    List<MyOrderDto> getlist(Integer user_idx) throws Exception;
}
