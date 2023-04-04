package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDao {

    @Autowired
    SqlSession session;

    private static String namespace="com.jangbogo.mall.dao.CartMapper."; // 대소문자 구분X

    public List<CartDto> selectAll() throws Exception {
        // SqlSession의 selectList메서드 호출(namespace, 아이디명 인자로 지정)
        return session.selectList(namespace + "selectAll");
    }

    public int delete(Integer prod_idx, Integer user_idx) throws Exception {
        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
        Map map = new HashMap();
        // 2. HashMap에 prod_idx를 k/v로 저장
        map.put("prod_idx", prod_idx);
        // 3. HashMap에 user_idx를 k/v로 저장
        map.put("user_idx", user_idx);
        // 4. SqlSession의 delete메서드 호출(namespace, 아이디명, map 인자로 지정)
        return session.delete(namespace + "delete", map);
    }

    public int addCount(Integer prod_idx, Integer user_idx) throws Exception {
        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
        Map map = new HashMap();
        // 2. HashMap에 prod_idx를 k/v로 저장
        map.put("prod_idx", prod_idx);
        // 3. HashMap에 user_idx를 k/v로 저장
        map.put("user_idx", user_idx);
        // 4. SqlSession의 update메서드 호출(namespace, 아이디명, map 인자로 지정)
        return session.update(namespace + "addCount", map);
    }

    public int subtractCount(Integer prod_idx, Integer user_idx) throws Exception {
        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
        Map map = new HashMap();
        // 2. HashMap에 prod_idx를 k/v로 저장
        map.put("prod_idx", prod_idx);
        // 3. HashMap에 user_idx를 k/v로 저장
        map.put("user_idx", user_idx);
        // 4. SqlSession의 update메서드 호출(namespace, 아이디명, map 인자로 지정)
        return session.update(namespace + "subtractCount", map);
    }
}
