package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.domain.UserDetailsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class SellerDaoImpl implements SellerDao {

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.SellerMapper.";

    @Override
    public int deleteSeller (Integer idx, String email) throws Exception {
        Map map = new HashMap();
        map.put("idx", idx);
        map.put("email", email);
        return session.update(nameSpace + "deleteSeller", map);
    }

    @Override
    public Seller getSellerByIdx (Integer idx) throws Exception  {
        return session.selectOne(nameSpace + "getSellerByIdx", idx);
    }

    @Override
    public int updateSeller (Seller seller) throws Exception {
        return session.update(nameSpace + "updateSeller", seller);
    }

    @Override
    public int updateSellerDtl (SellerDtl detail) throws Exception {
        return session.update(nameSpace + "updateSellerDtl", detail);
    }

    @Override
    public int insertSellerDtl (SellerDtl detail) throws Exception {
        return session.insert(nameSpace + "insertSellerDtl", detail);
    }

    @Override
    public SellerDtl getSellerDtl (Integer seler_idx) throws Exception {
        return session.selectOne(nameSpace + "getSellerDtl", seler_idx);
    }

    @Override
    public int insertSeller (Seller seller) throws Exception {
        return session.insert(nameSpace + "insertSeller", seller);
    }

    @Override
    public int updateSellerBrnd (Seller seller) throws Exception {
        return session.update(nameSpace + "updateSellerBrnd", seller);
    }

    @Override
    public Seller getSellerByCpnm (String cpnm) throws Exception {
        return session.selectOne(nameSpace + "getSellerByCpnm", cpnm);
    }

    @Override
    public Seller getSellerByEmail (String email) throws Exception {
        return session.selectOne(nameSpace + "getSellerByEmail", email);
    }

    @Override
    public int updatePwd (String pwd, String cpnm, String email) throws Exception {
        Map map = new HashMap();
        map.put("pwd", pwd);
        map.put("cpnm", cpnm);
        map.put("email", email);
        return session.update(nameSpace + "updatePwd", map);
    }

    @Override
    public UserDetailsDto getSellerDetailsDto(String email) throws Exception{
        return session.selectOne(nameSpace + "getSellerDetailsDto", email);
    }


}
