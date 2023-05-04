<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/radioBtn.css"/>
    <link rel="stylesheet" href="/css/seller/registerForm.css"/>
    <link rel="stylesheet" href="/css/seller/registerProduct.css?v2"/>
    <link rel="stylesheet" href="/css/upload.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="register-page">
    <div class="reg-page-center">
        <div class="reg-header">상품 등록</div>
        <div class="section-line"></div>
        <div class="reg-form-box">
            <form
                    class="reg-form"
                    action="/seller/register/productInfo"
                    method="post"
            >
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 코드<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="seler_prod_cd"
                                        name="seler_prod_cd"
                                        type="number"
                                        placeholder="코드를 등록하면 쉽게 상품을 관리할 수 있어요"

                                />
                            </div>
                            <div class="error-msg seler-prod-cd">9자 이내의 숫자로 작성해 주세요</div>
                        </div>
<%--                        <div class="btn-space"></div>--%>
                        <div class="btn-space">
                            <button class="duplicate" id="seler-prod-check">중복확인</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>카테고리<span>*</span></label>
                        </div>
                        <div class="input-box category">
                            <div class="input" id="input2">
                                <select name="cate_idx" id="First_cate_idx">
                                    <option selected>선택</option>
                                    <option value="01">과일</option>
                                    <option value="02">채소</option>
                                    <option value="03">수산물</option>
                                    <option value="04">축산/계란</option>
                                    <option value="05">생수/음료</option>
                                    <option value="06">간편요리</option>
                                    <option value="07">유제품/아이스크림</option>
                                    <option value="08">장/소스/드레싱</option>
                                    <option value="09">간식/디저트</option>
                                    <option value="10">주류</option>
                                    <option value="11">건강</option>
                                </select>
                            </div>
                            <div class="input" id="input3">
                                <select name="cate_idx2" id="Second_cate_idx">
                                    <option>선택</option>
                                </select>
                            </div>
                            <div class="error-msg cate-idx"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 이름<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="name"
                                        id="name"
                                        type="text"
                                        placeholder="상품 이름을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg name"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 설명<span>*</span></label>
                        </div>
                        <div class="input-box textarea">
                            <div class="input textarea">
                                <textarea
                                        id="ctent"
                                        name="content"
                                        placeholder="상품에 대한 설명을 입력해주세요"
                                ></textarea>
                            </div>
                            <div class="error-msg content"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 가격<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="prc"
                                        name="prc"
                                        type="number"
                                        placeholder="가격을 입력해주세요"
                                />
                            </div>
                            <div class="error-msg prc"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>대표 이미지<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <label class="upload-label" for="repr-path">
                                    상품 대표 이미지 선택
                                    <img src="/img/upload_dir.png">
                                </label>
                                <div class="upload-input repr-path">
                                    <input type="file" name="repr-path" id="repr-path">
                                </div>
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="upload_path_btn">업로드</button>
                        </div>
                    </div>
                    <div class="upload-result repr-path">
                        <ul></ul>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>할인 적용 여부<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="dc_state_cd" value="2" checked/>
                                <span>할인 미적용</span>
                            </label>
                            <label>
                                <input type="radio" name="dc_state_cd" value="1"/>
                                <span>할인</span>
                            </label>
                        </fieldset>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line dc-rate">
                        <div class="input-label">
                            <label>할인율<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="dc_rate"
                                        name="dc_rate"
                                        type="number"
                                        placeholder="할인율을 입력해주세요"
                                />
                            </div>
                            <div class="error-msg dc-rate"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 전시 상태<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="dsply_state_cd" value="1" checked/>
                                <span>전시</span>
                            </label>

                            <label>
                                <input type="radio" name="dsply_state_cd" value="0"/>
                                <span>비전시</span>
                            </label>
                        </fieldset>
                        <div class="btn-space"></div>
                    </div>
                    <h3 class="section-header">상품 상세 정보</h3>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="ORPLC">원산지<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="orplc"
                                        id="orplc"
                                        type="text"
                                        placeholder="원산지를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg orplc"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>판매단위<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="sle_unit"
                                        id="sle_unit"
                                        type="text"
                                        placeholder="판매단위를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg bsplc-dtl"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>중량<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="weight"
                                        id="weight"
                                        type="text"
                                        placeholder="판매 단위 당 중량을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg weight"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>제조일자<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="mft_tm"
                                        id="mft_tm"
                                        type="date"
                                />
                            </div>
                            <div class="error-msg mft-tm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>유통기한<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="distb_tlmt"
                                        id="distb_tlmt"
                                        type="date"
                                />
                            </div>
                            <div class="error-msg distb-tlmt"></div>
                        </div>
                        <div class="btn-space"></div>
