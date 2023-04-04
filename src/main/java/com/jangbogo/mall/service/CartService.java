package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.CartDao;
import com.jangbogo.mall.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    CartDao cartDao;

    // 메서드명 : getList
    // 기   능 : cartDao의 selectAll메서드 호출
    // 반환타입 : List<CartDto>
    public List<CartDto> getList() throws Exception {
        return cartDao.selectAll();
    }

    // 메서드명 : remove
    // 기   능 : cartDao의 delete메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    public int remove(Integer prod_idx, Integer user_idx) throws Exception {
        return cartDao.delete(prod_idx, user_idx);
    }
}
