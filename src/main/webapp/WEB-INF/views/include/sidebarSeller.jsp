<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/02/26
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
    <div class="sidebar">
        <div class="header">판매자 장보고</div>
        <ul>
            <li>
                <a href="/myseller/modify/brnd" class="<c:if test='${mySellerUrl eq "/myseller/modify/brnd"}'>active</c:if> ">
                    브랜드 수정
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/myseller/modify/seller" class="<c:if test='${mySellerUrl eq "/myseller/modify/seller"}'>active</c:if> ">
                    판매자 정보 수정
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/myseller/modify/seller" class="<c:if test='${mySellerUrl eq "/myseller/modify/seller"}'>active</c:if> ">
                    팔로워 리스트
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/myseller/subscription" class="<c:if test='${mySellerUrl eq "/myseller/subscription"}'>active</c:if> ">
                    정산 신청
                    <span> &gt; </span>
                </a>
            </li>
        </ul>
        <a href="/mypage/inquiry/list" class="mypage-inquiry">
            <div>
                <span class="ask-help">도움이 필요하신가요?</span>
                <span>1:1 문의하기</span>
            </div>
        </a>
    </div>
</nav>