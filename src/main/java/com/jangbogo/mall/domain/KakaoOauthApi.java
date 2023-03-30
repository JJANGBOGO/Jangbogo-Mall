package com.jangbogo.mall.domain;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoOauthApi extends DefaultApi20 {

    //protected는 추상 클래스를 구현할 때 권고됨.
    protected KakaoOauthApi () {}

    private static class InstanceHolder {
        private static final KakaoOauthApi INSTANCE = new KakaoOauthApi();
    }

    public static KakaoOauthApi instance() {
        return InstanceHolder.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://kauth.kakao.com/oauth/token";
    }

    @Override
    public String getAuthorizationBaseUrl () {
        return "https://kauth.kakao.com/oauth/authorize";
    }
}
