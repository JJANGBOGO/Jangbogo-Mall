package com.jangbogo.mall.security.user;


import com.jangbogo.mall.domain.UserDetailsDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service("loginAuthenticationProvider")
public class LoginAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    UserDetailsService userLoginService;


    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate (Authentication authentication) throws AuthenticationException {

        //디비에서 유저 레코드를 DTO 객체로 가져오기.
        String email = authentication.getName();
        String pwd = (String) authentication.getCredentials();
        UserDetailsDto userDetailsDto = (UserDetailsDto) userLoginService.loadUserByUsername(email);

        //loginFailureHandler 오류 던질 때
        if(userDetailsDto == null || !email.equals(userDetailsDto.getUsername())|| !passwordEncoder.matches(pwd, userDetailsDto.getPassword())) {
            throw new BadCredentialsException(email); // 아이디랑 비번이 불일치.
        } else if (!userDetailsDto.isEnabled()) {
            throw new DisabledException(email); //계정 비활성화
        } else if (!userDetailsDto.isAccountNonLocked()) {
            throw new LockedException(email); //계정이 잠김
        } else if (!userDetailsDto.isAccountNonExpired()) {
            throw new AccountExpiredException(email);  //계정이 만료됨.
        } else if (!userDetailsDto.isCredentialsNonExpired()) {
            throw new CredentialsExpiredException(email);  // 비밀번호가 만료됨.
        }

        //로그인을 성공하면
        userDetailsDto.setPassword(null);

        Authentication newAuth = new UsernamePasswordAuthenticationToken(email, null, userDetailsDto.getAuthorities());
        return newAuth;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
