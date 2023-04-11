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
            <form class="reg-form" action="/user/register" method="post">
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
                                <input type="checkbox" id="show-pwd" hidden/>
                                <label id="show-pwd-toggle" class="show-pwd" for="show-pwd">
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
                                <input type="checkbox" id="show-pwd-confirm" hidden/>
                                <label
                                        id="show-pwd-confirm-toggle"
                                        class="show-pwd"
                                        for="show-pwd-confirm"
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
                                        placeholder="01026558945"
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
                                <input name="addr_base" id="addr_base" placeholder="주소를 검색해 주세요" readonly/>
                            </div>
                            <div class="input" style="margin-top: 10px">
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
                        <div
                                class=""
                                style="
                    border-top: 1px solid #ddd;
                    border-bottom: 1px solid #ddd;
                  "
                        >
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
                                <input type="checkbox" id="check_3" class="normal" name="user_agre_yn" hidden value="Y"/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>개인정보 수집 및 이용 동의수 (필수)</span>
                            </label>
                            <label for="check_4" class="input-line">
                                <input type="checkbox" id="check_4" class="normal" name="markt_agre_yn" hidden value="Y"/>
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
                        <button class="reg-confirm" >가입하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="/js/regEx.js"></script>
<script>
    let msg = "${msg}";
    if(msg == "EXCEPTION_ERR") alert("가입 도중 오류가 발생했습니다. 다시 시도해 주세요");
