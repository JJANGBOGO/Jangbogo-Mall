package com.jangbogo.mall;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SellerDaoTest {

    @Autowired
    SellerDao dao;

    @Test //OK
    public void deleteSeller () throws Exception {

        int result = dao.deleteSeller(8, "jinvicky1008");
        log.info("result=" + result);
        assertTrue(result != 0);
    }


}
