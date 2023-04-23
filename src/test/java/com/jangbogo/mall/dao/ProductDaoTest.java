package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.ProductDto;
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
import java.util.List;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProductDaoTest {

    @Autowired
    ProductDao dao;

    @Test
    public void getListBySeller() throws Exception {
        List<ProductDto> list = dao.getListBySeller(1);
        log.info("....list..." + list);
    }

    @Test //ok
    public void insertProduct() throws Exception { //상품 insert
        ProductDto productDto = ProductDto.builder()
                .seler_idx(1)
                .cate_idx(11)
                .seler_prod_cd(1)
                .upload_path("default_banner.jpeg")
                .name("상품 이름")
                .ctent("상품 내용")
                .prc(8000)
                .dc_state_cd(1)
                .dc_rate(0)
                .dsply_state_cd(1)
                .build();

        int result = dao.insertProduct(productDto);
        assertTrue(result != 0);
    }

}
