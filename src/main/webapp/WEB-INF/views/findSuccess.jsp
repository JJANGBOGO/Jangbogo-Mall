<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/findSuccess.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<body>
    <div class="find-success-content">
        <div class="center">
            <div class="email-icon">
                <c:choose>
                    <c:when test="${verifyType eq 'email'}">
                        <i class="fa-regular fa-envelope"></i>
                    </c:when>
                    <c:otherwise><i class="fa-solid fa-phone"></i></c:otherwise>
                </c:choose>
            </div>
            <p class="result">
                <c:choose>
                    <c:when test="${findType eq 'id'}">아이디가</c:when>
                    <c:otherwise>임시 비밀번호가</c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${verifyType eq 'email'}">이메일로</c:when>
                    <c:otherwise>전화번호로</c:otherwise>
                </c:choose>
                발송되었어요.
            </p>
            <p class="warn-desc">
                <c:choose>
                    <c:when test="${verifyType eq 'email'}">5분 후에도 메일이 오지 않는다면<br/>스팸함을 확인해 주세요.</c:when>
                    <c:otherwise>5분 후에도 메세지가 도착하지 않는다면<br/> 재시도해주세요.</c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>
    <div class="find-success-content">
        <div class="center">
            <div class="email-icon">
                <i class="fa-solid fa-check"></i>
            </div>
            <p class="result">
                <span class="receipient">jinvicky@naver.com</span>으로 <br />
                임시 비밀번호가 전송되었어요.
            </p>
            <p class="warn-desc">
                5분 후에도 메일이 오지 않는다면<br />스팸함을 확인해 주세요.
            </p>

            <div class="btn-box">
                <button class="login">로그인하기</button>
                <button class="find-pwd">비밀번호 찾기</button>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
