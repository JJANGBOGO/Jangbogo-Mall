package com.jangbogo.mall;


import com.jangbogo.mall.dao.AddressDao;
import com.jangbogo.mall.domain.Address;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AddressDaoTest {

    @Autowired
    AddressDao dao;

    @Test //OK
    public void insertAddr () throws Exception {

        Address addr = Address.builder()
                .user_idx(25) //실제 존재 번호
                .zpcd("2")
                .addr_base("2")
                .addr_dtl("detail 2")
                .rcpr_nm("2 11")
                .rcpr_mobl_no("2")
                .is_default_yn("Y")
                .build();


        int addrResult = dao.insertAddr(30, addr);

        log.info("result=" + addrResult);
        assertTrue(addrResult != 0);
    }

    @Test
    public void selAddrList () throws Exception { //OK
        List<Address> list = dao.selAddrList(1);
        log.info("list.... " + list);
        assertTrue(list != null);

    }

    @Test
    public void selAddr() throws Exception { //OK
        Address address = dao.selAddr(7);
        System.out.println("address = " + address);
//        log.info("list.... " + list);
        assertTrue(address != null);

    }

    @Test
    public void deleteAddr() throws Exception { //OK
        int cnt = dao.deleteAddr(7,1);
        System.out.println("cnt = " + cnt);
        Address address = dao.selAddr(7);
        System.out.println("address = " + address);
        System.out.println("address.getState_cd() = " + address.getState_cd());
        assertTrue(address.getState_cd()==3);
//        log.info("list.... " + list);
        assertTrue(cnt != 0);

    }

    @Test
    public void updateAddr() throws Exception { //OK
        Address address = new Address();
//        address.setAddr_dtl("101동302호");
        address.setRcpr_nm("박하늘");
//        address.setRcpr_mobl_no("010-9276-8137");
        address.setIs_default_yn("true");
        address.setIdx(3);
        address.setUser_idx(1);
//        address.setIs_default_yn("false");
//        Integer cnt1 = dao.resetDefault_N(1);
        Integer cnt2 = dao.updateAddr(address);
        System.out.println("address = " + address);
//        System.out.println("cnt1 = " + cnt1);
        System.out.println("cnt2 = " + cnt2);
//        assertTrue(cnt1!=0);
        assertTrue(cnt2!=0);

    }

    @Test
    public void changeState() throws Exception { //OK
       dao.resetStateCD(3);
       dao.AddrStateCD(9);
       assertTrue(true);

    }





}
