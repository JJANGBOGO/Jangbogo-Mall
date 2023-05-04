package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductListDaoImpl implements ProductListDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProductListMapper.";

    @Override
    public List<ProductListDto> allProductInfoSelect(ProductListDto productListDto) throws Exception {
        return session.selectList(namespace + "allProductInfoSelect", productListDto);
    }

}
