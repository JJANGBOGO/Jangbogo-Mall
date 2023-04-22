function validateProduct() {
    let prod_cd = $("#seler_prod_cd"); //상품 코드
    if (prod_cd.val() === "") {
        alert("상품 코드를 입력해 주세요");
        prod_cd.focus();
        return false;
    }

    //카테고리 잘 모르겠슈...

    let name = $("#name"); //상품 이름
    if ($.trim(name.val()) === "") { //text
        alert("상품 이름을 입력해 주세요");
        name.focus();
        return false;
    }

    if (name.val().length > 30) {
        alert("상품 이름은 30자 내로 입력해 주세요");
        name.focus();
        return false;
    }

    let ctent = $("#ctent"); //상품 설명
    if ($.trim(ctent.val()) === "") { //text
        alert("상품 설명을 입력해 주세요");
        ctent.focus();
        return false;
    }

    let price = $("#prc"); //상품 가격
    if (price.val() === "") {
        alert("상품 가격을 입력해 주세요");
        price.focus();
        return false;
    }

    //대표 이미지 업로드...

    let dc_state_cd = $("input[name=dc_state_cd]:checked").val();
    //할인율 radio
    let dc_rate = $("#dc_rate");
    const dc_applied = "1"; //할인 적용 여부


    if (dc_state_cd === "") { //검사기에서 악성으로 제거한 경우
        alert("할인 여부를 선택해 주세요");
        return false;
    }

    if (dc_state_cd === dc_applied && dc_rate.val() === "") {
        alert("할인율을 입력해 주세요");
        dc_rate.focus();
        return false;
    }

    let dsply_state_cd = $("input[name=dsply_state_cd]:checked").val();

    if (dsply_state_cd === "") {
        alert("전시 상태를 선택해 주세요");
        return false;
    }

    let origin = $(); //원산지

    return true;
}