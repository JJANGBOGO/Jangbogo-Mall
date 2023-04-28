package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.RegistProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class RegistProductDaoImpl implements RegistProductDao {

    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.RegistProductMapper.";

    @Override
    public int getProdIdx(Integer prod_cd_val) throws Exception {
        return session.selectOne(namespace + "getProdIdx", prod_cd_val);
    }

    @Override
    public int insertProduct(RegistProductDto registProductDto) throws Exception {
        return session.insert(namespace + "insertProduct", registProductDto);
    }

    @Override
    public int insertProductDetail(RegistProductDto registProductDto) throws Exception {
        return session.insert(namespace + "insertProductDetail", registProductDto);
    }

    @Override
    public int insertProductFile(RegistProductDto registProductDto) throws Exception {
        return session.insert(namespace + "insertProductFile", registProductDto);
    }
}
