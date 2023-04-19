<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/radioBtn.css"/>
    <link rel="stylesheet" href="/css/user/signupForm.css"/>
    <link rel="stylesheet" href="/css/upload.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="register-page">
    <div class="reg-page-center">
        <div class="reg-header">상품 등록</div>
        <div class="section-line"></div>
        <div class="reg-form-box">
            <form id="seller_register" class="reg-form" action="/seller/register" method="post">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">상품 코드<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="email"
                                        name="email"
                                        type="number"
                                        placeholder="코드를 등록하면 쉽게 상품을 관리할 수 있어요"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cpnm">카테고리<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="cpnm"
                                        id="cpnm2"
                                        type="text"
                                />
                                <select name="cate_idx">
                                    <option value="1">과일</option>
                                </select>
                            </div>
                            <div class="input">
                                <input
                                        name="cpnm"
                                        id="cpnm"
                                        type="text"
                                />
                                <select name="cate_idx">
                                    <option value="1">건조과일</option>
                                </select>
                            </div>
                            <div class="error-msg cpnm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="repr_nm">상품 이름<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="repr_nm"
                                        id="repr_nm"
                                        type="text"
                                        placeholder="대표자 이름을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg cpnm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd">상품 설명<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <textarea
                                        name="pwd"
                                        id="pwd"
                                        placeholder="상품에 대한 설명을 입력해주세요"
                                ></textarea>
                            </div>
                            <div class="error-msg pwd"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd_confirm">상품 가격<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd_confirm"
                                        type="number"
                                        placeholder="가격을 입력해주세요"
                                />
                            </div>
                            <div class="error-msg pwd-confirm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>할인 적용 여부<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="dc_state_cd" value="1" checked/>
                                <span>할인 적용</span>
                            </label>
                            <label>
                                <input type="radio" name="dc_state_cd" value="2"/>
                                <span>할인 미적용</span>
                            </label>
                        </fieldset>

                    </div>
<%--                    할인 적용일 때만 보이게--%>
<%--                    <div class="input-line">--%>
<%--                        <div class="input-label">--%>
<%--                            <label for="pwd_confirm">상품 가격<span>*</span></label>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <div class="input">--%>
<%--                                <input--%>
<%--                                        id=""--%>
<%--                                        type="number"--%>
<%--                                        placeholder="할인율을 입력해주세요"--%>
<%--                                />--%>
<%--                            </div>--%>
<%--                            <div class="error-msg pwd-confirm"></div>--%>
<%--                        </div>--%>
<%--                        <div class="btn-space"></div>--%>
<%--                    </div>--%>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 전시 상태<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="dlspy_state_cd" value="1" checked/>
                                <span>비전시</span>
                            </label>

                            <label>
                                <input type="radio" name="biz_type" value="2"/>
                                <span>전시</span>
                            </label>
                        </fieldset>
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
                            <label for="ORPLC">판매단위<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <%--                                <input--%>
                                <%--                                        name="ORPLC"--%>
                                <%--                                        id="ORPLC"--%>
                                <%--                                        type="text"--%>
                                <%--                                        placeholder="원산지를 입력해 주세요"--%>
                                <%--                                />--%>
                                <select name="sale_unit">
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
                                        name="brnd_cn"
                                        id="brnd_cn"
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
                                        name="brnd_cn"
                                        id="prod_date"
                                        type="date"
                                        placeholder="상품의 제조일자를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg brnd-cn"></div>
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
                                        name="brnd_cn"
                                        id="prod_d"
                                        type="date"
                                        placeholder="상품의 유통기한을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg brnd-cn"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>주의사항<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brnd_cn"
                                        id="warn"
                                        type="text"
                                        placeholder="상품 관련 주의사항을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg brnd-cn"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">1회 최대 구매수량<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="max_prod"
                                        name="email"
                                        type="number"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>보관 유형<span>*</span></label>
                        </div>
                        <fieldset>
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
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">상품 재고 수량<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="invent"
                                        name="email"
                                        type="number"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">상품 안내 사항<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="text"
                                        name="email"
                                        type="text"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>판매 기간<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="state" value="1" checked/>
                                <span>기간 없음</span>
                            </label>
                            <label>
                                <input type="radio" name="state" value="2"/>
                                <span>한정 판매</span>
                            </label>
                        </fieldset>
                    </div>
