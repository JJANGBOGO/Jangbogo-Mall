package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductFileDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDetailDaoImpl implements ProductDetailDao {
    @Autowired
    SqlSession session;

    String namespace = "com.jangbogo.mall.dao.ProductDetailMapper.";

    @Override
    public ProductDetailDto selectProd(Integer prod_idx) throws Exception {
        return session.selectOne(namespace + "selectProd", prod_idx);
    }

    public Integer findDlvry(Integer cate_idx) throws Exception {
        return session.selectOne(namespace + "findDlvry", cate_idx);
    }

    public ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception {
        return session.selectOne(namespace + "dlvryInfo", dlvry_method);
    }

    public ProductDetailDto selectBrand(Integer prod_idx) throws Exception {
        return session.selectOne(namespace + "selectBrand", prod_idx);
    }

    public List<ProductFileDto> selectProdFile(Integer prod_idx) throws Exception {
        return session.selectList(namespace + "selectProdFile", prod_idx);
    }

}
