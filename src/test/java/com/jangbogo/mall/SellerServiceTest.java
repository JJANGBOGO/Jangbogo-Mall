package com.jangbogo.mall;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.service.SellerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SellerServiceTest {

    @Autowired
    SellerService service;

    @Test //OK
    public void withdrawSeller () throws Exception {
        int result = service.withdrawSeller(8, "jinvicky1008");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void getSellerByIdx () throws Exception {
        Seller seller = service.getSellerByIdx(8);
        log.info("seller=" + seller);
        assertTrue(seller != null);
    }

    @Test //ok
    public void updateSeller () throws Exception {
        Seller seller = Seller.builder()
                .idx(8)
                .email("jinvicky1008")
                .cpnm("진이사과나무")
                .repr_nm("포도조아")
                .pwd("rnpqus")
                .mpno("8989").build();
        int result = service.updateSeller(seller);
        log.info("seler" + result);
        assertTrue(result != 0);
    }


}