<%--                    한정 판매 checked일 때만 보여주기--%>
<%--                    <div class="input-line">--%>
<%--                        <div class="input-label">--%>
<%--                            <label>판매 시작일자</label>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <div class="input">--%>
<%--                                <input--%>
<%--                                        name="brnd_cn"--%>
<%--                                        id="start_date"--%>
<%--                                        type="date"--%>
<%--                                />--%>
<%--                            </div>--%>
<%--                            <div class="error-msg brnd-cn"></div>--%>
<%--                        </div>--%>
<%--                        <div class="btn-space"></div>--%>
<%--                    </div>--%>
<%--                    <div class="input-line">--%>
<%--                        <div class="input-label">--%>
<%--                            <label>판매 종료일자</label>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <div class="input">--%>
<%--                                <input--%>
<%--                                        name="brnd_cn"--%>
<%--                                        id="end_date"--%>
<%--                                        type="date"--%>
<%--                                />--%>
<%--                            </div>--%>
<%--                            <div class="error-msg brnd-cn"></div>--%>
<%--                        </div>--%>
<%--                        <div class="btn-space"></div>--%>
<%--                    </div>--%>
                    <div class="input-line">
                        <div class="input-label">
                            <label>대표 이미지<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <label class="upload-label" for="upload_bnr">상품 대표 이미지 선택<img src="/img/upload_dir.png"></label>
                                <div class="upload-input bnr">
                                    <input type="file" name="upload_bnr" id="upload_bnr">
                                </div>
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="bnr_upload_btn">업로드</button>
                        </div>
                    </div>
                    <div class="upload-result bnr">
                        <ul>

                        </ul>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>상품 상세이미지들<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <label class="upload-label" for="upload_profile">상세 이미지 선택<img
                                        src="/img/upload_dir.png"></label>
                                <div class="upload-input profile">
                                    <input type="file" name="upload_profile" id="upload_profile" multiple>
                                </div>
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="profile_upload_btn">업로드</button>
                        </div>
                    </div>
                    <div class="upload-result profile">
                        <ul>

                        </ul>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/regEx.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/member/common.js"></script>