</script>
<script>
    let showRawPwd = (checkboxId, inputId, iconId) => {
        const checked = $(checkboxId).is(":checked");
        $(inputId).attr("type", !checked ? "text" : "password");
        $(iconId).attr(
            "class",
            !checked ? "fa-regular fa-eye" : "fa-regular fa-eye-slash"
        );
    };

    let addressCallback = (e) => {
        e.preventDefault(); //405 이슈 해결.

        new daum.Postcode({
            oncomplete: function (data) {
                let addr = "";
                let extraAddr = ""; //참고항목

                if (data.userSelectedType === "R") {
                    addr = data.roadAddress;

                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname))
                        extraAddr += data.bname;
                } else addr = data.jibunAddress;

                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraAddr +=
                        extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                }

                if (extraAddr !== "") extraAddr = " (" + extraAddr + ")";

                $("#zpcd").val(data.zonecode);
                $("#addr_base").val(data.address);
            },
        }).open();
    };

    let imgUrl = (checked) => {
        return checked ? "/img/checked.png" : "/img/unchecked.png";
    }

    //인증번호 문자열
    let mpno_verify_num = "";

    $(document).ready(function () {
        $("#addr-search").click(function (e) {
            addressCallback(e);
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

        $("#show-pwd-toggle").click(() =>
            showRawPwd("#show-pwd", "#pwd", "#eye")
        );
        $("#show-pwd-confirm-toggle").click(() =>
            showRawPwd("#show-pwd-confirm", "#pwd_confirm", "#eye2")
        //    $("#pwd_confirm").attr("type", "text")

        );

        //    이메일 중복 검사 ajax
        $("#email_duplicate_chk").click(function (e) {
            e.preventDefault(); //form 전송 방지
            let email = $("#email").val();

            if (email == "") {
                alert("이메일을 입력해 주세요");
                $("#email").focus();
                return false;
            }

            if (!email_reg.test(email)) {
                alert("이메일 형식에 맞게 입력해 주세요");
                $("#email").focus();
                return false;
            }

            $.ajax({
                url: '/user/duplicate/email',
                data: {email: email},
                type: 'POST',
                success: function (result) {
                    if (result == "OK") {
                        alert("사용 가능한 이메일입니다.");
                        $("#email_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        $("#email").attr("readonly", true); //인풋 비활성화
                    } else {
                        alert("이미 사용중인 이메일입니다.");
                        $("#email").focus();
                    }
                },
                error: function (err) {
                    alert("error: ", err)
                }
            }); //$.ajax
        });

        //닉네임 중복검사
        $("#nick_duplicate_chk").click(function (e) {
            e.preventDefault(); //form 전송 방지
            let nick = $("#nick_nm").val();

            //닉네임
            if (nick == "") {
                alert("닉네임을 입력해 주세요");
                $("#nick_nm").focus();
                return false;
            }

            if (!nick_reg.test(nick)) {
                alert(
                    "닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요"
                );
                $("#nick_nm").focus();
                return false;
            }

            $.ajax({
                url: '/user/duplicate/nickname',
                data: {nick_nm: nick},
                type: 'POST',
                success: function (result) {
                    if (result == "OK") {
                        alert("사용 가능한 닉네임입니다.");
                        $("#nick_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        $("#nick_nm").attr("readonly", true); //인풋 비활성화
                    } else {
                        alert("이미 사용중인 닉네임입니다.");
                        $("#nick_nm").focus();
                    }
                },
                error: function (err) {
                    alert("error: ", err)
                }
            }); //$.ajax
        });

        //휴대전화 인증 검사
        $("#mpno_chk").click(function (e) {
            e.preventDefault();
            let mpno = $("#mpno").val();

            if (mpno == "") {
                alert("휴대전화번호를 입력해주세요");
                $("#mpno").focus();
                return false;
            }

            if (!mpno_reg.test(mpno)) {
                alert("휴대전화형식을 지켜주세요. -제외 숫자만");
                $("#mpno").focus();
                return false;
            }

            $.ajax({
                url: '/chk/mpno',
                data: JSON.stringify({to: mpno}), // 객체를 전송할때는 stringify() 필요, @RequestBody때문
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
                    alert("오류가 발생했습니다. 다시 시도해 주세요"); //controller에서 500발생해서 보낼 경우 여기로 온다.
                }
            }); //$.ajax
        });

        //input 아래 에러메세지
        //이메일
        $("#email").keyup(function () {
            let email = $("#email").val(); //밖으로 빼지 말기

            if (email == "") {
                $(".error-msg.email").html("이메일을 입력해 주세요");
                return false; //good
            } else {
                $(".error-msg.email").empty();
            }

            if (!email_reg.test(email)) {
                $(".error-msg.email").html("이메일 형식에 맞게 입력해 주세요");
                return false;
            } else {
                $(".error-msg.email").empty();
            }
        });

        $("#nick_nm").keyup(function () {
            let nick = $("#nick_nm").val();

            //nickname
            if (nick == "") {
                $(".error-msg.nick").html("닉네임을 입력해 주세요");
                return false;
            } else {
                $(".error-msg.nick").empty();
            }

            if (!nick_reg.test(nick)) {
                $(".error-msg.nick").html(
                    "닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요"
                );
            } else {
                $(".error-msg.nick").empty();
            }
        });

        $("#pwd").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();

            if (pwd == "") {
                $(".error-msg.pwd").html("비밀번호를 입력해 주세요");
                return false;
            } else {
                $(".error-msg.pwd").empty();
            }

            if (!pwd_reg.test(pwd)) {
                $(".error-msg.pwd").html(
                    "비밀번호를 6자 이상 16자 이하, 영어와 숫자의 조합으로 입력해 주세요. 특수문자 허용"
                );
                return false;
            } else {
                $(".error-msg.pwd").empty();
            }

            if (pwd_confirm != pwd) {
                $(".error-msg.pwd-confirm").html(
                    "비밀번호와 동일한 값을 입력해 주세요"
                );
                return false;
            } else {
                $(".error-msg.pwd-confirm").empty();
            }
        });

        $("#pwd_confirm").keyup(function () {
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();

            if (pwd_confirm == "") {
                $(".error-msg.pwd-confirm").html("비밀번호 확인을 입력해 주세요");
                return false;
            } else {
                $(".error-msg.pwd-confirm").empty();
            }

            if (pwd_confirm != pwd) {
                $(".error-msg.pwd-confirm").html(
                    "비밀번호와 동일한 값을 입력해 주세요"
                );
                return false;
            } else {
                $(".error-msg.pwd-confirm").empty();
            }
        });

        $("#mpno").keyup(function () {
            let mpno = $("#mpno").val();

            if (mpno == "") {
                $(".error-msg.mpno").html("휴대전화를 입력해 주세요");
                return false;
            } else {
                $(".error-msg.mpno").empty();
            }

            if (!mpno_reg.test(mpno)) {
                $(".error-msg.mpno").html(
                    "휴대전화 형식에 맞춰 입력해 주세요 (-제외 숫자만)"
                );
                return false;
            } else {
                $(".error-msg.mpno").empty();
            }
        });

        $(document).on("keyup", "#mpno_verify", function () { //동적 태그라서 document에 이벤트 연결
            if ($("#mpno_verify").val() == mpno_verify_num) {
                $(".error-msg.mpno-verify").html("인증되었습니다");
                $(".error-msg.mpno-verify").css('color', 'green');
                $("#mpno_chk").attr("disabled", true);
                $("#mpno").attr('readonly', true);

            }
        })

        //가입하기 버튼 유효성 검사
        $(".reg-confirm").click(function (e) {
            e.preventDefault(); //버튼 기본 이벤트 방지
            let email = $("#email").val(); //밖으로 빼지 말기

            if (email == "") {
                alert("이메일을 입력해 주세요");
                $("#email").focus();
                return false;
            }

            if (!email_reg.test(email)) {
                alert("이메일 형식에 맞게 입력해 주세요");
                $("#email").focus();
                return false;
            }

            //중복검사
            if (!$("#email_duplicate_chk").is(":disabled")) {
                alert("이메일 중복 검사를 해주세요");
                $("#email").focus();
                return false;
            }

            let nick = $("#nick_nm").val();

            //닉네임
            if (nick == "") {
                alert("닉네임을 입력해 주세요");
                $("#nick_nm").focus();
                return false;
            }

            if (!nick_reg.test(nick)) {
                alert(
                    "닉네임은 2-16자 사이의 영문, 숫자, 한글(초성제외)로 입력해주세요"
                );
                $("#nick_nm").focus();
                return false;
            }

            //닉네임 중복 검사
            if (!$("#nick_duplicate_chk").is(":disabled")) {
                alert("닉네임 중복 검사를 해주세요");
                $("#nick_nm").focus();
                return false;
            }

            //비번과 비번확인
            let pwd = $("#pwd").val();
            let pwd_confirm = $("#pwd_confirm").val();

            if (pwd == "") {
                alert("비밀번호를 입력해 주세요");
                $("#pwd").focus();
                return false;
            }

            if (!pwd_reg.test(pwd)) {
                alert(
                    "비밀번호를 6자 이상 16자 이하, 영어와 숫자의 조합으로 입력해 주세요. 특수문자 허용"
                );
                $("#pwd").focus();
                return false;
            }

            if (pwd != pwd_confirm) {
                alert("동일한 비밀번호를 입력해 주세요");
                $("#pwd_confirm").focus();
                return false;
            }

            //휴대전화
            let mpno = $("#mpno").val();

            if (mpno == "") {
                alert("휴대전화번호를 입력해주세요");
                $("#mpno").focus();
                return false;
            }

            if (!mpno_reg.test(mpno)) {
                alert("휴대전화형식을 지켜주세요. -제외 숫자만");
                $("#mpno").focus();
                return false;
            }

            if (!$("#mpno_chk").is(":disabled")) {
                alert("휴대전화인증을 해주세요.");
                $("#mpno").focus();
                return false;
            }

            //주소
            let addr_base = $("#addr_base").val();
            let addr_dtl = $("#addr_dtl").val();

            if (addr_base == "") {
                alert("주소를 검색해 주세요");
                return false;
            }

            if (addr_dtl == "") {
                alert("상세 주소를 입력해 주세요");
                $("#addr_dtl").focus();
                return false;
            }

            //생일
            let brdy = $("#brdy").val();

            if (brdy == "") {
                alert("생일을 입력해 주세요");
                return false;
            }

            //필수동의여부
            let checked_1 = $("#check_1").is(":checked");
            let checked_2 = $("#check_2").is(":checked");
            let checked_3 = $("#check_3").is(":checked");

            if (!(checked_1 && checked_2 && checked_3)) {
                alert("필수 동의 항목에 모두 동의해 주세요");
                return false;
            }

            $(".reg-form").submit();
        });
    });
</script>
</body>
</html>
