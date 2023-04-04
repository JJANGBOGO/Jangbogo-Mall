package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao dao;

    @Override
    public int withdrawUser (int idx, String email) throws Exception  {
        return dao.deleteUser(idx, email);
    }

    @Override
    public String findUserEmail (String nick_nm, String pwd) throws Exception {
        return dao.selUserEmail(nick_nm, pwd);
    }

    @Override
    public boolean isUserPresent (String nick_nm, String email) throws Exception {
        return dao.selUserByEmail(nick_nm, email) != null;
    }

    @Override
    public User selectUser (int idx) throws Exception {
        return dao.selectUser(idx);
    }

    @Override
    public int updatePwd (String pwd, int idx, String email) throws Exception {
        return dao.updatePwd(pwd, idx, email);
    }

    //임시 비번 생성
    public String createTmpPwd () {
        String pwd = "";
        for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
        };
        return pwd;
    }

}
