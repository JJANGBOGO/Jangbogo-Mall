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
function validateEmailAlert (email_ref, email_chk_btn) {
    if (email_ref.val() == "") {
        alert(email_empty);
        email_ref.focus();
        return false;
    }

    if (!email_reg.test(email_ref.val())) {
        alert(not_valid_email);
        email_ref.focus();
        return false;
    }

    if (!email_chk_btn.is(":disabled")){
        alert(chk_email_required);
        email_ref.focus();
        return false;
    }
    return true;
}

function validatePwdAlert (pwd_ref) {
    if (pwd_ref.val() == "") {
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

function validatePwdConfirmAlert (pwd_ref, pwd_confirm_ref) {
    if (pwd_ref.val() != pwd_confirm_ref.val()) {
        alert(not_valid_pwd_confirm);
        pwd_confirm_ref.focus();
        return false;
    }
    return true;
}

function validateMpnoAlert (mpno_ref, mpno_chk_btn) {
    if (mpno_ref.val() == "") {
        alert(mpno_empty);
        mpno_ref.focus();
        return false;
    }

    if (!mpno_reg.test(mpno_ref.val())) {
        alert(not_valid_mpno);
        mpno_ref.focus();
        return false;
    }

    if (!mpno_chk_btn.is(":disabled")) {
        alert(chk_mpno_required);
        mpno_ref.focus();
        return false;
    }
    return true;
}

function validateBrnoAlert (brno_ref) { //인증버튼 상태는 제외.
    if (brno_ref.val() == "") {
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

