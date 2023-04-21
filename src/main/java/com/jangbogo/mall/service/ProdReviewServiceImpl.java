package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProdReviewDao;
import com.jangbogo.mall.domain.ProdReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdReviewServiceImpl implements ProdReviewService {

    @Autowired
    ProdReviewDao prodReviewDao;

    @Override
    public List<ProdReviewDto> getList(Integer prod_idx) throws Exception{
        return prodReviewDao.selectAll(prod_idx);
    }

    @Override
    public Integer update(ProdReviewDto prodReviewDto) throws Exception{
        return prodReviewDao.update(prodReviewDto);
    }
    @Override
    public Integer insert(ProdReviewDto prodReviewDto) throws Exception{
        return prodReviewDao.insert(prodReviewDto);
    }




}