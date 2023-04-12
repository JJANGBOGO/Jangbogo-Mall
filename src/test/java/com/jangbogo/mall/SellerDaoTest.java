package com.jangbogo.mall;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SellerDaoTest {

    @Autowired
    SellerDao dao;

    @Test //OK
    public void deleteSeller() throws Exception {

        int result = dao.deleteSeller(8, "jinvicky1008");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void getUserByIdx() throws Exception {
        Seller seller = dao.getSellerByIdx(8);
        log.info("seler" + seller);
        assertTrue(seller != null);
    }

    @Test //ok
    public void updateSeller() throws Exception {
        Seller seller = Seller.builder()
                .idx(8)
                .email("jinvicky1008")
                .cpnm("진이샹달프55")
                .repr_nm("남궁진55")
                .pwd("changed55")
                .mpno("565299").build();
        int result = dao.updateSeller(seller);
        log.info("seler" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void updateSellerDtl() throws Exception {
        SellerDtl dtl = SellerDtl.builder().seler_idx(8).build();
        int result = dao.updateSellerDtl(dtl);
        log.info("result" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void insertSellerDtl() throws Exception {
        SellerDtl dtl = SellerDtl.builder()
                .seler_idx(6)
                .guid_nm("담당자100")
                .guid_email("guid@naver.com")
                .cllr_nm("cllr_진이")
                .cllr_telno("cllr_진이번호")
                .build();
        int result = dao.insertSellerDtl(dtl);
        log.info("result" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void getSellerDtl() throws Exception {
        SellerDtl dtl = dao.getSellerDtl(6);
        log.info("dtl..." + dtl);
        assertTrue(dtl != null);
    }

    @Test
    public void insertSeller() throws Exception {
        Seller seller = Seller.builder()
                .email("seller1@naver.com")
                .cpnm("sellerCompany")
                .repr_nm("대표남궁진")
                .pwd("sellerpwd")
                .mpno("sellerMpno")
                .repr_telno("대표연락처")
                .biz_type(1) //개인
                .brno("787978972424") //사업자번호
                .sle_biz_no("경기_24242") //통신판매
                .bsplc_zpcd("16836")
                .bsplc_base("풍덕천 어딘가")
                .bsplc_dtl("805동")
                .seler_agre_yn("Y") //필수 동의
                .brnd_bnr_upload_path("/img/default_banner.jpeg")
                .brnd_upload_path("/img/default_profile.png")
                .brnd_cn("진이는 취직을 원해요")
                .build();
        int result = dao.insertSeller(seller);
        log.info("result..." + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void updateSellerBrnd() throws Exception {
        Seller seller = Seller.builder()
                .idx(14)
                .email("seller100@naver.com") //하드코딩
                .cpnm("sellerNoMore")
                .brnd_cn("<p><b>브랜드내용수정</b></p>") //<> 테스트
                .brnd_bnr_upload_path("변경된배너.png")
                .brnd_upload_path("바꾼배너.png")
                .build();
        int result = dao.updateSellerBrnd(seller);
        log.info("result...." + result);
        assertTrue(result != 0);
    }


}
