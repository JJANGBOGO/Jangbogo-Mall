package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.ProdInqryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdInqryDaoImpl implements ProdInqryDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProdInqryMapper.";

    @Override
    public List<ProdInqryDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }
}