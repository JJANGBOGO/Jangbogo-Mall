let imgUrl = (checked) => {
    return checked ? "/img/checked.png" : "/img/unchecked.png";
};

let showRawPwd = (checkboxId, inputId, iconId) => {
    const checked = $(checkboxId).is(":checked");
    $(inputId).attr("type", !checked ? "text" : "password");
    $(iconId).attr(
        "class",
        !checked ? "fa-regular fa-eye" : "fa-regular fa-eye-slash"
    );
};

$("#show_pwd_toggle").click(() =>
    showRawPwd("#show_pwd", "#pwd", "#eye")
);
$("#show_pwd_confirm_toggle").click(() =>
    showRawPwd("#show_pwd_confirm", "#pwd_confirm", "#eye2")
);


//이메일 alert 검사
function validateEmailAlert(email_ref) {
    if (email_ref.val() === "") {
        alert(email_empty);
        email_ref.focus();
        return false;
    }

    if (!email_reg.test(email_ref.val())) {
        alert(not_valid_email);
        email_ref.focus();
        return false;
    }
    return true;
}

function chkEmailAlert(email_ref, email_chk_btn) {
    if (!email_chk_btn.is(":disabled")) {
        alert(chk_email_required);
        email_ref.focus();
        return false;
    }
    return true;
}

function validatePwdAlert(pwd_ref) {
    if (pwd_ref.val() === "") {
        alert(pwd_empty);
        pwd_ref.focus();
        return false;
    }

    if (!pwd_reg.test(pwd_ref.val())) {
        alert(not_valid_pwd);
        pwd_ref.focus();
        return false;
    }
    return true;
}

//수정 시 사용하는 비밀번호 체크
function validateNewPwdAlert(pwd_ref) {
    if (pwd_ref.val() !== "" && !pwd_reg.test(pwd_ref.val())) {
        alert(not_valid_pwd);
        pwd_ref.focus();
        return false;
    }
    return true;
}

function validatePwdConfirmAlert(pwd_ref, pwd_confirm_ref) {
    if (pwd_ref.val() !== pwd_confirm_ref.val()) {
        alert(not_valid_pwd_confirm);
        pwd_confirm_ref.focus();
        return false;
    }
    return true;
}

//전화인증 유효성 alert
function validateMpnoAlert(mpno_ref) {
    if (mpno_ref.val() === "") {
        alert(mpno_empty);
        mpno_ref.focus();
        return false;
    }

    if (!mpno_reg.test(mpno_ref.val())) {
        alert(not_valid_mpno);
        mpno_ref.focus();
        return false;
    }
    return true;
}

//전화인증여부 alert
function chkMpnoAlert(mpno_ref, mpno_chk_btn) {
    if (!mpno_chk_btn.is(":disabled")) {
        alert(chk_mpno_required);
        mpno_ref.focus();
        return false;
    }
    return true;
}

//사업자 alert
function validateBrnoAlert(brno_ref) { //인증버튼 상태는 제외.
    if (brno_ref.val() === "") {
        alert("사업자 번호를 입력해 주세요");
        brno_ref.focus();
        return false;
    }

    if ((brno_ref.val().includes("-"))) {
        alert("-제외 숫자만 입력해 주세요");
        brno_ref.focus();
        return false;
    }
    return true;
}

//주소 alert
function validateAddrAlert(addr_base_ref, addr_dtl_ref) {

    if (addr_base_ref.val() === "") { //readonly
        alert(addr_base_empty);
        return false;
    }

    if (addr_dtl_ref.val() === "") {
        alert(addr_dtl_empty);
        addr_dtl_ref.focus();
        return false;
    }
    return true;
}

//브랜드 배너, 프사 이미지 길이 alert
function validateBrndImgAlert(bnr_list, prof_list) {
    if (bnr_list.length > 1) {
        alert(bnr_overflow);
        return false;
    }

    if (prof_list.length > 1) {
        alert(prof_overflow);
        return false;
    }
    return true;
}

//브랜드 내용 alert
function validateBrndCnAlert(content_ref) {
    if (content_ref.val() === "") {
        alert("브랜드 내용을 입력해 주세요");
        content_ref.focus();
        return false;
    }
    return true;
}

//브랜드명 alert
function validateBrndNameAlert(cpnm_ref) { //인증버튼 상태 제외

    if (cpnm_ref.val() === "") {
        alert(brnd_name_empty);
        cpnm_ref.focus();
        return false;
    }

    if (!nick_reg.test(cpnm_ref.val())) {
        alert(not_valid_brnd_nm);
        cpnm_ref.focus();
        return false;
    }
    return true;
}

//브랜드명 중복검사 alert
function chkBrndNameAlert(cpnm_ref, cpnm_chk_btn) {
    if (!cpnm_chk_btn.is(":disabled")) {
        alert(chk_brnd_name_required);
        cpnm_ref.focus();
        return false;
    }
    return true;
}

// 브랜드명 keyup 에러메세지
function cpnmErrMsg(cpnm, err_ref) {
    if (cpnm === "") {
        err_ref.html(brnd_name_empty);
        return false; //필요
    } else err_ref.empty();

    if (!nick_reg.test(cpnm)) err_ref.html(not_valid_brnd_nm);
    else err_ref.empty();
}

//비번 keyup 에러메세지
function pwdErrMsg(pwd, err_ref) {
    if (pwd === "") {
        err_ref.html(pwd_empty);
        return false;
    } else err_ref.empty();

    if (!pwd_reg.test(pwd)) {
        err_ref.html(not_valid_pwd);
        return false;
    } else err_ref.empty();
}

//새 비번 keyup 에러메세지
function newPwdErrMsg(pwd, err_ref) {
    if (pwd !== "" && !pwd_reg.test(pwd)) {
        err_ref.html(not_valid_pwd);
        return false;
    } else err_ref.empty();
}

//휴대전화 keyup 에러메세지
function mpnoErrMsg(mpno, err_ref) {
    if (mpno === "") {
        err_ref.html(mpno_empty);
        return false;
    } else err_ref.empty();

    if (!mpno_reg.test(mpno)) {
        err_ref.html(not_valid_mpno);
        return false;
    } else err_ref.empty();
}

//닉네임 keyup 에러메세지
function nickErrMsg(nick, err_ref) {
    if (nick === "") {
        err_ref.html(nick_empty);
        return false;
    } else err_ref.empty();

    if (!nick_reg.test(nick)) {
        err_ref.html(not_valid_nick);
    } else err_ref.empty();
}

//닉네임 alert
function validateNickAlert(nick_ref) {
    if (nick_ref.val() === "") {
        alert(nick_empty);
        nick_ref.focus();
        return false;
    }

    if (!nick_reg.test(nick_ref.val())) {
        alert(not_valid_nick);
        nick_ref.focus();
        return false;
    }
    return true;
}

//닉네임 중복검사
function chkNickAlert(nick_ref, nick_chk_btn) {
    if (!nick_chk_btn.is(":disabled")) {
        alert(chk_nick_required);
        nick_ref.focus();
        return false;
    }
    return true;
}

//비번확인 keyup 에러메세지
function pwdConfirmErrMsg (pwd, pwd_confirm, err_ref) {
    if (pwd_confirm == "") {
        err_ref.html(pwd_confirm_empty);
        return false;
    } else err_ref.empty();

    if (pwd_confirm != pwd) {
        err_ref.html(not_valid_pwd_confirm);
        return false;
    } else err_ref.empty();
}
