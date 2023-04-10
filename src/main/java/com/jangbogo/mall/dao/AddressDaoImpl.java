package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public List<Address> selAddrList(int user_idx) throws Exception {//idx로 배송지 조회
        return session.selectList(nameSpace + "selAddrList", user_idx);
    }
}
