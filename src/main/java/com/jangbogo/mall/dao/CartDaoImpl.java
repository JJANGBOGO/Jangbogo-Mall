package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDaoImpl implements CartDao {
    // SqlSession 자동 주입
    @Autowired
    SqlSession session;

    private static String namespace="com.jangbogo.mall.dao.CartMapper.";                                                // 대소문자 구분X

    // 메서드명 : selectAll
    // 기   능 : 회원번호가 #{user_idx}에 해당하는 회원의 장바구니 목록을 조회하는 메서드
    // 반환타입 : List<CartDto>
    // 매개변수 : Integer user_idx
    @Override
    public List<CartDto> selectAll(Integer user_idx) throws Exception {
        return session.selectList(namespace + "selectAll", user_idx);                                                // SqlSession의 selectList메서드 호출(namespace, 아이디명, 회원번호 인자로 지정)
    }

    // 메서드명 : delete
    // 기   능 : 장바구니 상품을 삭제하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
    @Override
    public int delete(Integer prod_idx, Integer user_idx) throws Exception {
        Map map = new HashMap();                                                                                        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
        map.put("prod_idx", prod_idx);                                                                                  // 2. HashMap에 prod_idx를 k/v로 저장
        map.put("user_idx", user_idx);                                                                                  // 3. HashMap에 user_idx를 k/v로 저장
        return session.delete(namespace + "delete", map);                                                            // 4. SqlSession의 delete메서드 호출(namespace, 아이디명, map 인자로 지정)
    }

    // 메서드명 : addCount
    // 기   능 : 개수조절버튼 중 '+' 버튼을 눌렀을 때, 장바구니상품 개수를 #{prod_cnt} + 1 처리하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx
//    @Override
//    public int addCount(Integer prod_idx, Integer user_idx) throws Exception {
//        Map map = new HashMap();                                                                                        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
//        map.put("prod_idx", prod_idx);                                                                                  // 2. HashMap에 prod_idx를 k/v로 저장
//        map.put("user_idx", user_idx);                                                                                  // 3. HashMap에 user_idx를 k/v로 저장
//        return session.update(namespace + "addCount", map);                                                          // 4. SqlSession의 update메서드 호출(namespace, 아이디명, map 인자로 지정)
//    }

    // 메서드명 : updateCount
    // 기   능 : 개수조절버튼을 눌렀을 때, 장바구니상품 개수를 수정하는 메서드
    // 반환타입 : int
    // 매개변수 : Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt
    @Override
    public int updateCount(Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt) throws Exception {
        Map map = new HashMap();                                                                                        // 1. 매개변수로 받은 두 개의 값을 저장할 객체 저장소 map 선언 및 HashMap 할당
        map.put("prod_idx", prod_idx);                                                                                  // 2. HashMap에 prod_idx를 k/v로 저장
        map.put("user_idx", user_idx);                                                                                  // 3. HashMap에 user_idx를 k/v로 저장
        map.put("prod_cnt", prod_cnt);                                                                                  // 4. HashMap에 prod_cnt를 k/v로 저장
        map.put("upt_cnt", upt_cnt);                                                                                    // 5. HashMap에 prod_cnt를 k/v로 저장
        return session.update(namespace + "updateCount", map);                                                       // 6. SqlSession의 update메서드 호출(namespace, 아이디명, map 인자로 지정)
    }

    @Override
    public int removeAll(Integer user_idx) throws Exception {
        return session.update(namespace + "deleteAll", user_idx);                                                    // SqlSession의 update메서드 호출(namespace, 아이디명, 회원번호 인자로 지정)
    }
}
