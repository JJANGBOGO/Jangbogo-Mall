package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.OrderDetailDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.ProdReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProdReviewDaoImpl implements ProdReviewDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProdReviewMapper.";

    @Override
    public List<ProdReviewDto> selectAll(Integer prod_idx) throws Exception {
        return session.selectList(namespace + "selectAll", prod_idx);
    }

    @Override
    public Integer update(ProdReviewDto prodReviewDto) throws Exception {
        return session.update(namespace + "update", prodReviewDto);
    }

    @Override
    public Integer insert(ProdReviewDto prodReviewDto) throws Exception {
        return session.insert(namespace + "insert", prodReviewDto);
    }

//    @Override
//    public List<OrderDto> get_ord_idx(Integer user_idx, Integer prod_idx) throws Exception {
//        Map map = new HashMap();
//        map.put("user_idx",user_idx);
//        map.put("prod_idx",prod_idx);
//        return session.selectList(namespace+"get_ord_idx", map);
//
//    }

}
