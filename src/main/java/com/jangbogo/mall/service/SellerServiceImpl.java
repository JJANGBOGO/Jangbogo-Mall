package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.domain.Email;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
public class SellerServiceImpl implements SellerService {

    @Autowired
    SellerDao dao;

    @Autowired
    EmailSender emailSender;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    Utils utils;

    @Override
    public int withdrawSeller(Integer idx, String email) throws Exception {
        return dao.deleteSeller(idx, email);
    }

    @Override
    public Seller getSellerByIdx(Integer idx) throws Exception {
        return dao.getSellerByIdx(idx);
    }

    @Override
    @Transactional
    public int updateSeller(Seller seller, SellerDtl sellerDtl) throws Exception {
        final int SUCCESS = 1;
        final int FAILED = 0;

        if (seller.getPwd() == "") { //새 비밀번호가 없는 경우
            Seller prevSeller = dao.getSellerByEmail(seller.getEmail()); //기존 정보 조회
            seller.setPwd(prevSeller.getPwd()); //기존 비밀번호를 그대로 set

        } else {//새 비밀번호 존재
            //비번변경날짜 최신화
            updatePwdUptTm(seller.getIdx(), seller.getEmail());
            //비번 인코딩
            seller.setPwd(passwordEncoder.encode(seller.getPwd()));
        }

        return (dao.updateSeller(seller) != 0 && updateSellerDtl(sellerDtl) != 0) ? SUCCESS : FAILED;
    }

    public int updateSellerDtl(SellerDtl detail) throws Exception {
        SellerDtl selerDtl = getSellerDtl(detail.getSeler_idx()); //user_idx로 상세정보 탐색
        if (selerDtl == null) return insertSellerDtl(detail); //정보가 없을 경우 새로 insert
        return dao.updateSellerDtl(detail); //수정
    }

    @Override
    public int insertSellerDtl(SellerDtl detail) throws Exception {
        return dao.insertSellerDtl(detail);
    }

    @Override
    public SellerDtl getSellerDtl(Integer seler_idx) throws Exception {
        return dao.getSellerDtl(seler_idx);
    }

    @Override
    public int registerSeller(Seller seller) throws Exception {
        seller.setPwd(passwordEncoder.encode(seller.getPwd()));
        return dao.insertSeller(seller);
    }

    @Override
    public int updateSellerBrnd(Seller seller) throws Exception {
        return dao.updateSellerBrnd(seller);
    }

    @Override
    public boolean isCpnmDuplicated(String cpnm) throws Exception {
        return dao.getSellerByCpnm(cpnm) != null; //중복 시 true 반환
    }

    @Override
    public boolean isEmailDuplicated(String email) throws Exception {
        return dao.getSellerByEmail(email) != null;
    }

    @Override
    public String findSellerEmail(String cpnm, String pwd) throws Exception {
        Seller seller = dao.getSellerByCpnm(cpnm); //브랜드명으로 판매자 조회

        if (seller == null || !passwordEncoder.matches(pwd, seller.getPwd())) return null; //미존재 판매자
        if (seller.getState_cd() == 3) return null; //탈퇴판매자 제외
        return seller.getEmail();
    }

    @Override
    public boolean isSellerPresent(String cpnm, String email) throws Exception {
        Seller seller = dao.getSellerByCpnm(cpnm);
        return seller != null && Objects.equals(email, seller.getEmail());
    }

    @Override
    public int sendPwdEmail(String cpnm, String toEmail) throws Exception {
        String tmpPwd = utils.createRandomStr();
        String encodedPwd = passwordEncoder.encode(tmpPwd);

        if (dao.updatePwd(encodedPwd, cpnm, toEmail) != 0) { //비번 업데이트 성공
            Email email = Email.builder()
                    .fromEmail("jinvicky17@gmail.com") //장보고 이메일
                    .toEmail(toEmail)
                    .title("임시 비밀번호 전달")
                    .content("회원님의 임시 비밀번호는 " + tmpPwd + " 입니다.")
                    .build();
            emailSender.sendMail(email);
            return 1; //성공
        }
        return 0; //실패.
    }

    @Override
    public int updatePwdUptTm(Integer idx, String email) throws Exception {
        return dao.updatePwdUptTm(idx, email);
    }


}
