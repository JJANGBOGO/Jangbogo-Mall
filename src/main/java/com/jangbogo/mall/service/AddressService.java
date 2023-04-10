package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Address;

import java.util.List;

public interface AddressService {

    int insertAddr (Address addr) throws Exception;

    List<Address> selAddrList (int user_idx) throws Exception;

}
