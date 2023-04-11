<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/radioBtn.css"/>
    <link rel="stylesheet" href="/css/user/signupForm.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="register-page">
    <div class="reg-page-center">
        <div class="reg-header">판매자가입</div>
        <div class="section-line"></div>
        <div class="reg-form-box">
            <form id="seller_register" class="reg-form" action="/seller/register" method="post">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">이메일<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="email"
                                        name="email"
                                        type="text"
                                        placeholder="이메일을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg email"></div>
                        </div>
                        <div class="btn-space">
                            <button id="email_duplicate_chk">
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cpnm">상호명(브랜드명)<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="cpnm"
                                        id="cpnm"
                                        type="text"
                                        placeholder="브랜드명을 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg cpnm"></div>
                        </div>
                        <div class="btn-space">
                            <button id="cpnm_duplicate_chk">중복확인</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd">비밀번호<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="pwd"
                                        id="pwd"
                                        type="password"
                                        placeholder="비밀번호를 입력해주세요"
                                />
                                <input type="checkbox" id="show_pwd" hidden/>
                                <label id="show_pwd_toggle" class="show-pwd" for="show_pwd">
                                    <i id="eye" class="fa-regular fa-eye-slash"></i>
                                </label>
                            </div>
                            <div class="error-msg pwd"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd_confirm">비밀번호 확인<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd_confirm"
                                        type="password"
                                        placeholder="비밀번호를 한번 더 입력해주세요"
                                />
                                <input type="checkbox" id="show_pwd_confirm" hidden/>
                                <label
                                        id="show_pwd_confirm_toggle"
                                        class="show-pwd"
                                        for="show_pwd_confirm"
                                >
                                    <i id="eye2" class="fa-regular fa-eye-slash"></i>
                                </label>
                            </div>
                            <div class="error-msg pwd-confirm"></div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="mpno">휴대전화<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="mpno"
                                        id="mpno"
                                        type="text"
                                        placeholder="-제외 숫자만 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg mpno"></div>
                        </div>
                        <div class="btn-space">
                            <button>인증</button>
                        </div>
                    </div>
                    <h3 class="section-header">사업자 기본 정보</h3>
                    <div class="input-line">
                        <div class="input-label">
                            <label>사업유형<span>*</span></label>
                        </div>
                        <fieldset>
                            <label>
                                <input type="radio" name="type" value="user" checked/>
                                <span>개인사업자</span>
                            </label>

                            <label>
                                <input type="radio" name="type" value="seller"/>
                                <span>법인사업자</span>
                            </label>
                        </fieldset>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="brno">사업자번호<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brno"
                                        id="brno"
                                        type="text"
                                        placeholder="사업자 등록 번호를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg brno"></div>
                        </div>
                        <div class="btn-space">
                            <button>인증</button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="sle_biz_no">통신판매업신고번호<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="sle_biz_no"
                                        id="sle_biz_no"
                                        type="text"
                                        placeholder="통신판매업신고번호를 입력해 주세요"
                                />
                            </div>
                            <div class="error-msg sle-biz-no"></div>
                        </div>
                        <div class="btn-space">
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>사업지 주소<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <input name="bsplc_zpcd" id="bsplc_zpcd" hidden/>
                            <div class="input">
                                <input
                                        name="bsplc_base"
                                        id="bsplc_base"
                                        type="text"
                                        placeholder="주소를 검색해주세요"
                                />
                            </div>
                            <div class="input addr-dtl">
                                <input
                                        name="bsplc_dtl"
                                        id="bsplc_dtl"
                                        type="text"
                                        placeholder="상세 주소를 입력해주세요"
                                />
                            </div>
                            <div class="error-msg bsplc-dtl"></div>
                        </div>
                        <div class="btn-space">
                            <button id="addr-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                검색
                            </button>
                        </div>
                    </div>
                    <h3 class="section-header">브랜드 기본 정보</h3>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="repr_telno">브랜드 공식 연락처<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="repr_telno"
                                        id="repr_telno"
                                        type="text"
                                        placeholder="-제외 숫자만 입력해주세요"
                                />
                            </div>
                            <div class="error-msg bsplc-dtl"></div>
                        </div>
                        <div class="btn-space">
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>브랜드 설명<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brnd_cn"
                                        id="brnd_cn"
                                        type="text"
                                        placeholder="브랜드 내용을 입력해주세요"
                                />
                            </div>
                            <div class="error-msg brnd-cn"></div>
                        </div>
                        <div class="btn-space">
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>브랜드 배너이미지</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brnd_bnr_upload_path"
                                        id="brnd_bnr_upload_path"
                                        type="file"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>브랜드 프로필</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="brnd_upload_path"
                                        id="brnd_upload_path"
                                        type="file"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                        </div>
                    </div>
                    <div class="section-line bottom"></div>
                    <div class="checkbox-group">
                        <label for="check-all" class="input-line">
                            <input
                                    type="checkbox"
                                    name="checkall"
                                    id="check-all"
                                    hidden
                            />
                            <img
                                    class="agree-checkbox"
                                    src="/img/unchecked.png"
                                    width="20"
                                    height="20"
                            />
                            <span>모두 동의합니다.</span>
                        </label>
                        <div class="chk-group-line">
                            <label for="check_1" class="input-line">
                                <input type="checkbox" id="check_1" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>만 14세 이상입니다.</span>
                            </label>
                            <label for="check_2" class="input-line">
                                <input type="checkbox" name="seler_agre_yn" value="Y" id="check_2" class="normal"
                                       hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>판매자 이용약관 동의</span>
                            </label>
                        </div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/regEx.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/member/common.js"></script>
<script>
    //파일 분리 안됨. val() 때문에
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
        $("#addr-search").click(function (e) {
            addressCallback(e);
        });

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
    });
</script>
</body>
</html>
