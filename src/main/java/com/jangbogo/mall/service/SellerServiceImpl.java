package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl implements SellerService{

    @Autowired
    SellerDao dao;

    @Override
    public int withdrawSeller (Integer idx, String email) throws Exception {
        return dao.deleteSeller(idx, email);
    }

    @Override
    public Seller getSellerByIdx (Integer idx) throws Exception {
        return dao.getSellerByIdx(idx);
    }

    @Override
    public int updateSeller (Seller seller) throws Exception {
        return dao.updateSeller(seller);
    }

    @Override
    public int updateSellerDtl (SellerDtl detail) throws Exception {
        SellerDtl selerDtl = getSellerDtl(detail.getSeler_idx()); //user_idx로 상세정보 탐색
        if (selerDtl == null) return insertSellerDtl(detail); //정보가 없을 경우 새로 insert
        return dao.updateSellerDtl(detail); //수정
    }

    @Override
    public int insertSellerDtl (SellerDtl detail) throws Exception {
        return dao.insertSellerDtl(detail);
    }

    @Override
    public SellerDtl getSellerDtl (Integer seler_idx) throws Exception {
        return dao.getSellerDtl(seler_idx);
    }


}
