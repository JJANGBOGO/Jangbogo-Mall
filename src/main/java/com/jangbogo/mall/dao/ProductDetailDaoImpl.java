package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
