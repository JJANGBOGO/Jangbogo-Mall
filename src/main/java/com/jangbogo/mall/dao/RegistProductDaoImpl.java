package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductFileDto;
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
    public Integer getProdIdx(RegistProductDto registProductDto) throws Exception {
        return session.selectOne(namespace + "getProdIdx", registProductDto);
    }

    @Override
    public Integer insertProduct(RegistProductDto registProductDto) throws Exception {
        return session.insert(namespace + "insertProduct", registProductDto);
    }

    @Override
    public Integer insertProductDetail(RegistProductDto registProductDto) throws Exception {
        return session.insert(namespace + "insertProductDetail", registProductDto);
    }

    @Override
    public Integer insertProductFile(ProductFileDto file) throws Exception{
        return session.insert(namespace + "insertProductFile", file);
    }

    public Integer checkSellerProdCd(RegistProductDto registProductDto) throws Exception {
        return session.selectOne(namespace+ "checkSellerProdCd", registProductDto);
    }

    public List<RegistProductDto> getProductList(Integer seler_idx) throws Exception {
        return session.selectList(namespace + "getProductList", seler_idx);
    }
}
