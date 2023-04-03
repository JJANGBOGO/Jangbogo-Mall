package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.WishlistDto;
import com.jangbogo.mall.service.WishlistServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class WishlistServiceImplTest {
    @Autowired
    WishlistServiceImpl wishlistService;
    @Test
    public void select() throws Exception{
        assertTrue(wishlistService != null);
        System.out.println("wishlistService = " + wishlistService);
        List<WishlistDto> list = wishlistService.getlist(3);
        System.out.println("list = " + list);
        assertTrue(list.get(0).getProd_idx().equals(1));
        assertTrue(list.get(1).getProd_idx().equals(2));

    }
    @Test
    public void delete() throws Exception{
        assertTrue(wishlistService !=null);
        System.out.println("wishlistService = " + wishlistService);
        List<WishlistDto> list = wishlistService.getlist(3);
        System.out.println("list = " + list);
        int cnt = wishlistService.delete(2,3);
        assertTrue(cnt==1);
        System.out.println("list = " + list);
    }

}