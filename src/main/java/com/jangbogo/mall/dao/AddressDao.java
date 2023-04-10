package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;

import java.util.List;

public interface AddressDao {

    int insertAddr (Address addr) throws Exception; //배송지 추가

    List<Address> selAddrList (int user_idx) throws Exception; //idx로 배송지 조회
}
