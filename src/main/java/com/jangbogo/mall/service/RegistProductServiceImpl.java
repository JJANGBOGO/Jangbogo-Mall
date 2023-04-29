package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.RegistProductDao;
import com.jangbogo.mall.domain.RegistProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistProductServiceImpl implements RegistProductService {
    @Autowired
    RegistProductDao registProductDao;

    @Override
    public int getProdIdx(RegistProductDto registProductDto) throws Exception {
        return registProductDao.getProdIdx(registProductDto);
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

    public int checkSellerProdCd(RegistProductDto registProductDto) throws Exception {
        return registProductDao.checkSellerProdCd(registProductDto);
    }

    public List<RegistProductDto> getProductList(Integer seler_idx) throws Exception {
        return registProductDao.getProductList(seler_idx);
    }
}
