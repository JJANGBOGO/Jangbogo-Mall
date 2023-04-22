package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProdInqryDao;
import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ProdInqryServiceImpl implements ProdInqryService {

    @Autowired
    ProdInqryDao prodInqryDao;

    @Override
    public int getCount(Integer prod_idx) throws Exception{
        return prodInqryDao.count(prod_idx);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer idx, Integer prod_idx, Integer user_idx) throws Exception {
        int rowCnt = prodInqryDao.delete(idx, prod_idx, user_idx );

        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(ProdInqryDto prodInqryDto) throws Exception {
        return prodInqryDao.insert(prodInqryDto);
    }

    @Override
    public List<JoinProdInqryDto> getList(Integer prod_idx) throws Exception {
        return prodInqryDao.selectAll(prod_idx);
    }

    @Override
    public List<JoinProdInqryDto> getPage(Map map) throws Exception {
        return prodInqryDao.selectPage(map);
    }

    @Override
    public JoinProdInqryDto read(Integer idx, Integer prod_idx) throws Exception {
        return prodInqryDao.select(idx, prod_idx);
    }

    @Override
    public int removeAll(Integer prod_idx) throws Exception {
        return prodInqryDao.deleteAll(prod_idx);
    }

    @Override
    public int modify(ProdInqryDto prodInqryDto) throws Exception {
        return prodInqryDao.update(prodInqryDto);
    }

}