package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.OrderDto;

import java.util.List;

public interface MyOrderService {
    List<MyOrderDto> getlist(Integer user_idx) throws Exception;
}