<%--                        <div class="btn-space">--%>
<%--                            <button class="duplicate">기간확인</button>--%>
<%--                        </div>--%>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>판매 기간<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="sle_date_type" value="1" checked/>
                                <span>기간 없음</span>
                            </label>
                            <label>
                                <input type="radio" name="sle_date_type" value="2"/>
                                <span>한정 판매</span>
                            </label>
                        </fieldset>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line sle-date-type">
                        <div class="input-label">
                            <label>판매 시작일자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="sle_start_tm"
                                        id="sle_start_tm"
                                        type="date"
                                />
                            </div>
                            <div class="error-msg sle-start-tm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line sle-date-type">
                        <div class="input-label">
                            <label>판매 종료일자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="sle_end_tm"
                                        id="sle_end_tm"
                                        type="date"
                                />
                            </div>
                            <div class="error-msg sle-end-tm"></div>
                        </div>
<%--                        <div class="btn-space"></div>--%>
                        <div class="btn-space">
                            <button class="duplicate" id="date_check">기간확인</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>보관 유형<span>*</span></label>
                        </div>
                        <fieldset class="sfkp-type">
                            <label>
                                <input type="radio" name="state" value="2" checked/>
                                <span>상온</span>
                            </label>
                            <label>
                                <input type="radio" name="state" value="1"/>
                                <span>냉장</span>
                            </label>
                            <label>
                                <input type="radio" name="state" value="3"/>
                                <span>냉동</span>
                            </label>
                        </fieldset>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>1회 최대 구매수량<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="max_sle_quty"
                                        name="max_sle_quty"
                                        type="number"
                                        placeholder="1회 최대 구매수량을 입력해 주세요"
                                        max="10"
                                        min="1"
                                />
                            </div>
                            <div class="error-msg max-ale-quty"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 재고 수량<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="inv_quty"
                                        name="inv_quty"
                                        type="number"
                                        placeholder="최소 1 이상의 수량을 입력해 주세요"
                                        min="1"
                                />
                            </div>
                            <div class="error-msg inv_quty"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>주의사항<span>*</span></label>
                        </div>
                        <div class="input-box textarea">
                            <div class="input textarea">
                                <textarea
                                        name="warn"
                                        id="warn"
                                        type="text"
                                        placeholder="상품 관련 주의사항을 입력해 주세요"
                                ></textarea>
                            </div>
                            <div class="error-msg warn"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 안내 사항<span>*</span></label>
                        </div>
                        <div class="input-box textarea">
                            <div class="input textarea">
                                <textarea
                                        id="guid"
                                        name="guid"
                                        type="text"
                                        placeholder="상품 안내 사항을 입력해 주세요"
                                ></textarea>
                            </div>
                            <div class="error-msg guid"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 상세이미지들<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <label class="upload-label" for="products">
                                    상세 이미지 선택
                                    <img src="/img/upload_dir.png">
                                </label>
                                <div class="upload-input products">
                                    <input type="file" name="products" id="products" multiple>
                                </div>
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="upload_products">업로드</button>
                        </div>
                    </div>
                    <div class="upload-result products">
                        <ul></ul>
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
<script src="/js/member/regEx.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/member/common.js"></script>
<script src="/js/member/regProduct.js"></script>
<script src="/js/upload/common.js"></script>
<script>
    let msg = "${msg}";
    if (msg == "EXCEPTION_ERR") alert("가입 도중 오류가 발생했습니다 다시 시도해 주세요");
    if (msg == "REG_PROD_OK") alert("상품이 등록되었습니다. 승인 대기중입니다.");
    if (msg == "DUPLICATE_NUMBER") alert("중복된 번호입니다. 다시 입력해 주세요.");
    const dc_applied = "1"; //할인 적용 여부
    const limit_sle = "2"; //기간한정판매

    //할인율 input display toggle
    function toggleDcInput() {
        let dc_state = $("input[name=dc_state_cd]:checked").val();
        const dc_input = $(".input-line.dc-rate");

        if (dc_state === dc_applied) dc_input.show();
        else dc_input.hide();
    }

    //판매기간 input display toggle
    function toggleSleDateInput() {
        const sle_date_type = $("input[name=sle_date_type]:checked").val();
        const sle_input = $(".input-line.sle-date-type");

        if (sle_date_type === limit_sle) sle_input.show();
        else sle_input.hide();
    }

    function S_fruit() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0101' id='0101'>딸기/블루베리/베리류</option>";
        tmp += "<option value='0102' id='0102'>사과/배</option>";
        tmp += "<option value='0103' id='0103'>자두/복숭아/포도</option>";
        tmp += "<option value='0104' id='0104'>귤/한라봉</option>";
        tmp += "<option value='0105' id='0105'>키위/망고</option>";
        tmp += "<option value='0106' id='0106'>수박/메론/참외</option>";
        tmp += "<option value='0107' id='0107'>바나나/오렌지/파인애플</option>";
        tmp += "<option value='0108' id='0108'>냉동과일/간편과일</option>";
        return tmp;
    }

    function S_vege() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0201' id='0201'>쌈채소</option>";
        tmp += "<option value='0202' id='0202'>샐러드/손질채소</option>";
        tmp += "<option value='0203' id='0203'>두부</option>";
        tmp += "<option value='0204' id='0204'>버섯류</option>";
        tmp += "<option value='0205' id='0205'>시금치/나물</option>";
        tmp += "<option value='0206' id='0206'>감자/고구마/당근/뿌리식품</option>";
        tmp += "<option value='0207' id='0207'>오이/고추/열매</option>";
        tmp += "<option value='0208' id='0208'>양파/마늘/파</option>";
        return tmp;
    }

    function S_seafood() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0301' id='0301'>생선</option>";
        tmp += "<option value='0302' id='0301'>조개</option>";
        tmp += "<option value='0303' id='0301'>새우/게/갑각류</option>";
        tmp += "<option value='0304' id='0301'>오징어/낙지</option>";
        tmp += "<option value='0305' id='0301'>김/미역</option>";
        tmp += "<option value='0306' id='0301'>건수산물</option>";
        return tmp;
    }

    function S_livestock() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0401' id='0401'>소고기</option>";
        tmp += "<option value='0402' id='0402'>돼지고기</option>";
        tmp += "<option value='0403' id='0403'>닭고기</option>";
        tmp += "<option value='0404' id='0404'>계란</option>";
        return tmp;
    }

    function S_drink() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0501' id='0501'>생수/탄산수</option>";
        tmp += "<option value='0502' id='0502'>차/커피/주스</option>";
        tmp += "<option value='0503' id='0503'>탄산/음료</option>";
        return tmp;
    }

    function S_retort() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0601' id='0601'>라면/면류</option>";
        tmp += "<option value='0602' id='0602'>즉석밥/즉석국</option>";
        tmp += "<option value='0603' id='0603'>참치/햄/통조림</option>";
        tmp += "<option value='0604' id='0604'>밀키트</option>";
        return tmp;
    }

    function S_dairy() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0701' id='0701'>우유/두유</option>";
        tmp += "<option value='0702' id='0702'>치즈/버터/마가린</option>";
        tmp += "<option value='0703' id='0703'>아이스크림</option>";
        tmp += "<option value='0704' id='0704'>요구르트/요거트</option>";
        tmp += "<option value='0705' id='0705'>생크림/휘핑크림</option>";
        return tmp;
    }

    function S_source() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0801' id='0801'>육수/액젓</option>";
        tmp += "<option value='0802' id='0802'>장류/식초</option>";
        tmp += "<option value='0803' id='0803'>소스/드레싱</option>";
        tmp += "<option value='0804' id='0804'>물엿/조청</option>";
        return tmp;
    }

    function S_dessert() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='0901' id='0901'>과자/초콜릿/쿠키</option>";
        tmp += "<option value='0902' id='0902'>베이커리/잼</option>";
        tmp += "<option value='0903' id='0903'>사탕/젤리/껌</option>";
        tmp += "<option value='0904' id='0904'>전통과자,떡</option>";
        tmp += "<option value='0905' id='0905'>시리얼</option>";
        return tmp;
    }

    function S_alcohol() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='1001' id='1001'>소주/맥주</option>";
        tmp += "<option value='1002' id='1002'>수입주류</option>";
        tmp += "<option value='1003' id='1003'>전통주류</option>";
        return tmp;
    }

    function S_healthy() {
        let tmp = "<option>선택</option>";
        tmp += "<option value='1101' id='1101'>영양식/선식</option>";
        tmp += "<option value='1102' id='1102'>유산균</option>";
        tmp += "<option value='1103' id='1103'>홍삼/인삼</option>";
        tmp += "<option value='1104' id='1104'>건강즙/음료</option>";
        tmp += "<option value='1105' id='1105'>건강분만</option>";
        tmp += "<option value='1106' id='1106'>다이어트식품</option>";
        return tmp;
    }



    function selerProdCheck(selerProdInput, selerProdBtn) {
        if(!selerProdBtn.is(":disabled")) {
            alert("상품코드 중복확인 필수입니다.");
            selerProdInput.foucs();
            return false;
        }
        return true;
    }

    function dateCheck(dateInput, dateBtn) {
        if(!dateBtn.is(":disabled")) {
            alert("기간확인을 해주세요.")
            dateInput.focus();
            return false;
        }
        return true;
    }

    $(document).ready(function () {
        toggleDcInput();
        toggleSleDateInput();




        $("select[name=cate_idx]").change(function (e) {
            //val은 대분류에만 해당하며, 카테고리 테이블의 id값과 일치함 //카테고리 아이디 받아서 배송방식 엮어오기
            let val = $("#First_cate_idx option:selected").val(); //value값 출력됨 //"01"

            //id는 개별 상품의 카테고리 아이디
            let id;
            if (val == "01") {
                $("#Second_cate_idx").html(S_fruit).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id"); //0101
                    $(".input-box.category").data("cateID", id);
                })
            }
            if (val == "02") {
                $("#Second_cate_idx").html(S_vege).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "03") {
                $("#Second_cate_idx").html(S_seafood).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "04") {
                $("#Second_cate_idx").html(S_livestock).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "05") {
                $("#Second_cate_idx").html(S_drink).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "06") {
                $("#Second_cate_idx").html(S_retort).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "07") {
                $("#Second_cate_idx").html(S_dairy).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "08") {
                $("#Second_cate_idx").html(S_source).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "09") {
                $("#Second_cate_idx").html(S_dessert).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "10") {
                $("#Second_cate_idx").html(S_alcohol).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            if (val == "11") {
                $("#Second_cate_idx").html(S_healthy).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_cate_idx option:selected").attr("id");
                    $(".input-box.category").data("cateID", id);

                })
            }
            $(".input-box.category").data("Ffloor", val);
        })

        //할인율 입력칸 toggle
        $("input[name=dc_state_cd]").click(function () {
            toggleDcInput();
        });

        //판매 기간 입력칸 toggle
        $("input[name=sle_date_type]").click(function () {
            toggleSleDateInput();
        });

        //파일 업로드
        let clone_upload_path = $("upload-input.repr-path").clone();
        let clone_prod_path = $(".upload-input.profile").clone();

        //.uploadResult ul의 참조를 얻어온다.
        let upload_path_list = $(".upload-result.repr-path ul");
        let upload_products_list = $(".upload-result.products ul");

        $("#seler-prod-check").on("click", function(e){
            e.preventDefault();
            let seler_prod_cd = $('input[name=seler_prod_cd]').val();
            // let sle_start_tm = $('input[name=sle_start_tm]').val();
            // let sle_end_tm = $('input[name=sle_end_tm]').val();

            if(seler_prod_cd === "" || seler_prod_cd.length > 9) {
                alert("알맞은 상품 코드를 입력해 주세요");
                seler_prod_cd.focus();
                return false;
            }


            $.ajax({
                type: 'POST',
                url: '/seller/register/checkData/selerProdCd',
                headers : { "content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({ seler_prod_cd: seler_prod_cd}),
                success: function(msg) {
                    if (msg === "OK") {
                        alert("사용 가능합니다.");
                        $("#seler-prod-check").attr("disabled", true);
                        $('input[name=seler_prod_cd]').attr("readonly", true);

                    } else if(msg === "DUPLICATE_NUMBER"){
                        alert("중복됩니다");
                    }
                },
                error: function() {alert("요청중 오류가 ..발생")}
            })

        })

        $("#date_check").on("click", function(e) {
            e.preventDefault();

            let sle_start_tm = $('input[name=sle_start_tm]').val();
            let sle_end_tm = $('input[name=sle_end_tm]').val();

            $.ajax({
                type: 'POST',
                url: '/seller/register/checkData/sleTm',
                headers : { "content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({sle_start_tm: sle_start_tm, sle_end_tm: sle_end_tm}),
                success: function(msg) {
                    if(msg === "DEFICIENT_VALUES") {
                        alert("두 개의 날짜를 같이 채워주세요.");
                    } else if(msg === "SAME_DATE") {
                        alert("동일한 날짜 입니다. 다시 입력해주세요.");
                    } else if(msg === "CONFIRM") {
                        alert("확인되었습니다.");
                        $("#date_check").attr("disabled", true);
                        $('input[name=sle_start_tm]').attr("readonly", true);
                        $('input[name=sle_end_tm]').attr("readonly", true);
                    } else if(msg === "RETURN") {
                        alert("일치하지 않은 형식입니다. 다시 확인해 주세요.")
                        $('input[name=sle_start_tm]').focus();
                    }
                },
                error: function() {alert("요청중 오류가 ..발생")}
            })

        })

        //상품 대표이미지 업로드
        $("#upload_path_btn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            e.preventDefault();
            const formData = new FormData();
            const inputFile = $("input[name=repr-path]");
            console.log("inputFile[0].files==" + inputFile[0].files);
            if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
                alert("상품 대표이미지를 업로드 해주세요");
                return false;
            }
            checkFileList(inputFile[0].files, formData);

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    upload_path_list.append(showUploadedFile(result));
                    $(".upload_path_btn.bnr").html(clone_upload_path.html());
                }
            });
        });

        //상세 이미지 업로드
        $("#upload_products").on("click", function (e) {
            e.preventDefault();
            const formData = new FormData();
            const inputFile = $("input[name=products]");

            if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
                alert("최소 3장 이상의 상세 이미지를 업로드 해주세요");
                return false;
            }
            checkFileList(inputFile[0].files, formData);

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    upload_products_list.append(showUploadedFile(result));
                    $(".upload-input.profile").html(clone_prod_path.html()); //파일 초기화
                }
            });
        });

        //가입하기 버튼 클릭
        $(".reg-confirm").click(function (e) {
            e.preventDefault();
            let form = $(".reg-form");

            let selerProdInput = $("#seler_prod_cd");
            let selerProdBtn = $("#seler-prod-check");

            if(!selerProdCheck(selerProdInput, selerProdBtn)) return false;

            let dateInput = $("#sle_start_tm");
            let dateBtn = $("#date_check");
            if($("input[name=sle_date_type]").val() == 2) {
                if (!dateCheck(dateInput, dateBtn)) return false;
            }
            // if (!validateProduct()) return false;  //유효성 검사 추후 개발 예정

            let base_path = "/display?fileName=";

            let upload_url = base_path + $(".upload-result.repr-path ul li").data("upload-path");

            //대표이미지
            let repr_file = "<input type='hidden' name='upload_path' value=" + upload_url + ">";
            form.append(repr_file);

            //상세이미지들
            let list = $(".upload-result.products ul li");
            console.log("list.....", list);
            let str = "";
            list.each((i, obj) => {
                let jobj = $(obj);
                str += "<input type='hidden' name='files[" + i + "].UUID' value='" + jobj.data("uuid") + "'>"
                    + "<input type='hidden' name='files[" + i + "].name' value='" + jobj.data("name") + "'>"
                    + "<input type='hidden' name='files[" + i + "].UPLOAD_PATH' value='/display?fileName=" + jobj.data("upload-path") + "'>"
                    + "<input type='hidden' name='files[" + i + "].SORT_ODR' value='" + i + "'>"
            });
            console.log("결과ㅣ>>>" + str);
            form.append(str);
            form.submit();
        });

    });
</script>
</body>
</html>
