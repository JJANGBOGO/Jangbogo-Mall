package com.jangbogo.mall.security.user;



import com.jangbogo.mall.dao.AuthDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.domain.UserDetailsDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service("userLoginService")
public class UserLoginService implements UserDetailsService {

    @Autowired
    UserDao userDao;

    @Autowired
    AuthDao authDao;

    @Override
    public UserDetails loadUserByUsername(String username) {

        ArrayList<String> authList = new ArrayList<String>();

        try {
            UserDetailsDto userDetailsDto = userDao.getUserDetailsDto(username);

            if (userDetailsDto == null) return null;
            else {
                User user = userDao.getUserByEmail(username);
                authList = (ArrayList<String>) authDao.getAuthList(user.getAuth_idx());
                userDetailsDto.setAuthority(authList);
                userDetailsDto.setEnabled(user.getState_cd() == 3 ? false: true);
                // 탈퇴가 아니라면 true
            }
            return userDetailsDto;

        } catch (Exception e) {
            e.printStackTrace();
            throw new UsernameNotFoundException(username);
        }
    }
}
