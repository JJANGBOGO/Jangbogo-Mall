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
                            <div class="error-msg nick"></div>
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
                            <div class="error-msg pwd"></div>
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
                            <div class="error-msg pwd-confirm"></div>
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
                            <div class="error-msg mpno"></div>
                        </div>
                        <div class="btn-space">
                            <button id="mpno_chk">
                                다른 번호로 인증
                            </button>
                        </div>
                    </div>
                    <div class="input-line agree-form">
                        <label for="markt_agre_yn" class="input-line">
                            <input
                                    type="checkbox"
                                    name="markt_agre_yn"
                                    id="markt_agre_yn"
                                    value="Y"
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
<script src="/js/member/regEx.js"></script>
<script src="/js/member/common.js"></script>
<script>
    $(document).ready(function () {
        //인증버튼들 비활성화
        $("#nick_duplicate_chk").attr("disabled", true);
        $("#mpno_chk").attr("disabled", true);
        //초기 마케팅 수신동의 상태
        $("#markt_agre_yn").attr("checked", "${user.markt_agre_yn}" == "Y" ? true : false);
        $(".agree-checkbox2").attr("src", imgUrl($("#markt_agre_yn").is(":checked")));

        //커스텀 체크박스
        $("#markt_agre_yn").click(function () {
            $(".agree-checkbox2").attr("src", imgUrl($(this).is(":checked")));
        });

        //keyup
        //닉네임
        $("#nick_nm").keyup(function () {
            let nick = $("#nick_nm").val();
            let err_ref = $(".error-msg.nick");
            let prev_nick = "${user.nick_nm}";

            if (nick == "") {
                err_ref.html("닉네임을 입력해 주세요");
                return false;
            } else err_ref.empty();

            if (!nick_reg.test(nick)) {
                err_ref.html("닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요");
            } else err_ref.empty();

            $("#nick_duplicate_chk").attr("disabled", nick == prev_nick ? true : false);
        });

        //비번
        $("#pwd").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();
            let pwd_err_ref = $(".error-msg.pwd");

            if (pwd == "") {
                pwd_err_ref.html("비밀번호를 입력해 주세요");
                return false;
            } else pwd_err_ref.empty();


            if (!pwd_reg.test(pwd)) {
                pwd_err_ref.html(
                    "비밀번호를 6자 이상 16자 이하, 영어와 숫자의 조합으로 입력해 주세요. 특수문자 허용"
                );
                return false;
            } else pwd_err_ref.empty();

            if (pwd_confirm != pwd) {
                $(".error-msg.pwd-confirm").html(
                    "비밀번호와 동일한 값을 입력해 주세요"
                );
                return false;
            } else {
                $(".error-msg.pwd-confirm").empty();
            }
        });

        //비번확인
        $("#pwd_confirm").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();
            let err_ref = $(".error-msg.pwd-confirm");

            if (pwd_confirm == "") {
                err_ref.html("비밀번호 확인을 입력해 주세요");
                return false;
            } else err_ref.empty();

            if (pwd_confirm != pwd) {
                err_ref.html("비밀번호와 동일한 값을 입력해 주세요");
                return false;
            } else err_ref.empty();
        });

        //휴대전화
        $("#mpno").keyup(function () {
            let mpno = $("#mpno").val();
            let err_ref = $(".error-msg.mpno");
            let prev_mpno = "${user.mpno}";

            if (mpno == "") {
                err_ref.html("휴대전화를 입력해 주세요");
                return false;
            } else err_ref.empty();

            if (!mpno_reg.test(mpno)) {
                err_ref.html("휴대전화 형식에 맞춰 입력해 주세요 (-제외 숫자만)");
                return false;
            } else err_ref.empty();

            $("#mpno_chk").attr("disabled", mpno == prev_mpno ? true : false);
        });

        //닉네임 중복검사
        $("#nick_duplicate_chk").click(function (e) {
            e.preventDefault(); //form 전송 방지
            let nick_ref = $("#nick_nm");

            //닉네임
            if (nick_ref.val() == "") {
                alert("닉네임을 입력해 주세요");
                nick_ref.focus();
                return false;
            }

            if (!nick_reg.test(nick_ref.val())) {
                alert("닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요");
                nick_ref.focus();
                return false;
            }

            $.ajax({
                url: '/user/duplicate/nickname',
                data: {nick_nm: nick_ref.val()},
                type: 'POST',
                success: function (result) {
                    if (result == "OK") {
                        alert("사용 가능한 닉네임입니다.");
                        $("#nick_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        nick_ref.attr("readonly", true); //인풋 비활성화
                    } else {
                        alert("이미 사용중인 닉네임입니다.");
                        nick_ref.focus();
                    }
                },
                error: function (err) {
                    alert("error: ", err);
                }
            }); //$.ajax
        });

        //휴대전화 인증 검사
        $("#mpno_chk").click(function (e) {
            e.preventDefault();
            let mpno_ref = $("#mpno");

            if (mpno_ref.val() == "") {
                alert("휴대전화번호를 입력해주세요");
                mpno_ref.focus();
                return false;
            }

            if (!mpno_reg.test(mpno_ref.val())) {
                alert("휴대전화형식을 지켜주세요. -제외 숫자만");
                mpno_ref.focus();
                return false;
            }

            $.ajax({
                url: '/chk/mpno',
                data: JSON.stringify({to: mpno_ref.val()}), // 객체를 전송할때는 stringify() 필요, @RequestBody때문
                type: 'POST',
                contentType: "application/json",
                success: function (result) { // test, 문자열 온다.
                    alert("인증번호 전송에 성공했습니다");
                    console.log(result, result.numStr);
                    mpno_verify_num = result.numStr;
                    $("#mpno").closest(".input-box").append('<div class="input">' +
                        '<input id="mpno_verify" type="text" placeholder="인증번호를 입력해 주세요">' +
                        '</div><div class="error-msg mpno-verify"></div>');
                },
                error: function (err) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요");
                }
            }); //$.ajax
        });

        $(document).on("keyup", "#mpno_verify", function () { //동적 태그라서 document에 이벤트 연결
            if ($("#mpno_verify").val() == mpno_verify_num) {
                $(".error-msg.mpno-verify").html("인증되었습니다");
                $(".error-msg.mpno-verify").css('color', 'green');
                $("#mpno_chk").attr("disabled", true);
                $("#mpno").attr('readonly', true);

            }
        })

        $(".info-modify").click(function (e) { //수정버튼 클릭
            e.preventDefault();
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

