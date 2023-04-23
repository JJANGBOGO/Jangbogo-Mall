<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/user/signupForm.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--    <c:if test="${param.ng!=null}">--%>
<%--        <p> error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> </p>--%>
<%--    </c:if>--%>
<div class="register-page">
    <div class="reg-page-center">
        <div class="reg-header">회원가입</div>
        <div class="section-line"></div>
        <div class="reg-form-box">
            <form id="user_register" class="reg-form" action="/user/register" method="post">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">이메일<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="email"
                                        name="email"
                                        type="text"
                                        placeholder="jungsukmarket@naver.com"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space">
                            <button id="email_duplicate_chk">
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="nick_nm">닉네임<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="nick_nm"
                                        id="nick_nm"
                                        type="text"
                                        placeholder="닉네임을 입력해주세요"
                                />
                            </div>
                            <div class="error-msg nick"></div>
                        </div>
                        <div class="btn-space">
                            <button id="nick_duplicate_chk">중복확인</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd">비밀번호<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="pwd"
                                        id="pwd"
                                        type="password"
                                        placeholder="비밀번호를 입력해주세요"
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
                            <label for="pwd_confirm">비밀번호 확인<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd_confirm"
                                        type="password"
                                        placeholder="비밀번호를 한번 더 입력해주세요"
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
                                        name="mpno"
                                        id="mpno"
                                        type="text"
                                        placeholder="-제외 숫자만 입력해주세요"
                                />
                            </div>
                            <div class="error-msg mpno"></div>
                        </div>
                        <div class="btn-space">
                            <button id="mpno_chk">인증</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>주소<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <input name="zpcd" id="zpcd" hidden/>
                            <div class="input">
                                <input
                                        name="addr_base"
                                        id="addr_base"
                                        type="text"
                                        placeholder="주소를 검색해 주세요"
                                        readonly
                                />
                            </div>
                            <div class="input addr-dtl">
                                <input
                                        name="addr_dtl"
                                        id="addr_dtl"
                                        type="text"
                                        placeholder="상세 주소를 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="addr-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                검색
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="brdy">생년월일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brdy"
                                        id="brdy"
                                        type="date"
                                        placeholder="yyyy / mm / dd"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="section-line bottom"></div>
                    <div class="checkbox-group">
                        <label for="check-all" class="input-line">
                            <input
                                    type="checkbox"
                                    name="checkall"
                                    id="check-all"
                                    hidden
                            />
                            <img
                                    class="agree-checkbox"
                                    src="/img/unchecked.png"
                                    width="20"
                                    height="20"
                            />
                            <span>모두 동의합니다.</span>
                        </label>
                        <div class="chk-group-line">
                            <label for="check_1" class="input-line">
                                <input type="checkbox" id="check_1" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>만 14세 이상입니다 (필수)</span>
                            </label>
                            <label for="check_2" class="input-line">
                                <input type="checkbox" id="check_2" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>이용약관 동의 (필수)</span>
                            </label>
                            <label for="check_3" class="input-line">
                                <input type="checkbox" id="check_3" class="normal" name="user_agre_yn" hidden
                                       value="Y"/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>개인정보 수집 및 이용 동의 (필수)</span>
                            </label>
                            <label for="check_4" class="input-line">
                                <input type="checkbox" id="check_4" class="normal" name="markt_agre_yn" hidden
                                       value="Y"/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span
                                >할인쿠폰/이벤트/감동적인 뉴스레터 선택 동의 (선택)</span
                                >
                            </label>
                        </div>
                    </div>
                    <div class="btn-container">
                        <button class="reg-confirm">가입하기</button>
                    </div>
                </div>
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
    let msg = "${msg}";
    if (msg == "EXCEPTION_ERR") alert("가입 도중 오류가 발생했습니다. 다시 시도해 주세요");

    function setAddr(data) {
        $("#zpcd").val(data.zonecode);
        $("#addr_base").val(data.address);
    }

    //인증번호 문자열
    let mpno_verify_num = "";

    $(document).ready(function () {
        $("#addr-search").click(function (e) {
            e.preventDefault();
            addressCallback(setAddr);
        });

        $(".checkbox-group").on("click", "#check-all", function () {
            let is_checked = $(this).is(":checked");

            $(this)
                .parents(".checkbox-group")
                .find("input")
                .prop("checked", is_checked);

            // 체크박스 이미지 전부 변경
            $(".agree-checkbox").attr(
                "src",
                imgUrl(is_checked)
            );
        });

        $(".checkbox-group").on("click", ".normal", function () {
            var is_checked = true;

            $(".checkbox-group .normal").each(function () {
                is_checked = is_checked && $(this).is(":checked");
            });

            $("#check-all").prop("checked", is_checked);
            $(".agree-checkbox").attr(
                "src",
                imgUrl(is_checked)
            );

            $(".normal").each(function () {
                $(this)
                    .next("img")
                    .attr(
                        "src",
                        imgUrl($(this).is(":checked"))
                    );
            });
        });

        //  이메일 중복 검사 ajax
        $("#email_duplicate_chk").click(function (e) {
            e.preventDefault(); //form 전송 방지

            let email_ref = $("#email");
            if (!validateEmailAlert(email_ref)) return false;

            $.ajax({
                url: '/user/duplicate/email',
                data: {email: email_ref.val()},
                type: 'POST',
                success: function (result) {
                    if (result == "OK") {
                        alert(available_email);
                        $("#email_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        email_ref.attr("readonly", true); //인풋 비활성화
                    } else {
                        alert(duplicate_email);
                        email_ref.focus();
                    }
                },
                error: function (err) {
                    alert(error_msg);
                }
            }); //$.ajax
        });

        //닉네임 중복검사
        $("#nick_duplicate_chk").click(function (e) {
            e.preventDefault();
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
                success: function (result) { // test, 문자열 온다.
                    alert(mpno_send_ok);
                    console.log(result.numStr);
                    mpno_verify_num = result.numStr;
                    mpno_ref.closest(".input-box").append('<div class="input">' +
                        '<input id="mpno_verify" type="text" placeholder="인증번호를 입력해 주세요">' +
                        '</div><div class="error-msg mpno-verify"></div>');
                },
                error: function (err) {
                    alert(error_msg); //controller에서 500발생해서 보낼 경우 여기로 온다.
                }
            }); //$.ajax
        });

        //input 아래 에러메세지
        //이메일
        $("#email").keyup(function () {
            let email = $("#email").val();
            let err_ref = $(".error-msg.email");
            emailErrMsg(email, err_ref);
        });

        $("#nick_nm").keyup(function () {
            let nick = $("#nick_nm").val();
            let err_ref = $(".error-msg.nick");
            nickErrMsg(nick, err_ref);
        });

        $("#pwd").keyup(function () {
            let pwd = $("#pwd").val();
            let err_ref = $(".error-msg.pwd");
            pwdErrMsg(pwd, err_ref);
        });

        $("#pwd_confirm").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();
            let err_ref = $(".error-msg.pwd-confirm");
            pwdConfirmErrMsg(pwd, pwd_confirm, err_ref);
        });

        $("#mpno").keyup(function () {
            let mpno = $("#mpno").val();
            let err_ref = $(".error-msg.mpno");
            mpnoErrMsg(mpno, err_ref);
        });

        $(document).on("keyup", "#mpno_verify", function () { //동적 태그라서 document에 이벤트 연결
            if ($("#mpno_verify").val() == mpno_verify_num) {
                $(".error-msg.mpno-verify").html(mpno_verified);
                $(".error-msg.mpno-verify").css('color', 'green');
                $("#mpno_chk").attr("disabled", true);
                $("#mpno").attr('readonly', true);
            }
        });

        //가입하기 버튼 유효성 검사
        $(".reg-confirm").click(function (e) {
            e.preventDefault(); //버튼 기본 이벤트 방지

            let email_ref = $("#email");
            let email_chk_btn = $("#email_duplicate_chk");

            if (!validateEmailAlert(email_ref)) return false;
            if (!chkEmailAlert(email_ref, email_chk_btn)) return false;

            let nick_ref = $("#nick_nm");
            let nick_chk_btn = $("#nick_duplicate_chk");

            if (!validateNickAlert(nick_ref)) return false;
            if (!chkNickAlert(nick_ref, nick_chk_btn)) return false;

            //비번과 비번확인
            let pwd_ref = $("#pwd");
            let pwd_confirm_ref = $("#pwd_confirm");

            if (!validatePwdAlert(pwd_ref)) return false;
            if (!validatePwdConfirmAlert(pwd_ref, pwd_confirm_ref)) return false;

            //휴대전화
            let mpno_ref = $("#mpno");
            let mpno_chk_btn = $("#mpno_chk");

            if (!validateMpnoAlert(mpno_ref)) return false;
            if (!chkMpnoAlert(mpno_ref, mpno_chk_btn)) return false;

            //주소
            let addr_base_ref = $("#addr_base");
            let addr_dtl_ref = $("#addr_dtl");

            if (!validateAddrAlert(addr_base_ref, addr_dtl_ref)) return false;

            //필수동의여부
            let checked_1 = $("#check_1").is(":checked");
            let checked_2 = $("#check_2").is(":checked");
            let checked_3 = $("#check_3").is(":checked");

            if (!(checked_1 && checked_2 && checked_3)) {
                alert(chk_agre_required);
                return false;
            }

            $("#user_register").submit();
        });
    });
</script>
</body>
</html>
