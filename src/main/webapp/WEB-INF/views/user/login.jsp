<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/user/loginForm.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
    <c:if test="${param.ng!=null}">
        <p> error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> </p>
    </c:if>
<div class="login-container">
    <c:if test="${LoginFailMessage!=null}">
        <p> Error : <c:out value="${LoginFailMessage}"/></p>
    </c:if>
    <div class="contents">
        <div class="login-wrap">
            <h2 class="page-title">로그인</h2>
            <div class="login-form">
                <form action="/user/login" method="post">
                    <input
                            name="id"
                            type="text"
                            class="input-control"
                            placeholder="아이디를 입력해주세요."
                    />
                    <div class="input-control">
                        <input
                                name="pwd"
                                id="pwd"
                                type="password"
                                placeholder="비밀번호를 입력해주세요."
                        />
                        <input type="checkbox" name="" id="showPwd" hidden checked />
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
                            아이디 저장
                        </label>
                        <ul>
                            <li>
                                <a href="/user/find/id">아이디 찾기</a>
                            </li>
                            <li class="pw-find">
                                <a href="/user/find/pwd"> 비밀번호 찾기 </a>
                            </li>
                        </ul>
                    </div>
                    <button class="login-button" type="submit">
                        로그인
                    </button>
                    <a href="/user/signup"
                       class="register-button">회원가입</a>
                </form>
                <div class="warning-text">
                    *소셜 로그인의 경우 판매자 등록, 개인정보 수정, 탈퇴가 불가능합니다.
                </div>
                <div class="join-buttons">
                    <a
                        href="${urlKakao}"
                        class="login-social kakao"
                    >
                        <span>
                          <strong>카카오</strong>
                        </span>로 로그인
                    </a>
                    <a
                        href="${urlNaver}"
                        class="login-social naver"
                    >
                        <span>
                          <strong>네이버</strong>
                        </span>로 로그인
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    let signupMsg = "${signupMsg}";
    if (signupMsg == "MSG_OK") alert("회원 가입에 성공했습니다.");

    let loginMsg = "${loginMsg}";
    if (loginMsg == "LOGIN_ERROR") alert("로그인 도중 오류가 발생하였습니다. 다시 시도해 주세요.");

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
