package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.CartDao;
import com.jangbogo.mall.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    // CartDao 자동 주입
    @Autowired
    CartDao cartDao;

    // 메서드명 : getList
    // 기   능 : cartDao의 selectAll메서드 호출
    // 반환타입 : List<CartDto>
    // 매개변수 : Integer user_idx
    @Override
    public List<CartDto> getList(Integer user_idx) throws Exception {
        return cartDao.selectAll(user_idx);
    }

    // 메서드명 : remove
    // 기   능 : cartDao의 delete메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    @Override
    public int remove(Integer prod_idx, Integer user_idx) throws Exception {
        return cartDao.delete(prod_idx, user_idx);
    }

    // 메서드명 : updateCount
    // 기   능 : cartDao의 updateCount메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt
    @Override
    public int updateCount(Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt) throws Exception {

        return cartDao.updateCount(prod_idx, user_idx, prod_cnt, upt_cnt);
    }

    // 메서드명 : removeAll
    // 기   능 : cartDao의 deleteAll메서드 호출
    // 반환타입 : int
    // 매개변수 : Integer user_idx
    @Override
    public int removeAll(Integer user_idx) throws Exception {
        return cartDao.removeAll(user_idx);
    }
}
