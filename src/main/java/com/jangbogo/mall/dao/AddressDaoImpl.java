package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AddressDaoImpl implements AddressDao {

    @Autowired
    SqlSession session;

    private static final String nameSpace = "com.jangbogo.mall.dao.AddressMapper.";

    @Override
    public int insertAddr(Address addr) throws Exception {
        return session.insert(nameSpace + "insertAddr", addr);
    }

    @Override
    public List<Address> selAddrList(Integer user_idx) throws Exception {//idx로 배송지 조회
        return session.selectList(nameSpace + "selAddrList", user_idx);
    }

    @Override
    public Address selAddr(Integer idx) throws Exception {//idx로 배송지 조회
        return session.selectOne(nameSpace + "selAddr", idx);
    }

    @Override
    public Integer deleteAddr(Integer idx, Integer user_idx) throws Exception { // 배송지일련번호, 회원번호로 배송지 삭제
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("user_idx", user_idx);
        return session.update(nameSpace+"deleteAddr",map);
    }




}
