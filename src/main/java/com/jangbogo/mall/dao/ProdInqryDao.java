package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProdInqryDto;

import java.util.List;
import java.util.Map;

public interface ProdInqryDao {
    List<ProdInqryDto> selectAll() throws Exception;

    int count() throws Exception;

    ProdInqryDto select(Integer idx) throws Exception;

    List<ProdInqryDto> selectPage(Map map) throws Exception;

    int insert(ProdInqryDto prodInqryDto) throws Exception;

    int delete(Integer idx, Integer user_idx) throws Exception;

    int deleteAll() throws Exception;

    int update(ProdInqryDto prodInqryDto) throws Exception;

    ProdInqryDto updateNickName(Integer user_idx) throws Exception;
}
