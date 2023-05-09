package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.UserInquiryDao;
import com.jangbogo.mall.domain.UserInquiryDto;
import com.jangbogo.mall.domain.UserInquiryListDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Slf4j
public class UserInquiryServiceImpl implements UserInquiryService {


    @Autowired
    UserInquiryDao userInquiryDao;

    @Override
    public Integer insertInquiry(UserInquiryDto userInquiryDto) throws Exception {
        return userInquiryDao.insertInquiry(userInquiryDto);
    }

    @Override
    public List<UserInquiryListDto> getList(Integer user_idx) throws Exception {
        return userInquiryDao.getList(user_idx);
    }



}
