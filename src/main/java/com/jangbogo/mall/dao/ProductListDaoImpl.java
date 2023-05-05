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

    public List<ProductListDto> ffloorSelect(String f_cate_idx) throws Exception {
        return session.selectList(namespace + "ffloorSelect", f_cate_idx);
    }

    public List<ProductListDto> allffloorSelect() throws Exception {
        return session.selectList(namespace + "allffloorSelect");
    }

    public Integer reviewNumSelect(Integer prod_idx) throws Exception {
        return session.selectOne(namespace + "reviewNumSelect", prod_idx);
    }

    public ProductListDto getModalInfo(ProductListDto productListDto) throws Exception {
        return session.selectOne(namespace + "getModalInfo", productListDto);
    }

    @Override
    public List<ProductListDto> allProductInfoSelect() throws Exception {
        return session.selectList(namespace + "allProductInfoSelect");
    }

}
