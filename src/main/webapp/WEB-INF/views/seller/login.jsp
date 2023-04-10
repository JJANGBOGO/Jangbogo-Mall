<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%--<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"  %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/loginForm.css"/>
    <%--    <link rel="stylesheet" href="/css/radioBtn.css"/>--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<c:if test="${param.ng!=null}">
    <p> error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
</c:if>
<div class="login-container">
    <c:if test="${LoginFailMessage!=null}">
        <p> Error : <c:out value="${LoginFailMessage}"/></p>
    </c:if>
    <div class="contents">
        <div class="login-wrap">
            <h2 class="page-title">로그인</h2>
            <div class="tab-box">
                <button class="tab-button" id="user_login_link">회원</button>
                <button class="tab-button on">판매자</button>
            </div>
            <div class="login-form">
                <form action="/seller/login_check" method="post">
                    <input
                            name="email"
                            type="text"
                            class="input-control"
                            placeholder="이메일을 입력해주세요."
                    />
                    <div class="input-control">
                        <input
                                name="pwd"
                                id="pwd"
                                type="password"
                                placeholder="비밀번호를 입력해주세요."
                        />
                        <input type="checkbox" name="" id="showPwd" hidden checked/>
                        <label id="showPwdToggle" class="showPwd" for="showPwd">
                            <i id="eye" class="fa-regular fa-eye-slash"></i>
                        </label>
                    </div>
                    <div class="user-info-link">
                        <label id="user-id-toggle" for="show-user-id">
                            <input type="checkbox" name="" id="show-user-id" hidden/>
                            <img
                                    class="agree-checkbox"
                                    src="/img/unchecked.png"
                                    width="20"
                                    height="20"
                            />
                            이메일 저장
                        </label>
                        <ul>
                            <li>
                                <a href="/find/email">이메일 찾기</a>
                            </li>
                            <li class="pw-find">
                                <a href="/find/pwd"> 비밀번호 찾기 </a>
                            </li>
                        </ul>
                    </div>
                    <button class="login-button" type="submit">
                        로그인
                    </button>
                    <a href="/register/intro"
                       class="register-button">회원가입</a>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    let signupMsg = "${signupMsg}";
    if (signupMsg == "MSG_OK") alert("판매자 가입에 성공했습니다.");

    let msg = "${msg}";
    if (msg == "LOGIN_ERR") alert("로그인 도중 오류가 발생하였습니다. 다시 시도해 주세요.");

    $("#user_login_link").click(function() {
        window.location.href = "/user/login";
    });

    //비번 보여주기 toggle
    let pwdToggle = () => {
        const checked = $("#showPwd").is(":checked");
        $("#pwd").attr("type", checked ? "text" : "password");
        $("#eye").attr(
            "class",
            checked ? "fa-regular fa-eye" : "fa-regular fa-eye-slash"
        );
    };

    $(document).ready(function () {
        $("#showPwdToggle").click(function () {
            pwdToggle();
        });

        $("#user-id-toggle").click(function () {
            const checked = $("#show-user-id").is(":checked");
            $("#user-id-toggle")
                .children("img")
                .attr(
                    "src",
                    checked ? "/img/checked.png" : "/img/unchecked.png"
                );
        });
    });
</script>
</body>
</html>
