package com.jangbogo.mall;


import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserServiceTest {

    @Autowired
    UserService service;

    @Test //OK
    public void withdrawUser() throws Exception {
        int result = service.withdrawUser(1, "jinvicky@naver.com");
        log.info("result= " + result);
    }

    @Test //OK
    public void findUserEmail() throws Exception {
        String result = service.findUserEmail("진진자라", "1234");
        log.info("result= " + result);
//        assertTrue(result != null);
    }

    @Test //OK
    public void isUserPresent() throws Exception {
        boolean result = service.isUserPresent("진진자라", "jinvicky@naver.com");
        log.info("result= " + result);
        assertTrue(result); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void selectUser() throws Exception {
        User result = service.selectUser(1);
        log.info("result= " + result);
        assertTrue(result != null); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void updatePwd() throws Exception {
        int result = service.updatePwd("tempPwd", "진진자라", "jinvicky@naver.com");
        log.info("result= " + result);
        assertTrue(result != 0); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void chkDuplicateEmail() throws Exception {
        User result = service.chkDuplicateEmail("jinvicky@naver.com");
        log.info("result= " + result);
        assertTrue(result != null); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void regSocialUser() throws Exception {
        User user = User.builder().email("sky@naver.com").nick_nm("하늘님").login_tp_cd(2).build();
        int result = service.regSocialUser(user);
        log.info("result= " + result);
        assertTrue(result != 0); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void registerUser() throws Exception {
        User user = User.builder()
                .email("4@naver.com")
                .nick_nm("뉴비_4")
                .pwd("1000")
                .mpno("010")
                .brdy(new Date("2001/10/07"))
                .user_agre_yn("Y")
                .markt_agre_yn("N")
                .build();

        int result = service.insertUser(user);
        log.info("result= " + result);
        assertTrue(result != 0); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test
    public void updateLoginTm() throws Exception { //ok
        int result = service.updateLoginTm(23, "3@naver.com");
        log.info("result= "+ result);
    }
}

