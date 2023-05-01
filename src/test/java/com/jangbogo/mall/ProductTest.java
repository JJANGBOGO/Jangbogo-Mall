package com.jangbogo.mall;


import com.jangbogo.mall.dao.AddressDao;
import com.jangbogo.mall.dao.RegistProductDao;
import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.RegistProductDto;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProductTest {

    @Autowired
    RegistProductDao dao;
    @Test
    public void test () throws Exception {
        RegistProductDto dto =
                RegistProductDto.builder()
                        .seler_idx(1)
                        .seler_prod_cd(9990)
                        .cate_idx2("0101")
                        .name("test")
                        .content("testcontent")
                        .prc(2000)
                        .upload_path("test.jpg")
                        .dc_rate(0)
                        .dsply_state_cd(1)
                .build();

        dao.insertProduct(dto);
        log.info("....idx..." + dto.getProd_idx());
    }




}
