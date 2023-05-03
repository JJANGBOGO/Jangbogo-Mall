package com.jangbogo.mall.domain;

import com.jangbogo.mall.dao.ProdReviewDao;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProdReviewDtoTest {
    @Autowired
    ProdReviewDao prodReviewDao;
    @Test
    public void test() throws Exception{
        ProdReviewDto prodReviewDto = new ProdReviewDto();
        prodReviewDto.setProd_idx(1);
        prodReviewDto.setUser_idx(10);
        prodReviewDto.setCtent("test");
        prodReviewDto.setWriter("tester");
        for(int i = 1; i<=220; i++){
            prodReviewDao.insert(prodReviewDto);
        }

    }

}