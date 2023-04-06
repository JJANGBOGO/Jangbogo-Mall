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
        <div class="header">마이장보고</div>
        <ul>
            <li>
                <a href="">
                    주문 내역
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="">
                    선물 내역
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="">
                    찜한 상품
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/mypage/address" class="<c:if test='${mypageUrl eq "/mypage/address"}'>active</c:if> ">
<%--                    <div class=" <c:if test='${addClass eq 'Y'}'>redBackground</c:if> ">--%>
                    배송지 관리
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="/">
                    상품 후기
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href=""
                >적립금
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a href="">
                    쿠폰
                    <span> &gt; </span>
                </a>
            </li>
            <li>
                <a
                        href="/mypage/info"
                >개인정보 수정
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