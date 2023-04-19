package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProdReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdReviewDaoImpl implements ProdReviewDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProdReviewMapper.";

    @Override
    public List<ProdReviewDto> selectAll(Integer prod_idx) throws Exception {
        return session.selectList(namespace + "selectAll", prod_idx);
    }



}
