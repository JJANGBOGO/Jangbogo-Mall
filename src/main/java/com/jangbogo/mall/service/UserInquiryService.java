package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.UserInquiryDto;
import com.jangbogo.mall.domain.UserInquiryListDto;

import java.util.List;

public interface UserInquiryService {
    Integer insertInquiry(UserInquiryDto userInquiryDto) throws Exception;
    List<UserInquiryListDto> getList(Integer user_idx) throws Exception;
}
