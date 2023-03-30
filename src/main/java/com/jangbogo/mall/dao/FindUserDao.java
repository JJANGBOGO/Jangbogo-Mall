package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.User;

public interface FindUserDao {

    //아이디와 이메일 조합에 존재하는 회원의 수를 가져온다.
    int checkExistingUser (User user) throws Exception;

    int updateWithTempPwd( User user) throws Exception;
}
