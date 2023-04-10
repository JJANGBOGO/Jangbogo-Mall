<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/findSuccess.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<body>
<%--                <c:choose>--%>
<%--                    <c:when test="${verifyType eq 'email'}">--%>
<%--                        <i class="fa-regular fa-envelope"></i>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise><i class="fa-solid fa-phone"></i></c:otherwise>--%>
<%--                </c:choose>--%>
<div class="find-success-content">
    <div class="find-success-content">
        <div class="center">
            <div class="email-icon">
                <i class="fa-solid fa-check"></i>
            </div>
            <p class="result">
                <c:choose>
                    <c:when test="${type eq 'pwd'}">
                        <span class="receipient">${toEmail}</span>으로 <br/>
                        임시 비밀번호가 전송되었어요.
                    </c:when>
                    <c:otherwise>
                        회원님의 이메일은 ${findEmail} 입니다.
                    </c:otherwise>
                </c:choose>
            </p>
            <c:if test="${type eq 'pwd'}">
                <p class="warn-desc">
                    5분 후에도 메일이 오지 않는다면<br/>스팸함을 확인해 주세요.
                </p>
            </c:if>
            <div class="btn-box">
                <a href="/login">
                    <button class="login">로그인하기</button>
                </a>
                <a href="/find/pwd">
                    <button class="find-pwd">비밀번호 찾기</button>
                </a>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
