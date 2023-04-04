package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.ProdInqryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProdInqryDaoImpl implements ProdInqryDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProdInqryMapper.";

    @Override
    public List<ProdInqryDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }

    @Override
    public ProdInqryDto select(Integer idx) throws Exception {
        return session.selectOne(namespace + "select", idx);
    }

    @Override
    public List<ProdInqryDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public int insert(ProdInqryDto prodInqryDto) throws Exception {
        return session.insert(namespace + "insert", prodInqryDto);
    }

    @Override
    public int delete(Integer idx, Integer user_idx) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("user_idx", user_idx);
        return session.delete(namespace + "delete", map);
    }

    @Override
    public int deleteAll() throws Exception{
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int update(ProdInqryDto prodInqryDto) throws Exception {
        return session.update(namespace + "update", prodInqryDto);
    }

    @Override
    public ProdInqryDto updateNickName(Integer user_idx) throws Exception {
        return session.selectOne(namespace + "getNickName", user_idx);
    }
}