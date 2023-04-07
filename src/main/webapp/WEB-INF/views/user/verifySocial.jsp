<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/user/verifySocial.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <!-- end of page-header -->
        <div class="social-user-alert">
            <div class="content">
                <div class="center-padding">
                    <h2>지금 일반 회원과 연동하여 개인 정보를 수정하세요</h2>
                </div>
                <div class="button-box">
                    <button>일반 계정과 연동</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

