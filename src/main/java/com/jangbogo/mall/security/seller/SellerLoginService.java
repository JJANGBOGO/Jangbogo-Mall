package com.jangbogo.mall.security.seller;


import com.jangbogo.mall.dao.AuthDao;
import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.UserDetailsDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service("sellerLoginService")
public class SellerLoginService implements UserDetailsService {

    @Autowired
    SellerDao sellerDao;

    @Autowired
    AuthDao authDao;

    @Override
    public UserDetails loadUserByUsername(String username) {

        ArrayList<String> authList = new ArrayList<String>();

        try {
            UserDetailsDto userDetailsDto = sellerDao.getSellerDetailsDto(username);

            if (userDetailsDto == null) return null;
            else {
                Seller seller = sellerDao.getSellerByEmail(username);
                authList = (ArrayList<String>) authDao.getAuthList(seller.getAuth_idx());
                userDetailsDto.setAuthority(authList);
                userDetailsDto.setEnabled(seller.getState_cd() == 3 ? false: true);
                // 탈퇴가 아니라면 true
            }
            return userDetailsDto;

        } catch (Exception e) {
            e.printStackTrace();
            throw new UsernameNotFoundException(username);
        }
    }
}
