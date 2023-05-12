<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/user/verifySocial.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"><a href="/product/91"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/5743dc11-54b5-4140-a574-d0424e6414eb.jpg"></a></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <div class="social-user-alert">
            <div class="content">
                <div class="center-padding">
                    <h2>지금 일반 회원과 연동하여 개인 정보를 수정하세요</h2>
                </div>
                <div class="button-box">
                    <button>일반 계정과 연동</button>
                    <button class="withdraw-btn">탈퇴하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(document).ready(function() {
       $(".withdraw-btn").click(function() {
         window.location.href ="/user/withdraw";
       });
    });
</script>
</html>

