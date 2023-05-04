package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.RegistProductDao;
import com.jangbogo.mall.domain.ProductFileDto;
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
    public int insertProduct(RegistProductDto registProductDto) throws Exception { //상품등록
        return registProductDao.insertProduct(registProductDto);
    }

    @Override
    public int insertProductDetail(RegistProductDto registProductDto) throws Exception {
        return registProductDao.insertProductDetail(registProductDto);
    }

    @Override
    public int insertProductFile(List<ProductFileDto> files, Integer prod_idx) throws Exception { //상품첨부등록
        for (ProductFileDto item : files) {
            item.setProd_idx(prod_idx);
            registProductDao.insertProductFile(item);
        }
        return 1;
    }

    public int checkSellerProdCd(RegistProductDto registProductDto) throws Exception {
        return registProductDao.checkSellerProdCd(registProductDto);
    }

    public List<RegistProductDto> getProductList(Integer seler_idx) throws Exception {
        return registProductDao.getProductList(seler_idx);
    }
}
