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
    public Integer getProdIdx(RegistProductDto registProductDto) throws Exception {
        return registProductDao.getProdIdx(registProductDto);
    }

    @Override
    public Integer insertProduct(RegistProductDto registProductDto) throws Exception { //상품등록
        return registProductDao.insertProduct(registProductDto);
    }

    public Integer updateProduct(RegistProductDto registProductDto) throws Exception {
        return registProductDao.updateProduct(registProductDto);
    }

    @Override
    public Integer insertProductDetail(RegistProductDto registProductDto) throws Exception {
        return registProductDao.insertProductDetail(registProductDto);
    }

    public Integer updateProductDetail(RegistProductDto registProductDto) throws Exception {
        return registProductDao.updateProductDetail(registProductDto);
    }

    @Override
    public Integer insertProductFile(List<ProductFileDto> files, Integer prod_idx) throws Exception { //상품첨부등록
        for (ProductFileDto item : files) {
            item.setProd_idx(prod_idx);
            registProductDao.insertProductFile(item);
        }
        return 1;
    }

    public Integer updateProductFile(List<ProductFileDto> files, Integer prod_idx) throws Exception {
        for (ProductFileDto item : files) {
            item.setProd_idx(prod_idx);
            registProductDao.updateProductFile(item);
        }
        return 1;
    }

    public Integer deleteProduct(RegistProductDto registProductDto) throws Exception {
        return registProductDao.deleteProduct(registProductDto);
    }

    public Integer checkSellerProdCd(RegistProductDto registProductDto) throws Exception {
        return registProductDao.checkSellerProdCd(registProductDto);
    }

    public Integer checkSelDate(RegistProductDto registProductDto) throws Exception {
        return registProductDao.checkSelDate(registProductDto);
    }

    public List<RegistProductDto> getProductList(Integer seler_idx) throws Exception {
        return registProductDao.getProductList(seler_idx);
    }

    public RegistProductDto selectProdInfo(Integer prod_idx) throws Exception {
        return registProductDao.selectProdInfo(prod_idx);
    }
}
