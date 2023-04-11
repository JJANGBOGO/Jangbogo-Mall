<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/modifyUser.css"/>
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
            <form id="modify_user" class="check-pwd-form" action="/user/modify" method="post">
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
                                        value="${user.email}"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="nick_nm">닉네임</label>
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
                            <div class="error-msg nick">닉네임.</div>
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
                            <div class="error-msg pwd">새 비밀번호를 입력해 주세요.</div>
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
                            <div class="error-msg pwd-confirm">새 비밀번호와 일치하지 않습니다.</div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="mpno">휴대전화</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="mpno"
                                        type="text"
                                        name="mpno"
                                        value="${user.mpno}"
                                        placeholder="휴대전화를 숫자만 입력해주세요"
                                />
                            </div>
                            <div class="error-msg mpno">휴대폰.</div>
                        </div>
                        <div class="btn-space">
                            <button id="mpno_chk">
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

        $(".info-modify").click(function () { //수정버튼 클릭
            let nick_ref = $("#nick_nm");

            if (nick_ref.val() == "") {
                alert("닉네임을 입력해 주세요");
                nick_ref.focus();
                return false;
            }

            if (!nick_reg.test(nick_ref.val())) {
                alert(
                    "닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요"
                );
                nick_ref.focus();
                return false;
            }

            if (!$("#nick_duplicate_chk").is(":disabled")) {
                alert("닉네임 중복 검사를 해주세요");
                nick_ref.focus();
                return false;
            }

            let pwd_ref = $("#pwd");
            //비번
            if (pwd_ref.val() != "" && !pwd_reg.test(pwd_ref.val())) {
                alert(
                    "비밀번호를 6자 이상 16자 이하, 영어와 숫자의 조합으로 입력해 주세요. 특수문자 허용"
                );
                pwd_ref.focus();
                return false;
            }

            let pwd_confirm_ref = $("#pwd_confirm");

            //비번 확인
            if (pwd_ref.val() != pwd_confirm_ref.val()) {
                alert("동일한 비밀번호를 입력해 주세요");
                pwd_confirm_ref.focus();
                return false;
            }

            //휴대전화 인증
            let mpno_ref = $("#mpno");
            if (mpno_ref.val() == "") {
                alert("휴대전화를 입력해 주세요");
                mpno_ref.focus();
                return false;
            }

            if (!mpno_reg.test(mpno_ref.val())) {
                alert("휴대전화 형식에 맞춰 입력해 주세요 (-제외 숫자만)");
                mpno_ref.focus();
                return false;
            }

            if (!$("#mpno_chk").is(":disabled")) {
                alert("휴대전화 인증을 해주세요");
                return false;
            }

            //통과
            let prev_pwd = "${user.pwd}";
            if (pwd_ref.val() == "") pwd_ref.val(prev_pwd); //새 비밀번호를 입력하지 않은 경우 기존 비밀번호를 넣는다.

            $("#modify_user").submit();

        });

    });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

