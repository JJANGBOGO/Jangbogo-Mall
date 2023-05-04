package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.MyOrderDao;
import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyOrderServiceImpl implements MyOrderService {
    @Autowired
    private MyOrderDao myOrderDao;

    @Override
    public List<MyOrderDto> getlist(Integer user_idx) throws Exception {
        return myOrderDao.getlist(user_idx);
    }



}
