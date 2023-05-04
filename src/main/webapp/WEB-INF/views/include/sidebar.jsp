<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav>
    <div class="sidebar">
        <div class="header">마이장보고</div>
        <ul>
            <li>
                <a href="/mypage/order/list" class="<c:if test='${mypageUrl eq "/mypage/order/list" || mypageUrl eq "/mypage/order/list/{ord_idx}"}'>active</c:if> ">
                    주문 내역
                </a>
            </li>
            <li>
                <a href="/mypage/wishlist" class="<c:if test='${mypageUrl eq "/mypage/wishlist"}'>active</c:if> ">
                    위시리스트
                </a>
            </li>
            <li>
                <a href="/mypage/address/list" class="<c:if test='${mypageUrl eq "/mypage/address/list"}'>active</c:if> ">
                    배송지 관리
                </a>
            </li>
            <li>
                <a href="/user/info"
                   class="<c:if test='${mypageUrl eq "/user/info" || mypageUrl eq "/user/modify"}'>active</c:if> ">
                    개인정보 수정

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