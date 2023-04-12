package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.AddressDao;
import com.jangbogo.mall.domain.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService{

    @Autowired
    AddressDao dao;

    @Override
    public int insertAddr (Address addr) throws Exception {
        return dao.insertAddr(addr);
    }

    @Override
    public List<Address> selAddrList (Integer user_idx) throws Exception {
        return dao.selAddrList(user_idx);
    }

    @Override
    public Address selAddr (Integer idx) throws Exception {
        return dao.selAddr(idx);
    }

    @Override
    public Integer deleteAddr (Integer idx, Integer user_idx) throws Exception {
        return dao.deleteAddr(idx,user_idx);
    }
}
