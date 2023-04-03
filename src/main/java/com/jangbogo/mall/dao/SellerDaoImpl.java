package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.SearchCondition;
import com.jangbogo.mall.domain.Seller;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SellerDaoImpl implements SellerDao {

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.admin.dao.SellerMapper.";

    @Override
    public int insertSeller (Seller seller) throws Exception {
        return session.insert(nameSpace + "insertSeller", seller);
    }

    @Override
    public Seller select (int idx) throws Exception {
        return session.selectOne(nameSpace + "select");
    }

    @Override
    public List<Seller> selectListPage (Map map) throws Exception {
        return session.selectList(nameSpace + "selectListPage", map);
    }

    @Override
    public List<Seller> searchSelectPage (SearchCondition sc) throws Exception {
        return session.selectList(nameSpace +"searchSelectPage", sc);
    }

    @Override
    public int updateSeller (Seller seller) throws Exception {
        return session.update(nameSpace + "updateSeller", seller);
    }

    @Override
    public int deleteSeller (int idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "deleteSeller", map);
        //상태를 3으로 변경
    }
}
