package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.WishlistDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class WishlistDaoImplTest {
    @Autowired
    WishlistDao wishlistDao;
    @Test
    public void select() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        List<ProductDto> list = wishlistDao.getlist(3);
        System.out.println("list = " + list);
        assertTrue(list!=null);

    }
    @Test
    public void delete() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        int cnt = wishlistDao.delete(2,3);
        assertTrue(cnt==1);
        System.out.println("cnt = " + cnt);

    }
    @Test
    public void insertCart() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        int cnt = wishlistDao.insertCart(2,3,1);
        assertTrue(cnt==1);
//        System.out.println("cnt = " + cnt);

    }
    @Test
    public void updateCartCnt() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        int cnt = wishlistDao.updateCartCnt(2,3,2);
        assertTrue(cnt==1);
        System.out.println("cnt = " + cnt);

    }

    @Test
    public void checkCart() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        int cnt = wishlistDao.checkCart(2,3);
        assertTrue(cnt==1);
        System.out.println("cnt = " + cnt);

    }

    @Test
    public void getUser() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
//        String email = "carabut@naver.com";
        int cnt = wishlistDao.getUser("varabut@naver.com");
        assertTrue(cnt==3);
        System.out.println("cnt = " + cnt);

    }
    @Test
    public void getProduct() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        List<ProductDto> list = wishlistDao.getProduct(new Integer[]{1,2});
        assertTrue(list.get(0).getName().equals("홈런볼"));
        assertTrue(list.get(1).getName().equals("맛동산"));
        System.out.println(list.get(0).getName());

    }



}