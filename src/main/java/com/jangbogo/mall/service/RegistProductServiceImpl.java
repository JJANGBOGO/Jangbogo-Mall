package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.RegistProductDao;
import com.jangbogo.mall.domain.RegistProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistProductServiceImpl implements RegistProductService {
    @Autowired
    RegistProductDao registProductDao;

    @Override
    public int getProdIdx(Integer prod_cd_val) throws Exception {
        return registProductDao.getProdIdx(prod_cd_val);
    }

    @Override
    public int insertProduct(RegistProductDto registProductDto) throws Exception {
        return registProductDao.insertProduct(registProductDto);
    }

    @Override
    public int insertProductDetail(RegistProductDto registProductDto) throws Exception {
        return registProductDao.insertProductDetail(registProductDto);
    }

    @Override
    public int insertProductFile(RegistProductDto registProductDto) throws Exception {
        return registProductDao.insertProductFile(registProductDto);
    }
}
