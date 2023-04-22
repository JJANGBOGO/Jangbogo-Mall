function validateProduct () {
    let prod_cd = $("#seler_prod_cd"); //상품 코드
    if (prod_cd.val() === "") {
        alert("상품 코드를 입력해 주세요");
        prod_cd.focus();
        return false;
    }

    //카테고리 잘 모르겠슈...

    let name = $("#name"); //상품 이름
    if ($.trim(name.val()) === "") {
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
    if ($.trim(ctent.val()) === "") {
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


    return true;
}