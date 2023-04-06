package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDaoImpl implements AddressDao{

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.AddressMapper.";

    @Override
    public int insertAddr (Address addr) throws Exception {
        return session.insert(nameSpace + "insertAddr", addr);
    }
}
