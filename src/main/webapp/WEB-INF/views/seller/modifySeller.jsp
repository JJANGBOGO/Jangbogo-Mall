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
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>판매자 정보 수정</h2>
        </div>
        <div class="check-pwd-content">
            <form id="modify_seller" class="check-pwd-form" action="/seller/modify" method="post">
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
                                        value="${seller.email}"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cpnm">브랜드명<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cpnm"
                                        name="cpnm"
                                        type="text"
                                        placeholder="브랜드명을 입력해주세요"
                                        value="${seller.cpnm}"
                                />
                            </div>
                            <div class="error-msg cpnm"></div>
                        </div>
                        <div class="btn-space">
                            <button id="cpnm_duplicate_chk">
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="repr_nm">대표 이름<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="repr_nm"
                                        name="repr_nm"
                                        type="text"
                                        placeholder="대표자 이름을 입력해주세요"
                                        value="${seller.repr_nm}"
                                />
                            </div>
                            <div class="error-msg repr-nm"></div>
                        </div>
                        <div class="btn-space">
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
                            <label for="mpno">휴대전화<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="mpno"
                                        type="text"
                                        name="mpno"
                                        value="${seller.mpno}"
                                        placeholder="-제외 숫자만 입력해 주세요"
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
                    <div class="input-line">
                        <div class="input-label">
                            <label for="guid_nm">안내 담당자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="guid_nm"
                                        name="guid_nm"
                                        type="text"
                                        value="${sellerDtl.guid_nm}"
                                        placeholder="안내 담당자 이름을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg guid-nm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="guid_email">안내 담당자 이메일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="guid_email"
                                        name="guid_email"
                                        type="text"
                                        value="${sellerDtl.guid_email}"
                                        placeholder="안내 담당자 이메일을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg guid-email"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cllr_nm">고객센터 담당자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cllr_nm"
                                        name="cllr_nm"
                                        type="text"
                                        value="${sellerDtl.cllr_nm}"
                                        placeholder="고객센터 담당자 이름을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg cllr-nm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cllr_telno">고객센터 전화번호</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cllr_telno"
                                        name="cllr_telno"
                                        type="text"
                                        value="${sellerDtl.cllr_telno}"
                                        placeholder="고객센터 전화번호를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg cllr-telno"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="btn-container">
                        <button class="info-modify">수정 취소</button>
                        <button class="info-modify" id="seller_modify">수정 완료</button>
                    </div>
                </div>
                <!-- end of center-padding -->
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/common.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/member/regEx.js"></script>
<script>
    $(document).ready(function () {
        $("#optional_chk").click(function () {
            $(".agree-checkbox2").attr("src", imgUrl($(this).is(":checked")));
        });

        //인증버튼들 비활성화 (초기값)
        $("#cpnm_duplicate_chk").attr("disabled", true); // #nick_duplicate_chk과 동일
        $("#mpno_chk").attr("disabled", true);

        //브랜드명 keyup
        $("#cpnm").keyup(function () { //브랜드명
            let cpnm = $("#cpnm").val();
            let err_ref = $(".error-msg.cpnm");

            cpnmErrMsg(cpnm, err_ref);
            $("#cpnm_duplicate_chk").attr("disabled", (cpnm == "${seller.cpnm}") ? true : false);
        });

        //새 비번 keyup
        $("#pwd").keyup(function () {
            let pwd = $("#pwd").val();
            let err_ref = $(".error-msg.pwd");

            newPwdErrMsg(pwd, err_ref); //그냥 비번과 다름
        });

        //휴대전화 keyup
        $("#mpno").keyup(function () {
            let mpno = $("#mpno").val();
            let err_ref = $(".error-msg.mpno");

            mpnoErrMsg(mpno, err_ref);
            $("#mpno_chk").attr("disabled", (mpno == "${seller.mpno}") ? true : false);
        });

        //판매자 수정 브랜드명 중복체크
        $("#cpnm_duplicate_chk").click(function (e) {
            e.preventDefault();
            let cpnm_ref = $("#cpnm");

            if (!validateBrndNameAlert(cpnm_ref)) return false;

            $.ajax({
                url: '/seller/duplicate/cpnm',
                data: {cpnm: cpnm_ref.val()},
                type: 'POST',
                success: function (msg) {
                    if (msg === "OK") {
                        alert(available_cpnm);
                        $("#cpnm_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        cpnm_ref.attr("readonly", true); //인풋 비활성화
                    } else {
                        alert(duplicate_cpnm);
                        cpnm_ref.focus();
                    }
                },
                error: function (err) {
                    alert(error_msg);
                }
            }); //$.ajax
        });

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

        //판매자 수정 단독
        $("#guid_nm").keyup(function () {
            let guid_nm = $("#guid_nm").val();
            let err_ref = $(".error-msg.guid-nm");
            if (guid_nm !== "" && !nick_reg.test(guid_nm)) { //&&이어야 함. 값이 있을 때만 체크.
                err_ref.html("안내담당자 이름은 공백 제외로 실명을 적어주세요 (20자 이내)");
            } else err_ref.empty();
        });

        $("#guid_email").keyup(function () {
            let guid_email = $("#guid_email").val();
            let err_ref = $(".error-msg.guid-email");
            if (guid_email !== "" && !email_reg.test(guid_email)) { //&&이어야 함. 값이 있을 때만 체크.
                err_ref.html(not_valid_email);
            } else err_ref.empty();
        });

        $("#cllr_nm").keyup(function () {
            let cllr_nm = $("#cllr_nm").val();
            let err_ref = $(".error-msg.cllr-nm");
            if (cllr_nm !== "" && !nick_reg.test(cllr_nm)) {
                err_ref.html("고객센터 담당자 이름은 공백 제외로 실명을 적어주세요 (20자 이내)");
            } else err_ref.empty();
        });

        $("#cllr_telno").keyup(function () {
            let cllr_telno = $("#cllr_telno").val();
            let err_ref = $(".error-msg.cllr-telno");

            if (cllr_telno !== "" && !mpno_reg.test(cllr_telno)) {
                err_ref.html(not_valid_mpno);
            } else err_ref.empty();
        });

        //수정완료 버튼
        $("#seller_modify").click(function (e) {
            e.preventDefault();
            let form = $("#modify_seller");

            let cpnm_ref = $("#cpnm");
            let cpnm_chk_btn = $("#cpnm_duplicate_chk");

            if (!validateBrndNameAlert(cpnm_ref)) return false;
            if (!chkBrndNameAlert(cpnm_ref, cpnm_chk_btn)) return false; //브랜드명

            let pwd_ref = $("#pwd");
            let pwd_confirm_ref = $("#pwd_confirm");

            if (!validateNewPwdAlert(pwd_ref)) return false; //수정시 비번 체크가 다른다
            if (!validatePwdConfirmAlert(pwd_ref, pwd_confirm_ref)) return false; //비번

            let mpno_ref = $("#mpno");
            let mpno_chk_btn = $("#mpno_chk");

            if (!validateMpnoAlert(mpno_ref)) return false;
            if (!chkMpnoAlert(mpno_ref, mpno_chk_btn)) return false; //휴대전화

            //판매자 수정 단독
            let guid_nm_ref = $("#guid_nm");

            if (guid_nm_ref.val() != "" && !nick_reg.test(guid_nm_ref.val())) {
                alert("안내담당자 이름은 공백 제외로 실명을 적어주세요 (20자 이내)");
                guid_nm_ref.focus();
                return false;
            }

            let guid_email_ref = $("#guid_email");

            if (guid_email_ref.val() != "" && !email_reg.test(guid_email_ref.val())) {
                alert(not_valid_email);
                guid_email_ref.focus();
                return false;
            }

            let cllr_nm_ref = $("#cllr_nm");
            let cllr_telno_ref = $("#cllr_telno");

            //콜센터
            if (cllr_nm_ref.val() != "" && !nick_reg.test(cllr_nm_ref.val())) {
                alert("고객센터 담당자 이름은 공백 제외로 실명을 적어주세요 (20자 이내)");
                guid_nm_ref.focus();
                return false;
            }

            if (cllr_telno_ref.val() != "" && !mpno_reg.test(cllr_telno_ref.val())) {
                alert(not_valid_mpno);
                cllr_telno_ref.focus();
                return false;
            }

            <%--let prev_pwd = "${seller.pwd}";--%>
            // if (pwd_ref.val() == "") pwd_ref.val(prev_pwd); //새 비밀번호를 입력하지 않은 경우 기존 비밀번호를 넣는다.
            form.submit();
        });
    });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

