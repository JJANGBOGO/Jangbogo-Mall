package com.jangbogo.mall;


import com.jangbogo.mall.dao.UserDao;
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
import java.util.Objects;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RegExTest {

    @Test
    public void test1() throws Exception {
        String val = "test";
        log.info("1..." + Objects.equals(val, "test")); //null 처리도 가능해서 선택.
        log.info("2..." + val.equals("test"));
        log.info("3..." + (val == "test"));
    }

    @Test
    public void test2() throws Exception {
        SellerDtl  dtl = new SellerDtl();
        log.info("1....." +dtl);
        log.info("2....." + (dtl == null));
        log.info("3....." + Objects.equals(dtl, null));
    }

}
