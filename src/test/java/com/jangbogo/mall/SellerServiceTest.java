package com.jangbogo.mall;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.service.SellerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertTrue;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SellerServiceTest {

    @Autowired
    SellerService service;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Test //OK
    public void withdrawSeller() throws Exception {
        int result = service.withdrawSeller(8, "jinvicky1008");
        log.info("result=" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void getSellerByIdx() throws Exception {
        Seller seller = service.getSellerByIdx(8);
        log.info("seller=" + seller);
        assertTrue(seller != null);
    }

    @Test //ok
    public void updateSeller() throws Exception {
        Seller seller = Seller.builder()
                .idx(8)
                .email("jinvicky1008")
                .cpnm("진이사과나무")
                .repr_nm("포도조아")
                .pwd("rnpqus")
                .mpno("8989").build();
        int result = service.updateSeller(seller);
        log.info("seler" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void insertSellerDtl() throws Exception {
        SellerDtl dtl = SellerDtl.builder()
                .seler_idx(6)
                .guid_nm("담당자555")
                .guid_email("guid555@naver.com")
                .cllr_nm("cllr_진이55")
                .cllr_telno("cllr_진이번호55")
                .build();
        int result = service.insertSellerDtl(dtl);
        log.info("result" + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void updateSellerDtl() throws Exception {
        SellerDtl dtl = SellerDtl.builder()
                .seler_idx(6)
                .guid_nm("바꿔주세요")
                .guid_email("change@naver.com")
                .cllr_nm("change_cllr")
                .cllr_telno("change_11")
                .build();

        int result = service.updateSellerDtl(dtl);
        log.info("result" + result);
        assertTrue(result != 0);
    }

    @Test
    public void insertSeller() throws Exception {
        Seller seller = Seller.builder()
                .email("seller100@naver.com")
                .cpnm("sellerCompany100")
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
                .brnd_bnr_upload_path("2023%2F04%2F12%2Fs_193e04e3-72d9-4f1e-9807-eea281c0b2ce_26_%E1%84%86%E1%85%B5%E1%84%8B%E1%85%A9.png")
                .brnd_upload_path("/img/default_profile.png")
                .brnd_cn("진이는 취직을 원해요")
                .build();
        int result = service.registerSeller(seller);
        log.info("result...." + result);
        assertTrue(result != 0);
    }

    @Test
    public void updateSellerBrnd () throws Exception {
        Seller seller = Seller.builder()
                .idx(6)
                .email("jinvicky1007")
                .cpnm("service테스트")
                .brnd_cn("서비스테스트")
                .brnd_bnr_upload_path("default_banner.jpeg")
                .brnd_upload_path("default.png")
                .build();
        int result = service.updateSellerBrnd(seller);
        log.info("result......." + result);
        assertTrue(result != 0);
    }

    @Test //ok
    public void duplicateCpnmChk () throws Exception {
        boolean isDuplicated = service.isCpnmDuplicated("진이사과나무2");
        log.info("duplicate...." + isDuplicated);
        assertTrue(isDuplicated == true);
    }

    @Test //ok
    public void isEmailDuplicated () throws Exception {
        boolean isDuplicated = service.isEmailDuplicated("seller100@naver.com");
        log.info("duplicate...." + isDuplicated);
        assertTrue(isDuplicated == true);
    }

    @Test
    public void pwdEncoding() throws Exception {
        String pwd = passwordEncoder.encode("test");
        //$2a$10$H2fvSscBWnbGI0UXRwEaNeW55Cg/TMZdlY839dowTTMrKZ0hhAz0q
        log.info("pwd..." +pwd);
    }


}
