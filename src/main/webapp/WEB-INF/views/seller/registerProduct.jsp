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
                    action="/seller/register/product"
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
                            <div class="error-msg seler-prod-cd"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>카테고리<span>*</span></label>
                        </div>
                        <div class="input-box category">
                            <div class="input">
                                <select name="cate_idx">
                                    <option selected>선택</option>
                                    <option value="1">과일</option>
                                    <option value="2">채소</option>
                                    <option value="3">수산물</option>
                                    <option value="4">축산/계란</option>
                                    <option value="5">생수/음료</option>
                                    <option value="6">간편요리</option>
                                    <option value="7">유제품/아이스크림</option>
                                    <option value="8">장/소스/드레싱</option>
                                    <option value="9">간식/디저트</option>
                                    <option value="10">주류</option>
                                    <option value="11">건강</option>
                                </select>
                            </div>
                            <div class="input">
                                <select name="cate_idx">
                                    <option selected>선택</option>
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
                                        name="ctent"
                                        placeholder="상품에 대한 설명을 입력해주세요"
                                ></textarea>
                            </div>
                            <div class="error-msg ctent"></div>
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
                                <label class="upload-label" for="upload_path">
                                    상품 대표 이미지 선택
                                    <img src="/img/upload_dir.png">
                                </label>
                                <div class="upload-input upload-path">
                                    <input type="file" name="upload_path" id="upload_path">
                                </div>
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="upload_path_btn">업로드</button>
                        </div>
                    </div>
                    <div class="upload-result upload-path">
                        <ul></ul>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>할인 적용 여부<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="dc_state_cd" value="1" checked/>
                                <span>할인</span>
                            </label>
                            <label>
                                <input type="radio" name="dc_state_cd" value="2"/>
                                <span>할인 미적용</span>
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
                                <input type="radio" name="dsply_state_cd" value="2"/>
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
                                        name="ORPLC"
                                        id="ORPLC"
                                        type="text"
                                        placeholder="원산지를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg bsplc-dtl"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>판매단위<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <select name="sle_unit">
                                    <option>개</option>
                                    <option>봉</option>
                                    <option>박스</option>
                                    <option>리터</option>
                                </select>
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
                            <div class="error-msg brnd-cn"></div>
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
                    <div class="input-line">
                        <div class="input-label">
                            <label>보관 유형<span>*</span></label>
                        </div>
                        <fieldset class="sfkp-type">
                            <label>
                                <input type="radio" name="state" value="1" checked/>
                                <span>상온</span>
                            </label>
                            <label>
                                <input type="radio" name="state" value="2"/>
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
                                        id="invent"
                                        name="email"
                                        type="number"
                                        placeholder="최소 1 이상의 수량을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg email"></div>
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
<script src="/js/upload/common.js"></script>
<script>
    let msg = "${msg}";
    if (msg == "EXCEPTION_ERR") alert("가입 도중 오류가 발생했습니다 다시 시도해 주세요");

    const dc_applied = "1"; //할인 적용 여부
    const limit_sle = "2"; //기간한정판매

    $(document).ready(function () {
        //초기 판매 기간 hide 기본값은 영구 판매
        $(".input-line.sle-date-type").hide();

        //할인율 입력칸 toggle
        $("input[name=dc_state_cd]").click(function () {
            let dc_state = $("input[name=dc_state_cd]:checked").val();
            const dc_input = $(".input-line.dc-rate");

            if (dc_state === dc_applied) dc_input.show();
            else dc_input.hide();
        });

        //판매 기간 입력칸 toggle
        $("input[name=sle_date_type]").click(function () {
            const sle_date_type = $("input[name=sle_date_type]:checked").val();
            const sle_input = $(".input-line.sle-date-type");

            if (sle_date_type === limit_sle) sle_input.show();
            else sle_input.hide();
        });

        //파일 업로드
        let clone_upload_path = $("upload-input.upload-path").clone();
        let clone_prod_path = $(".upload-input.profile").clone();

        //.uploadResult ul의 참조를 얻어온다.
        let upload_path_list = $(".upload-result.upload-path ul");
        let upload_products_list = $(".upload-result.products ul");

        //상품 대표이미지 업로드
        $("#upload_path_btn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            e.preventDefault();
            const formData = new FormData();
            const inputFile = $("input[name='upload_path']");

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
            const inputFile = $("input[name='products']");

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

            $(".reg-form").submit();
        });

    });
</script>
</body>
</html>
