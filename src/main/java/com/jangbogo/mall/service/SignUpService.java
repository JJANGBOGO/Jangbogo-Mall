package com.jangbogo.mall.service;


import com.jangbogo.mall.dao.Dao;
import com.jangbogo.mall.domain.UserDetailsDto;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("signUpService")
@Slf4j
public class SignUpService {

    @Autowired //can not autowired 에러 발생
    private BCryptPasswordEncoder passwordEncoder;

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Transactional
    public boolean insertUserInfo(String username, String password) { //User user로 대체 가능
        Dao dao = sqlSession.getMapper(Dao.class);
        UserDetailsDto user = dao.selectUser(username);

        if(user != null) return false;
        else {
            //dao 작업이 2개라서 transactional 처리함.
            dao.userSignUp(username, passwordEncoder.encode(password), '1');
            dao.giveAuth(username, "ROLE_USER");
            return true;
        }
    }

    @Transactional
    public boolean insertSocialUser (String username, String email) {
        return true;
    }

}
