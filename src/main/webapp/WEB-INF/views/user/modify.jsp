<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/modifyUser.css"/>
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
            <form class="check-pwd-form" action="">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">이메일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="email"
                                        name="email"
                                        type="text"
                                <%--                                        추후 로그인된 값으로 수정--%>
                                        value="${user.email}"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">닉네임</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="nick_nm"
                                        name="nick_nm"
                                        type="text"
                                        value="${user.nick_nm}"
                                        placeholder="닉네임을 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="nick_duplicate_chk">
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd">새 비밀번호</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd"
                                        name="pwd"
                                        type="password"
                                        placeholder="새 비밀번호를 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd_confirm">새 비밀번호 확인</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd_confirm"
                                        name="pwd_confirm"
                                        type="password"
                                        placeholder="새 비밀번호를 다시 입력해주세요"
                                />
                            </div>
                            <!-- 없었다가 에러 시 참조 얻어서 append를 한다. 그렇지 않으면 영역이 깨짐 -->
                            <div class="error-msg">새 비밀번호와 일치하지 않습니다.</div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="phone">휴대전화</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="phone"
                                        type="text"
                                        name="email"
                                        value="${user.mpno}"
                                        placeholder="휴대전화를 숫자만 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button>
                                다른 번호로 인증
                            </button>
                        </div>
                    </div>
                    <div class="input-line agree-form">
                        <label for="optional_chk" class="input-line">
                            <input
                                    type="checkbox"
                                    name="optional_agree"
                                    id="optional_chk"
                                    hidden
                            />
                            <img
                                    class="agree-checkbox2"
                                    src="/img/unchecked.png"
                                    width="20"
                                    height="20"
                            />
                            <span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 (선택)</span>
                        </label>
                    </div>
                    <div class="btn-container">
                        <button class="info-modify">탈퇴하기</button>
                        <button class="info-modify">회원정보 수정</button>
                    </div>
                </div>
                <!-- end of center-padding -->
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/regEx.js"></script>
<script>
    let imgUrl = (checked) => {
        return checked ? "/img/checked.png" : "/img/unchecked.png";
    };

    $(document).ready(function () {
        $("#required_chk").click(function () {
            $(".agree-checkbox1").attr("src", imgUrl($(this).is(":checked")));
        });

        $("#optional_chk").click(function () {
            $(".agree-checkbox2").attr("src", imgUrl($(this).is(":checked")));
        });

        let current_pwd = "${user.pwd}";

        //submit
        /*
        * form submit할 때 새 비밀번호와 비밀번호 확인이 둘 다 ""면 #pwd.val()에 current_pwd를 넣는다.
        * */

    });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

