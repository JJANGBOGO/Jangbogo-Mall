package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;

import java.util.List;

public interface AddressDao {

    int insertAddr (int user_idx, Address addr) throws Exception; //배송지 추가

    List<Address> selAddrList (Integer user_idx) throws Exception; //idx로 배송지 조회

    Address selAddr(Integer idx) throws Exception;

    Integer deleteAddr(Integer idx, Integer user_idx) throws Exception;
    Integer changeState(Integer user_idx) throws Exception;


    Integer updateAddr(Address address) throws Exception;

    Integer resetDefault_N(Integer user_idx) throws Exception;

    Integer AddrStateCD(Integer idx) throws Exception;

    Integer resetStateCD(Integer user_idx) throws Exception;

    Address selAddrSelected(Integer user_idx);
}