<script src="/js/upload/common.js"></script>
<script>
    let msg = "${msg}";
    if (msg == "EXCEPTION_ERR") alert("가입 도중 오류가 발생했습니다 다시 시도해 주세요");

    //파일 분리 허용X. val() 때문에
    let addressCallback = (e) => {
        e.preventDefault(); //405 이슈 해결.

        new daum.Postcode({
            oncomplete: function (data) {
                let addr = "";
                let extraAddr = ""; //참고항목

                if (data.userSelectedType === "R") {
                    addr = data.roadAddress;

                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname))
                        extraAddr += data.bname;
                } else addr = data.jibunAddress;

                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraAddr +=
                        extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                }

                if (extraAddr !== "") extraAddr = " (" + extraAddr + ")";

                $("#bsplc_zpcd").val(data.zonecode);
                $("#bsplc_base").val(data.address);
                $("#bsplc_dtl").focus(); //상세주소에 focus
            },
        }).open();
    };

    $(document).ready(function () {
        $("#email_duplicate_chk").click(function (e) {
            e.preventDefault();
            let email_ref = $("#email");

            if (!validateEmailAlert(email_ref)) return false;

            $.ajax({
                url: '/seller/duplicate/email',
                data: {email: email_ref.val()},
                type: 'POST',
                success: function (msg) {
                    if (msg == "OK") {
                        alert(available_cpnm);
                        $("#email_duplicate_chk").attr("disabled", true); //버튼 비활성화
                        email_ref.attr("readonly", true); //인풋 비활성화
                    } else {
                        alert(duplicate_cpnm);
                        email_ref.focus();
                    }
                },
                error: function (err) {
                    alert(error_msg);
                }
            }); //$.ajax
        });

        //브랜드명 중복 체크
        $("#cpnm_duplicate_chk").click(function (e) {
            e.preventDefault();
            let cpnm_ref = $("#cpnm");

            if (!validateBrndNameAlert(cpnm_ref)) return false;

            $.ajax({
                url: '/seller/duplicate/cpnm',
                data: {cpnm: cpnm_ref.val()},
                type: 'POST',
                success: function (msg) {
                    if (msg == "OK") {
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

        //사업자 인증
        $("#brno_chk").click(function (e) {
            e.preventDefault();

            let brno_ref = $("#brno");
            if (!validateBrnoAlert(brno_ref)) return false;

            let brno = {b_no: [$("#brno").val()]};
            //-제외 숫자만 입력할 것. 그렇지 않으면 잘못된 조회결과 발생

            let serviceKey = "5RrGC%2BYxMLKxHrcaSzs46HaxE7ye2QKnjkO%2F4uATqcBp9fzXBmyqAqEDY1GFkwqWj4lUxEA8R8nskdqUCJhohQ%3D%3D";
            $.ajax({
                url:
                    "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=" +
                    serviceKey,
                type: "POST",
                data: JSON.stringify(brno),
                dataType: "JSON",
                contentType: "application/json",
                accept: "application/json",
                success: function (result) {
                    let biz_state = result.data[0].b_stt_cd;

                    if (biz_state == "") {
                        alert("국세청에 등록되지 않은 사업자 번호입니다.");
                    } else if (biz_state != 1) { //계속사업자가 아님
                        alert("휴/폐업 사업자 번호입니다. 다른 번호를 입력해 주세요");
                    } else {
                        alert("사용가능한 사업자 번호입니다.");
                        $("#brno_chk").attr("disabled", true);
                        $("#brno").attr("readonly", true);
                    }
                },
                error: function (error) {
                    console.log("오류가 발생했습니다. 다시 시도해 주세요");
                },
            });
        });

        //주소 검색
        $("#addr-search").click(function (e) {
            addressCallback(e);
        });

        //체크박스 모두 동의
        $(".checkbox-group").on("click", "#check-all", function () {
            let is_checked = $(this).is(":checked");

            $(this)
                .parents(".checkbox-group")
                .find("input")
                .prop("checked", is_checked);

            // 체크박스 이미지 전부 변경
            $(".agree-checkbox").attr(
                "src",
                imgUrl(is_checked)
            );
        });

        //체크박스
        $(".checkbox-group").on("click", ".normal", function () {
            var is_checked = true;

            $(".checkbox-group .normal").each(function () {
                is_checked = is_checked && $(this).is(":checked");
            });

            $("#check-all").prop("checked", is_checked);
            $(".agree-checkbox").attr(
                "src",
                imgUrl(is_checked)
            );

            $(".normal").each(function () {
                $(this)
                    .next("img")
                    .attr(
                        "src",
                        imgUrl($(this).is(":checked"))
                    );
            });
        });

        //파일 업로드
        let clone_bnr = $(".upload-input.bnr").clone();
        let clone_profile = $(".upload-input.profile").clone();

        //.uploadResult ul의 참조를 얻어온다.
        let bnr_upload_list = $(".upload-result.bnr ul");
        var profile_upload_list = $(".upload-result.profile ul");

        //브랜드 업로드
        $("#bnr_upload_btn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            e.preventDefault();
            let formData = new FormData();
            let inputFile = $("input[name='upload_bnr']");

            if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
                alert(bnr_upload_empty);
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
                    bnr_upload_list.append(showUploadedFile(result));
                    $(".upload-input.bnr").html(clone_bnr.html());
                }
            });
        });

        //프로필 업로드
        $("#profile_upload_btn").on("click", function (e) {
            e.preventDefault();
            var formData = new FormData();
            var inputFile = $("input[name='upload_profile']");

            if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
                alert(profile_upload_empty);
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
                    profile_upload_list.append(showUploadedFile(result));
                    $(".upload-input.profile").html(clone_profile.html()); //파일 초기화
                }
            });
        });

        //가입하기 버튼
        $(".reg-confirm").click(function (e) {
            e.preventDefault();

            let email_ref = $("#email");
            let email_chk_btn = $("#email_duplicate_chk");

            if (!validateEmailAlert(email_ref)) return false; //이메일 검사
            if (!chkEmailAlert(email_ref, email_chk_btn)) return false; //이메일 중복 검사

            let cpnm_ref = $("#cpnm");
            //브랜드명
            if (!validateBrndNameAlert(cpnm_ref)) return false;
            //
            // let name_ref = $("#repr_nm");
            //
            // if (name_ref.val() == "") {
            //     alert("대표의 이름을 입력해 주세요");
            //     name_ref.focus();
            //     return false;
            // }
            //
            // if (name_ref.val().length > 20) {
            //     alert("대표의 이름은 20자 미만으로 입력해 주세요");
            //     name_ref.focus();
            //     return false;
            // }
            //
            // let pwd_ref = $("#pwd");
            // if(!validatePwdAlert(pwd_ref)) return false; //비번 검사
            //
            // let pwd_confirm_ref = $("#pwd_confirm");
            // if(!validatePwdConfirmAlert(pwd_ref, pwd_confirm_ref)) return false;
            //
            // let mpno_ref = $("#mpno");
            // let mpno_chk_btn = $("#mpno_chk");
            // if(!validateMpnoAlert(mpno_ref,mpno_chk_btn)) return false;
            //
            // let brno_ref = $("#brno");
            // let brno_chk_btn = $("#brno_chk");
            //
            // if (!validateBrnoAlert(brno_ref)) return false;
            //
            // if (!brno_chk_btn.is(":disabled")) {
            //     alert("사업자 인증을 해 주세요");
            //     brno_ref.focus();
            //     return false;
            // }

            //통신판매업은 숫자+문자 등 fixed가 아니라 ""체크만 한다.
            // let sle_biz_ref = $("#sle_biz_no");
            // if (sle_biz_ref.val() =="") {
            //     alert("통신판매업신고번호를 입력해 주세요");
            //     sle_biz_ref.focus();
            //     return false;
            // }

            // let addr_base_ref = $("#bsplc_base");
            // let addr_dtl_ref = $("#bsplc_dtl");
            //
            // if (!validateAddrAlert(addr_base_ref, addr_dtl_ref)) return false; //주소

            // let telno_ref = $("#repr_telno"); //브랜드 공식 연락처
            // if (telno_ref.val() == "") {
            //     alert("대표 연락처를 입력해 주세요");
            //     telno_ref.focus();
            //     return false;
            // }
            //
            // if (!mpno_reg.test(telno_ref.val())) {
            //     alert(not_valid_mpno);
            //     telno_ref.focus();
            //     return false;
            // }
            //
            let brnd_cn_ref = $("#brnd_cn"); //브랜드 내용
            if (!validateBrndCnAlert(brnd_cn_ref)) return false;

            //브랜드 배너, 프로필 이미지가 2개 이상이면 alert("이미지를 1개만 업로드");
            let bnr_list = $(".upload-result.bnr ul li");
            let prof_list = $(".upload-result.profile ul li");

            if (!validateBrndImgAlert(bnr_list, prof_list)) return false;

            //필수동의
            let agre_chk = function chkAgreed() {
                let is_Agreed;
                $(".chk-group-line .input-line input[type=checkbox]").each(function (i, obj) {
                    is_Agreed = (!obj.checked) ? obj.checked : true;
                });
                return is_Agreed;
            };

            if (!agre_chk()) { //필수 동의 안함
                alert(chk_agre_required);
                return false;
            }

            let form = $("#seller_register");

            let bnr_path = $(".upload-result.bnr ul li").data("upload-path");
            let profile_path = $(".upload-result.profile ul li").data("upload-path");

            let files = "<input type='hidden' name='brnd_bnr_upload_path' value=" + bnr_path + ">" +
                "<input type='hidden' name='brnd_upload_path' value=" + profile_path + ">";

            form.append(files); //form에 업로드 파일 정보 추가
            form.submit();
        });

    });
</script>
</body>
</html>
