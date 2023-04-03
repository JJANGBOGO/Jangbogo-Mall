package com.jangbogo.mall.dao;

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
        List<WishlistDto> list = wishlistDao.getlist(3);
        System.out.println("list = " + list);
        assertTrue(list.get(0).getProd_idx().equals(1));
        assertTrue(list.get(1).getProd_idx().equals(2));

    }
    @Test
    public void delete() throws Exception{
        assertTrue(wishlistDao != null);
        System.out.println("wishlistDao = " + wishlistDao);
        int cnt = wishlistDao.delete(2,3);
        assertTrue(cnt==1);
        System.out.println("cnt = " + cnt);

    }

}