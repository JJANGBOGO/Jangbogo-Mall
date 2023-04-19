package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryDto;

import java.util.List;
import java.util.Map;

public interface ProdInqryDao {
    // 전체 게시물 보여주기
    List<JoinProdInqryDto> selectAll(Integer prod_idx) throws Exception;

    int count() throws Exception;

    // 게시물 한 개 보여주기
    JoinProdInqryDto select(Integer idx) throws Exception;

    // 게시물 페이지 단위로 보여주기
    List<JoinProdInqryDto> selectPage(Map map) throws Exception;
    String selectNickName(Integer user_idx) throws Exception;
    int insert(ProdInqryDto prodInqryDto) throws Exception;

    int delete(Integer idx, Integer prod_idx, Integer user_idx) throws Exception;

    int deleteAll(Integer prod_idx) throws Exception;

    int update(ProdInqryDto prodInqryDto) throws Exception;
}
