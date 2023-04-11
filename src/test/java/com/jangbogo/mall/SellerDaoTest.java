package com.jangbogo.mall;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
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
    public void deleteSeller() throws Exception {

        int result = dao.deleteSeller(8, "jinvicky1008");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void getUserByIdx() throws Exception {
        Seller seller = dao.getSellerByIdx(8);
        log.info("seler" + seller);
        assertTrue(seller != null);
    }

    @Test //ok
    public void updateSeller() throws Exception {
        Seller seller = Seller.builder()
                .idx(8)
                .email("jinvicky1008")
                .cpnm("진이샹달프55")
                .repr_nm("남궁진55")
                .pwd("changed55")
                .mpno("565299").build();
        int result = dao.updateSeller(seller);
        log.info("seler" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void updateSellerDtl() throws Exception {
        SellerDtl dtl = SellerDtl.builder().seler_idx(8).build();
        int result = dao.updateSellerDtl(dtl);
        log.info("result" + result);
        assertTrue(result != 0);
    }


}
