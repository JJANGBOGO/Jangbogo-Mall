package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.WishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class WishlistDaoImpl implements WishlistDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.WishlistMapper.";
    @Override
    public List<WishlistDto> getlist(int idx) throws Exception{
        return session.selectList(namespace+"getlist",idx);
    }

    @Override
    public int delete(Integer prod_idx, Integer user_idx) throws Exception {
        Map map = new HashMap();
        map.put("prod_idx", prod_idx);
        map.put("user_idx", user_idx);
        return session.delete(namespace+"delete", map);
    } // int delete(String statement, Object parameter)

    public int insertCart(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception{
        Map map = new HashMap();
        map.put("prod_idx", prod_idx);
        map.put("user_idx", user_idx);
        map.put("prod_cnt", prod_cnt);
        return session.insert(namespace+"insertCart", map);
    }
    public int updateCartCnt(Integer prod_idx, Integer user_idx, Integer cnt) throws Exception{
        Map map = new HashMap();
        map.put("prod_idx", prod_idx);
        map.put("user_idx", user_idx);
        map.put("cnt", cnt);
        return session.insert(namespace+"updateCartCnt",map);
    }

    public int checkCart(Integer prod_idx, Integer user_idx) throws Exception{
        Map map = new HashMap();
        map.put("prod_idx", prod_idx);
        map.put("user_idx", user_idx);
        return session.selectOne(namespace+"checkCart",map);
    }

    public int selectUser(String email) throws Exception{
        Map map = new HashMap();
        map.put("email",email);
        return session.selectOne(namespace+"selectUser",map);
    }


}
