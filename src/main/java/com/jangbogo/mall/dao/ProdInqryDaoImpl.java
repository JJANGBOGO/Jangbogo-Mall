package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.JoinProdInqryDto;
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
// 전체 게시물 보여주기
    @Override
    public List<JoinProdInqryDto> selectAll(Integer prod_idx) throws Exception {
        return session.selectList(namespace + "selectAll", prod_idx);
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
// 게시물 한 개 보여주기
    @Override
    public JoinProdInqryDto select(Integer idx) throws Exception {
        return session.selectOne(namespace + "select", idx);
    }
// 게시물 페이지 단위로 보여주기
    @Override
    public List<JoinProdInqryDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    public String selectNickName(Integer user_idx) throws Exception {
        return session.selectOne(namespace + "selectNickName", user_idx);
    }

    @Override
    public int insert(ProdInqryDto prodInqryDto) throws Exception {
        return session.insert(namespace + "insert", prodInqryDto);
    }

    @Override
    public int delete(Integer idx, Integer prod_idx, Integer user_idx) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("user_idx", user_idx);
        map.put("prod_idx", prod_idx);
        return session.delete(namespace + "delete", map);
    }

    @Override
    public int deleteAll(Integer prod_idx) throws Exception{
        return session.delete(namespace + "deleteAll", prod_idx);
    }

    @Override
    public int update(ProdInqryDto prodInqryDto) throws Exception {
        return session.update(namespace + "update", prodInqryDto);
    }


}