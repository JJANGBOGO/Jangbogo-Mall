package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.UserInquiryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInquiryDaoImpl implements UserInquiryDao {

    @Autowired
    SqlSession session;

    private static final String nameSpace = "com.jangbogo.mall.dao.userInquiryMapper.";

    @Override
    public Integer insertInquiry(UserInquiryDto userInquiryDto) throws Exception {
        return session.insert(nameSpace + "insertInquiry", userInquiryDto);
    }



}
