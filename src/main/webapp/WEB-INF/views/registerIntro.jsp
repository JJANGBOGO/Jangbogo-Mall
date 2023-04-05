<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/04/05
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/registerIntro.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="reg-intro-content">
    <h2 class="header">장보고에 오신 것을 환영합니다!</h2>
    <h1 class="title">회원 가입</h1>
    <div class="link-box">
        <div class="link">
<%--            <img class="icon" src="/img/buyer.png" alt=""/>--%>
            <a href="/register/user" class="link-btn">회원 가입</a>
        </div>
        <div class="link">
<%--            <img class="icon seller" src="/img/seller.png" alt=""/>--%>
            <a href="/register/seller" class="link-btn seller">판매자 가입</a>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
</body>
</html>
