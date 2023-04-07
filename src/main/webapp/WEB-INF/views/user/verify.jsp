<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>개인 정보 수정</h2>
        </div>
        <div class="check-pwd-content">
            <h4>비밀번호 재확인</h4>
            <p>
                회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번
                확인해주세요.
            </p>
            <form class="check-pwd-form" action="/mypage/info" method="post" id="verify_form">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label>이메일</label>
                        </div>
                        <div class="input">
                            <input name="id" type="text" readonly="true" value="${sessionScope.email}" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label
                            >비밀번호
                                <span class="required">*</span>
                            </label>
                        </div>
                        <div class="input">
                            <input name="pwd" type="password" />
                        </div>
                    </div>
                </div>
                <!-- end of center-padding -->
                <div class="button-box">
                    <button type="submit" class="">확인</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(document).ready(function() {
        $("#pwd_verity_btn").click(function(e){
        //   alert null check needed
        });
    });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

