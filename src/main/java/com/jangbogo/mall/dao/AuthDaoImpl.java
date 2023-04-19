package com.jangbogo.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthDaoImpl implements AuthDao{

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.fastcampus.ch4.dao.AuthMapper.";

    @Override
    public List<String> getAuthList(int auth_idx) throws Exception{
        return session.selectList(nameSpace + "getAuthList", auth_idx);
    }

}
