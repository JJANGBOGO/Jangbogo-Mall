package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Address;

import java.util.List;

public interface AddressService {

    int insertAddr (int user_idx , Address addr) throws Exception;

    List<Address> selAddrList (Integer user_idx) throws Exception;

    Address selAddr (Integer idx) throws Exception;

    Integer deleteAddr (Integer idx, Integer user_idx) throws Exception;

    Integer changeState (Integer user_idx) throws Exception;


    Integer updateAddr(Address address) throws Exception;

    Integer resetDefault_N ( Integer idx) throws Exception;

    Integer AddrStateCD ( Integer idx) throws Exception;

    Integer resetStateCD ( Integer user_idx) throws Exception;

    Address selAddrSelected(Integer user_idx);

    String checkIS_DEFAULT_YN (Integer idx) throws Exception;

    Integer checkIS_FIRST_YN (Integer user_idx) throws Exception;
    Integer insertAddrDefault (Integer user_idx, Address address) throws Exception;
}
