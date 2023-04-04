package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProdInqryDto;

import java.util.List;

public interface ProdInqryDao {
    List<ProdInqryDto> selectAll() throws Exception;
}
