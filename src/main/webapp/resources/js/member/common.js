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

