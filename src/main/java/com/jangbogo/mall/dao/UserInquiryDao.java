package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.UserInquiryDto;
import com.jangbogo.mall.domain.UserInquiryListDto;

import java.util.List;

public interface UserInquiryDao {
    Integer insertInquiry(UserInquiryDto userInquiryDto) throws Exception;
    List<UserInquiryListDto> getList(Integer user_idx) throws Exception;
}
