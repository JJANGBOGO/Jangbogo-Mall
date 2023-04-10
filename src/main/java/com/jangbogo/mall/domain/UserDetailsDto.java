package com.jangbogo.mall.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.Collection;

public class UserDetailsDto implements UserDetails {

    private String ID;

    private String PASSWORD;
    private String EMAIL;

    private boolean ENABLED;
    private ArrayList<GrantedAuthority> authority;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authority;
    }

    public void setAuthority(ArrayList<String> authList) {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        for(int i=0;i<authList.size();i++) {
            auth.add(new SimpleGrantedAuthority(authList.get(i)));
        }
        this.authority=auth;
    }

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return PASSWORD;
    }

    public void setPassword(String password) {
        PASSWORD = password;
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return ID;
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return ENABLED;
    }
}
