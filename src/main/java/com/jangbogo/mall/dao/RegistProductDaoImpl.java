package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.RegistProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RegistProductDaoImpl implements RegistProductDao {

    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.RegistProductMapper.";

    @Override
    public int getProdIdx(RegistProductDto registProductDto) throws Exception {
        return session.selectOne(namespace + "getProdIdx", registProductDto);
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

    public int checkSellerProdCd(RegistProductDto registProductDto) throws Exception {
        return session.selectOne(namespace+ "checkSellerProdCd", registProductDto);
    }

    public List<RegistProductDto> getProductList(Integer seler_idx) throws Exception {
        return session.selectList(namespace + "getProductList", seler_idx);
    }
}
