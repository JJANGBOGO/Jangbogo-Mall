package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDtl;
import com.jangbogo.mall.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao{

    @Autowired
    SqlSession session;

    private static String nameSpace = "com.jangbogo.mall.dao.ProductMapper.";

    @Override
    public List<ProductDto> getListBySeller (Integer user_idx) throws Exception {
        return session.selectList(nameSpace + "getListBySeller", user_idx);
    }

    @Override
    public int insertProduct (ProductDto productDto) throws Exception{
        return session.insert(nameSpace + "insertProduct", productDto);
    }

    @Override
    public int insertProductDtl (ProductDtl productDtl) throws Exception {
        return session.insert(nameSpace + "insertProductDtl", productDtl);
    }

}
