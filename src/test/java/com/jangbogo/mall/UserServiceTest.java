package com.jangbogo.mall;


import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserServiceTest {

    @Autowired
    UserService service;

    @Test //OK
    public void withdrawUser () throws Exception {
        int result = service.withdrawUser(1, "jinvicky@naver.com");
        log.info("result= "+ result);
    }

    @Test //OK
    public void findUserEmail () throws Exception {
        String result = service.findUserEmail("진진자라", "1234");
        log.info("result= "+ result);
//        assertTrue(result != null);
    }

    @Test //OK
    public void isUserPresent () throws Exception {
        boolean result = service.isUserPresent("진진자라", "jinvicky@naver.com");
        log.info("result= "+ result);
        assertTrue(result); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void selectUser () throws Exception {
        User result = service.selectUser(1);
        log.info("result= "+ result);
        assertTrue(result != null); //테스트 실패시 빨간 줄 추가됨. 무시
    }

    @Test //OK
    public void updatePwd () throws Exception {
        int result = service.updatePwd("tempPwd", "진진자라", "jinvicky@naver.com");
        log.info("result= "+ result);
        assertTrue(result != 0); //테스트 실패시 빨간 줄 추가됨. 무시
    }
}

