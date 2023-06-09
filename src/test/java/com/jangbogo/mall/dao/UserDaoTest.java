package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoTest {

    @Autowired
    UserDao dao;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;


    @Test //OK
    public void withdrawTest () throws Exception {
        int result = dao.deleteUser(1, "jinvicky@naver.com");
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
        User result = dao.getUserByEmail("jinvicky@naver.com");
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
        String encodedPwd = passwordEncoder.encode("1000");
        User user = User.builder()
                .email("11@naver.com")
                .nick_nm("뉴비_11")
                .pwd(encodedPwd)
                .mpno("010")
                .brdy(new Date("2001/10/07"))
                .user_agre_yn("Y")
                .markt_agre_yn("N")
                .build();
        int result = dao.insertUser(user);
        int idx = user.getIdx();
        log.info("result=" + idx + result); //idx => return idx , result => return idx ??
        assertTrue(result != 0);
    }

    @Test
    public void updateLoginTm () throws Exception { //ok
        int result = dao.updateLoginTm(26, "jinvicky@naver.com");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test
    public void chkDuplicateNick () throws Exception  { //ok
        User result = dao.getUserByNick("뉴비_1");
        log.info("result=" + result);
        assertTrue(result != null);
    }

    @Test
    public void encodingTest () throws Exception { //ok 비번변경에 패스워드 인코딩 적용
        String pwd = "nepqxywqfnfj";
        String encodedPwd = "$2a$10$5./yx3UOnTkBviEiuawzBe8WeRqqqlPTtV6wmcuWDdsMpO/4hZm8u";

        assertTrue(passwordEncoder.matches(pwd, encodedPwd));
    }

    @Test
    public void updateUser () throws Exception  {
        User user = User.builder()
                .idx(20)
                .email("1@naver.com")
                .nick_nm("뉴비_update")
                .pwd("encodedPwdUpdate")
                .mpno("010update")
                .markt_agre_yn("Y")
                .build();
        int result = dao.updateUser(user);
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test
    public void updatePwdUptTm () throws Exception  { //ok
        int result = dao.updatePwdUptTm(22, "2@naver.com");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test
    public void deleteUser () throws Exception  { //ok
        int result = dao.deleteUser(2, "jinvicky17@gmail.com");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

}
