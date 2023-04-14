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
        <div class="header">마이셀러</div>
        <ul>
            <li>
                <a href="/seller/read/brnd" class="<c:if test='${mySellerUrl eq "/seller/read/brnd" || mySellerUrl eq "/seller/modify/brnd"}'>active</c:if> ">
                    내 브랜드
                </a>
            </li>
            <li>
                <a href="/seller/info" class="<c:if test='${mySellerUrl eq "/seller/info" || mySellerUrl eq "/seller/modify"}'>active</c:if> ">
                    내 상품들
                </a>
            </li>
            <li>
                <a href="/seller/info" class="<c:if test='${mySellerUrl eq "/seller/info" || mySellerUrl eq "/seller/modify"}'>active</c:if> ">
                    판매자 정보 수정
                </a>
            </li>
        </ul>
    </div>
</nav>