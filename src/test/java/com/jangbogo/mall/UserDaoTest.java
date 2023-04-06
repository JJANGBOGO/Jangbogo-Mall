package com.jangbogo.mall;


import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

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

    @Test //OK
    public void selectUserTest () throws Exception {
        User result = dao.selectUser(1);
        log.info("result="+ result);
        assertTrue(result != null);
    }

    @Test //OK
    public void updatePwdTest () throws Exception {
        int result = dao.updatePwd("randomPwd", "진진자라", "jinvicky@naver.com");
        log.info("result="+ result);
        assertTrue(result != 0);
    }

    @Test //OK
    public void chkDuplicateEmail () throws Exception {
        User result = dao.chkDuplicateEmail("jinvicky@naver.com");
        log.info("result="+ result);
        assertTrue(result != null);
    }

    @Test //OK
    public void insertSocialUser () throws Exception {
        User user = User.builder().email("test16@naver.com").nick_nm("테스트16").login_tp_cd(2).build();
        int result = dao.insertSocialUser(user);
        int idx = user.getIdx();
        log.info("result=" + idx);
        assertTrue(result != 0);
    }

    @Test //OK
    public void insertUser () throws Exception {
        User user = User.builder()
                .email("3@naver.com")
                .nick_nm("뉴비_3")
                .pwd("1000")
                .mpno("010")
                .brdy(new Date("2001/10/07"))
                .user_agre_yn("Y")
                .markt_agre_yn("N")
                .build();
        int result = dao.insertUser(user);
        int idx = user.getIdx();
        log.info("result=" + idx);
        assertTrue(result != 0);
    }

    @Test
    public void updateLoginTm () throws Exception { //ok
        int result = dao.updateLoginTm(26, "jinvicky@naver.com");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test
    public void chkDuplicateNick () throws Exception  {
        User result = dao.chkDuplicateNick("뉴비_1");
        log.info("result=" + result);
        assertTrue(result != null);
    }


}
