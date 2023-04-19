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
    public int insertAddr(int user_idx, Address addr) throws Exception {
        Map map = new HashMap();
        map.put("user_idx", user_idx);
        map.put("addr", addr);
        return session.insert(nameSpace + "insertAddr", map);
    }

    @Override
    public List<Address> selAddrList(int user_idx) throws Exception {//idx로 배송지 조회
        return session.selectList(nameSpace + "selAddrList", user_idx);
    }
}
