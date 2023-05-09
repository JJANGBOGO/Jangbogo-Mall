package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.UserInquiryDto;

public interface UserInquiryDao {
    Integer insertInquiry(UserInquiryDto userInquiryDto) throws Exception;
}
