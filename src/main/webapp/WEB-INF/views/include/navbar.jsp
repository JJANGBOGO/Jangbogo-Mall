<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="loginService" value="${sessionScope.loginService}"/>
<c:set var="nickname" value="${sessionScope.nickName}"/>
<nav>
    <div class="sticky-wrap">
        <div class="top-navigation">
            <div class="base-margin">
                <ul>
                    <s:authorize access="isAnonymous()">
                        <li>
                            <a href="/user/login">로그인</a>
                        </li>
                        <li>
                            <a href="/register/intro">회원가입</a>
                        </li>
                    </s:authorize>
                    <s:authorize access="isAuthenticated()">
                        <li>
                            <a>${nickname}님</a>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${loginService == 'kakao'}">
                                    <%-- 카카오 로그아웃--%>
                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=bb092eaed861b067f81667b75af60fbb&logout_redirect_uri=http://localhost:8080/social/kakao_logout">
                                        로그아웃
                                    </a>
                                </c:when>
                                <c:when test="${loginService == 'naver'}">
                                    <%-- 네이버 로그아웃 TODO:: 직접 구현--%>
                                    <a href="/">로그아웃</a>
                                </c:when>
                                <c:otherwise>
                                    <%-- 일반 로그아웃--%>
                                    <a href="/security_logout">로그아웃</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </s:authorize>
                </ul>
            </div>
        </div>
        <div class="header-wrap">
            <div class="header-inner">
                <div class="logo-container">
                    <h1 class="header-logo"><a href="/">Jangbogo</a></h1>
                </div>
                <div class="search-box">
                    <form action="">
                        <input type="text" placeholder="검색어를 입력해주세요."/>
                        <button class="search-button" type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
                <div class="icon-links">
                    <a href="/cart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <div class="icon-desc">장바구니</div>
                    </a>
                    <a href="/mypage/wishlist">
                        <i class="fa-regular fa-heart"></i>
                        <div class="icon-desc">위시리스트</div>
                    </a>
<%--                    <i class="fa-regular fa-heart"></i>--%>
                    <a href="/user/info">
                        <i class="fa-regular fa-user"></i>
                        <div class="icon-desc">마이페이지</div>
                    </a>
                    <a href="/seller/info">
                        <i class="fa-regular fa-user"></i>
                        <div class="icon-desc">마이셀러</div>
                    </a>
                </div>
            </div>
        </div>
        <!-- end of navbar-1-->
        <div class="navbar-2">
            <ul>
                <li>
                    <a class="active" href="">신상품</a>
                </li>
                <li>
                    <a href="">카테고리</a>
                </li>
                <li>
                    <a href="">알뜰쇼핑</a>
                </li>
                <li>
                    <a href="">특가/혜택</a>
                </li>
                <li></li>
                <li>
                    <a href="">밀키트</a>
                </li>
                <li>
                    <a href="">베스트</a>
                </li>
                <li>
                    <a href="">이벤트</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
