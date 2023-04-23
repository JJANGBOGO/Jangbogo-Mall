package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.domain.UserDetailsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SqlSession session;

    private static final String nameSpace = "com.jangbogo.mall.dao.UserMapper.";

    @Override
    public int withdrawUser(Integer idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "deleteUser", map);
    }

    @Override
    public User selectUser(Integer idx) throws Exception {
        return session.selectOne(nameSpace + "selectUser", idx);
    }

    @Override
    public int updatePwd(String pwd, String nick_nm, String email) throws Exception {
        Map map = new HashMap();
        map.put("pwd", pwd);
        map.put("nick_nm", nick_nm);
        map.put("email", email);
        return session.update(nameSpace + "updatePwd", map);
    }

    @Override
    public User getUserByEmail(String email) throws Exception {
        return session.selectOne(nameSpace + "getUserByEmail", email);
    }

    @Override
    public int insertSocialUser(User user) throws Exception {
        session.insert(nameSpace + "insertSocialUser", user);
        return user.getIdx();
    }

    @Override
    public int insertUser(User user) throws Exception {
        session.insert(nameSpace + "insertUser", user);
        return user.getIdx();
    }

    @Override
    public int updateLoginTm(Integer idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "updateLoginTm", map);
    }

    @Override
    public User getUserByNick(String nick_nm) throws Exception {
        return session.selectOne(nameSpace + "getUserByNick", nick_nm);
    }

    @Override
    public int updateUser (User user) throws Exception {
        return session.update(nameSpace +"updateUser", user);
    }

    @Override
    public int updatePwdUptTm (Integer idx, String email) throws Exception  {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace +"updatePwdUptTm", map);
    }

    @Override
    public UserDetailsDto getUserDetailsDto (String email) throws Exception {
        return session.selectOne(nameSpace + "getUserDetailsDto", email);
    }

    @Override
    public int deleteUser (Integer idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.delete(nameSpace + "deleteUser", map);
    }
}

