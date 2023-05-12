package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface ProdInqryService {
    int getCount(Integer prod_idx) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int remove(Integer idx, Integer prod_idx, Integer user_idx) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int write(ProdInqryDto prodInqryDto) throws Exception;

    List<JoinProdInqryDto> getList(Integer prod_idx) throws Exception;

    List<JoinProdInqryDto> getPage(Map map) throws Exception;

    JoinProdInqryDto read(Integer idx, Integer prod_idx) throws Exception;

    int removeAll(Integer prod_idx) throws Exception;

    int modify(ProdInqryDto prodInqryDto) throws Exception;

}
