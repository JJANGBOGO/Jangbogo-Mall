<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/02/26
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav>
    <div class="sidebar">
        <div class="header">판매자 장보고</div>
        <ul>
            <li>
                <a href="/seller/modify/brnd" class="<c:if test='${mySellerUrl eq "/seller/modify/brnd"}'>active</c:if> ">
                    브랜드 수정
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/seller/info" class="<c:if test='${mySellerUrl eq "/seller/info" || mySellerUrl eq "/seller/modify"}'>active</c:if> ">
                    판매자 정보 수정
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/myseller/followers" class="<c:if test='${mySellerUrl eq "/myseller/followers"}'>active</c:if> ">
                    팔로워 리스트
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