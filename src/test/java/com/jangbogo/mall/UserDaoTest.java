package com.jangbogo.mall;


import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoTest {

    @Autowired
    UserDao dao;

    @Test //OK
    public void withdrawTest () throws Exception {
        int result = dao.deleteUser(1, "jinvicky@naver.com");
        log.info("result="+ result);
    }
    @Test //OK
    public void findEmailTest () throws Exception {
        String result = dao.selUserEmail("진진자라", "1234");
        log.info("result="+ result);
    }

    @Test //OK
    public void findByEmailTest () throws Exception {
        User result = dao.selUserByEmail("진진자라", "jinvicky@naver.com");
        log.info("result="+ result);
    }
}
