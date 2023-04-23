package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.DateFormat;
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
    public void getListBySeller () throws Exception {
        List<ProductDto> list = dao.getListBySeller(1);
        log.info("....list..." + list);
    }

    @Test //ok
    public void insertProduct () throws Exception { //상품 insert
        ProductDto productDto = ProductDto.builder()
                .seler_idx(1)
                .cate_idx(11)
                .seler_prod_cd(1)
                .upload_path("default_banner.jpeg")
                .name("상품 이름5")
                .ctent("상품 내용5")
                .prc(8000)
                .dc_state_cd(1)
                .dc_rate(0)
                .dsply_state_cd(1)
                .build();

        int result = dao.insertProduct(productDto);
        log.info("...result" + result + productDto.getIdx()); //result: 1, productDto.getIdx() => idx
        assertTrue(result != 0);
    }

    @Test
    public void insertProductDtl () throws Exception {
        ProductDtl productDtl = ProductDtl.builder()
                .prod_idx(7)
                .orplc("대한민국")
                .sle_unit("개")
                .weight("500g")
                .mft_tm(new Date())
                .distb_tlmt(new Date())
                .warn("주의사항....")
                .max_sle_quty(10)
                .sfkp_tp_state_cd(1)
                .sle_start_tm(new Date())
                .sle_end_tm(new Date())
                .inv_quty(40)
                .guid("안내사항....").build();

        int result = dao.insertProductDtl(productDtl);
        assertTrue(result != 0);
    }

}
