package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDtl;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.ProductFile;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.ProductMapper.";

    @Override
    public List<ProductDto> getListBySeller(Integer user_idx) throws Exception {
        return session.selectList(nameSpace + "getListBySeller", user_idx);
    }

    @Override
    public List<ProductDto> getListByCategory(String category) throws Exception {
        return session.selectList(nameSpace + "getListByCategory", category);
    }

    @Override
    public List<ProductDto> searchProductList(String category) throws Exception {
        return session.selectList(nameSpace + "searchProductList", category);
    }

    @Override
    public int stopSale(Integer idx) throws Exception {
        return session.update(nameSpace + "stopSale", idx);
    }

}
