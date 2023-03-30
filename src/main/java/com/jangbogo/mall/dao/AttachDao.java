package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.AttachFileDto;

import java.util.List;

public interface AttachDao {

    List<AttachFileDto> getOldFiles();
}
