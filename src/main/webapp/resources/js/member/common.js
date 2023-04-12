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

