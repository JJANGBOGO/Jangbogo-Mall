<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/findSuccess.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<body>
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
                        <c:choose>
                            <c:when test="${member eq 'seller'}">
                                판매자님의 이메일은 ${sellerEmail} 입니다.
                            </c:when>
                            <c:when test="${member eq 'user'}">
                                회원님의 이메일은 ${userEmail} 입니다.
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </p>
            <c:if test="${type eq 'pwd'}">
                <p class="warn-desc">
                    5분 후에도 메일이 오지 않는다면<br/>스팸함을 확인해 주세요.
                </p>
            </c:if>
            <div class="btn-box">
                <c:if test="${member eq 'seller'}">
                    <a href="/seller/login">
                        <button class="login">로그인하기</button>
                    </a>
                </c:if>
                <c:if test="${member eq 'user'}">
                    <a href="/user/login">
                        <button class="login">로그인하기</button>
                    </a>
                </c:if>
                <c:if test="${type ne 'pwd'}">
                    <a href="/find/pwd">
                        <button class="find-pwd">비밀번호 찾기</button>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <%@ include file="/WEB-INF/views/include/script.jsp" %>
    <script>
        let type = "${type}";
        let pwd_expired = type === "pwd" &&  "${toEmail}" === "";
        let email_expired = type === "email" && ("${userEmail}" === "" && "${sellerEmail}" === "");

        if (pwd_expired) window.location.href = "/find/pwd";
        if (email_expired) window.location.href= "/find/email";

        //type이 pwd인데 toEmail이 비었으면 redirect
        //type이 email인데 sellerEmail, userEmail이 비었으면 redirect
    </script>
</body>
</html>
