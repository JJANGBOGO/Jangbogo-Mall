package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Address;

import java.util.List;

public interface AddressService {

    int insertAddr (Address addr) throws Exception;

    List<Address> selAddrList (Integer user_idx) throws Exception;

    Address selAddr (Integer idx) throws Exception;

    Integer deleteAddr (Integer idx, Integer user_idx) throws Exception;

    Integer updateAddr(Address address) throws Exception;

    Integer resetDefault_N ( Integer user_idx) throws Exception;
}
