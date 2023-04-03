package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.UserMapper.";

    @Override
    public int deleteUser (int idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "deleteUser", map);
    }

    @Override
    public String selUserEmail (String nick_nm, String pwd) throws Exception {
        Map map = new HashMap();
        map.put("nick_nm", nick_nm);
        map.put("pwd", pwd);
        return session.selectOne(nameSpace + "selUserEmail", map);
    }

    @Override
    public User selUserByEmail (String nick_nm, String email) throws Exception {
        Map map = new HashMap();
        map.put("nick_nm", nick_nm);
        map.put("email", email);
        return session.selectOne(nameSpace + "selUserByEmail", map);
    }

    @Override
    public User selectUser (int idx) throws Exception {
        return session.selectOne(nameSpace + "selectUser", idx);
    }
}

