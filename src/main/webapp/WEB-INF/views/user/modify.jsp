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
                            <label for="nick_nm">닉네임<span>*</span></label>
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
                                <input type="checkbox" id="show_pwd" hidden/>
                                <label id="show_pwd_toggle" class="show-pwd" for="show_pwd">
                                    <i id="eye" class="fa-regular fa-eye-slash"></i>
                                </label>
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
                                <input type="checkbox" id="show_pwd_confirm" hidden/>
                                <label
                                        id="show_pwd_confirm_toggle"
                                        class="show-pwd"
                                        for="show_pwd_confirm"
                                >
                                    <i id="eye2" class="fa-regular fa-eye-slash"></i>
                                </label>
                            </div>
                            <div class="error-msg pwd-confirm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="mpno">휴대전화<span>*</span></label>
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
                        <button class="info-modify cancel" id="cancel_btn">수정 취소</button>
                        <button class="info-modify" id="submit_btn">수정 완료</button>
                    </div>
                </div>
                <!-- end of center-padding -->
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/regEx.js"></script>
<script src="/js/member/common.js"></script>
<script src="/js/member/msg.js"></script>
<script>
    $(document).ready(function () {
        //인증버튼들 비활성화
        $("#nick_duplicate_chk").attr("disabled", true);
        $("#mpno_chk").attr("disabled", true);

        let market_checkbox = $("#markt_agre_yn");
        //초기 마케팅 수신동의 설정
        market_checkbox.attr("checked", "${user.markt_agre_yn}" === "Y" ? true : false);
        $(".agree-checkbox2").attr("src", imgUrl(market_checkbox.is(":checked")));

        //커스텀 체크박스 toggle
        market_checkbox.click(function () {
            $(".agree-checkbox2").attr("src", imgUrl($(this).is(":checked")));
        });

        //수정 취소 버튼
        $("#cancel_btn").click(function (e) {
            e.preventDefault();
            window.location.href = "/user/info";
        });

        //keyup
        //닉네임
        $("#nick_nm").keyup(function () {
            let nick = $("#nick_nm").val();
            let err_ref = $(".error-msg.nick");
            let prev_nick = "${user.nick_nm}";

            nickErrMsg(nick, err_ref);
            $("#nick_duplicate_chk").attr("disabled", nick === prev_nick ? true : false);
        });

        //비번
        $("#pwd").keyup(function () {
            let pwd = $("#pwd").val();
            let err_ref = $(".error-msg.pwd");
            pwdErrMsg(pwd, err_ref);
        });

        //비번확인
        $("#pwd_confirm").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();
            let err_ref = $(".error-msg.pwd-confirm");

            pwdConfirmErrMsg(pwd, pwd_confirm, err_ref);
        });

        //휴대전화 keyup
        $("#mpno").keyup(function () {
            let mpno = $("#mpno").val();
            let err_ref = $(".error-msg.mpno");

            mpnoErrMsg(mpno, err_ref);
            $("#mpno_chk").attr("disabled", (mpno === "${user.mpno}") ? true : false);
        });

        //닉네임 중복검사
        $("#nick_duplicate_chk").click(function (e) {
            e.preventDefault(); //form 전송 방지
            let nick_ref = $("#nick_nm");
            if (!validateNickAlert(nick_ref)) return false;

            $.ajax({
                url: '/user/duplicate/nickname',
                data: {nick_nm: nick_ref.val()},
                type: 'POST',
                success: function (result) {
                    if (result === "OK") {
                        alert(available_nick);
                        $("#nick_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        nick_ref.attr("readonly", true); //인풋 비활성화
                    } else {
                        alert(duplicate_nick);
                        nick_ref.focus();
                    }
                },
                error: function (err) {
                    alert(error_msg);
                }
            }); //$.ajax
        });

        //휴대전화 인증 검사
        $("#mpno_chk").click(function (e) {
            e.preventDefault();
            let mpno_ref = $("#mpno");

            if (!validateMpnoAlert(mpno_ref)) return false;

            $.ajax({
                url: '/chk/mpno',
                data: JSON.stringify({to: mpno_ref.val()}), // 객체를 전송할때는 stringify() 필요, @RequestBody때문
                type: 'POST',
                contentType: "application/json",
                success: function (result) {
                    alert(mpno_send_ok);
                    console.log(result, result.numStr);
                    mpno_verify_num = result.numStr;
                    // $("#mpno").closest(".input-box").append('<div class="input">' +
                    //     '<input id="mpno_verify" type="text" placeholder="인증번호를 입력해 주세요">' +
                    //     '</div><div class="error-msg mpno-verify"></div>');

                    if (mpno_ref.closest(".input-box").find("#mpno_verify").length == 0) {
                        mpno_ref.closest(".input-box").append('<div class="input">' +
                            '<input id="mpno_verify" type="text" placeholder="인증번호를 입력해 주세요">' +
                            '</div><div class="error-msg mpno-verify"></div>');
                    }
                },
                error: function (err) {
                    alert(error_msg);
                }
            }); //$.ajax
        });

        $(document).on("keyup", "#mpno_verify", function () { //동적 태그라서 document에 이벤트 연결
            if ($("#mpno_verify").val() === mpno_verify_num) {
                $(".error-msg.mpno-verify").html(mpno_verified);
                $(".error-msg.mpno-verify").css('color', 'green');
                $("#mpno_chk").attr("disabled", true);
                $("#mpno").attr('readonly', true);

            }
        });

        $("#submit_btn").click(function (e) { //수정버튼 클릭
            e.preventDefault();
            let nick_ref = $("#nick_nm");
            let nick_chk_btn = $("#nick_duplicate_chk");

            if (!validateNickAlert(nick_ref)) return false;
            if (!chkNickAlert(nick_ref, nick_chk_btn)) return false;

            let pwd_ref = $("#pwd");
            let pwd_confirm_ref = $("#pwd_confirm");
            //새 비번
            if (!validateNewPwdAlert(pwd_ref)) return false;
            //새 비번 확인
            if (!validatePwdConfirmAlert(pwd_ref, pwd_confirm_ref)) return false;

            //휴대전화 인증
            let mpno_ref = $("#mpno");
            let mpno_chk_btn = $("#mpno_chk");

            if (!validateMpnoAlert(mpno_ref)) return false;
            if (!chkMpnoAlert(mpno_ref, mpno_chk_btn)) return false;
            //통과
            $("#modify_user").submit();
        });
    });
</script>
</body>
</html>

