package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Seller;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class SellerDaoImpl implements SellerDao {

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.SellerMapper.";

    @Override
    public int deleteSeller (Integer idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "deleteSeller", map);
    }

    @Override
    public Seller getSellerByIdx (Integer idx) throws Exception  {
        return session.selectOne(nameSpace + "getSellerByIdx", idx);
    }
}
