package com.jangbogo.mall.dao;

import java.util.List;

public interface AuthDao {

    List<String> getAuthList(int auth_idx) throws Exception;

}
