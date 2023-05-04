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
        for(int i = 1; i<=110; i++){
            prodReviewDto.setProd_idx(11);
            prodReviewDto.setUser_idx(10);
            prodReviewDto.setCtent("test"+i);
            prodReviewDto.setWriter("tester"+i);
            prodReviewDao.insert(prodReviewDto);
        }


    }

}