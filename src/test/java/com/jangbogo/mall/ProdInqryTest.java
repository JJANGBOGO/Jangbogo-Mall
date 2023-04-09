package com.jangbogo.mall;


import com.jangbogo.mall.dao.ProdInqryDao;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProdInqryTest {

    private ProdInqryDao prodInqryDao;

//    @Test
    public void insertTestData() {
//        prodInqryDao.deleteAll();
//        for(int i = 1; i<=220;i++){
//            ProdInqryDto prodInqryDto = new(
//        }
    }
}
