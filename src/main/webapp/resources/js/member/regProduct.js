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

    let origin = $("#orplc"); //원산지

    if ($.trim(origin.val()) === "") {
        alert("원산지를 입력해 주세요");
        origin.focus();
        return false;
    }

    //판매단위 select

    let weight = $("#weight");

    if ($.trim(weight.val()) === "") {
        alert("중량을 입력해 주세요(단위 포함)");
        weight.focus();
        return false;
    }

    let mft_tm = $("#mft_tm");

    if (mft_tm.val() === "") {
        alert("제조 일자를 선택해 주세요");
        return false;
    }

    let distb_tlmt = $("#distb_tlmt");

    if (distb_tlmt.val() === "") {
        alert("유통기한을 선택해 주세요");
        return false;
    }

    //판매기간
    let sle_date_type = $("input[name=sle_date_type]:checked").val();
    let start_tm = $("#sle_start_tm").val();
    let end_tm = $("#sle_end_tm").val();

    if (sle_date_type === "2" && start_tm === "" && end_tm === "") { //판매기간이 기간인데 날짜 입력 안한경우
        alert("판매 시작날짜와 종료날짜를 선택해 주세요");
        return false;
    }

    //보관 유형 (radio)
    let sfkp_type = $("");

    if (sfkp_type === "") {
        alert("보관 유형을 선택해 주세요");
        return false;
    }

    //1인 최대 구매수량
    let max_quty = $("#max_sle_quty");
    if (max_quty.val() === "" || max_quty.val() > 10) {
        alert("최대 구매 수량을 10개 이하로 입력해 주세요");
        return false;
    }

    //상품 재고 수량
    // let





    return true;
}