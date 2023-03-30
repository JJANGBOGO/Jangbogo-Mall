<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/user/signupForm.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--    <c:if test="${param.ng!=null}">--%>
<%--        <p> error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> </p>--%>
<%--    </c:if>--%>
<div class="register-page">
    <div class="reg-page-center">
        <div class="reg-header">회원가입</div>
        <div class="section-line"></div>
        <div class="reg-form-box">
            <form class="reg-form" action="" method="post">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="id">아이디<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="id"
                                        id="id"
                                        type="text"
                                        placeholder="아이디를 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button>중복확인</button>
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
                                <input type="checkbox" id="show-pwd" hidden/>
                                <label id="show-pwd-toggle" class="show-pwd" for="show-pwd">
                                    <i id="eye" class="fa-regular fa-eye-slash"></i>
                                </label>
                            </div>
                            <div class="error-msg">최소 10자 입력</div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd-confirm">비밀번호 확인<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="pwd-confirm"
                                        id="pwd-confirm"
                                        type="password"
                                        placeholder="비밀번호를 한번 더 입력해주세요"
                                />
                                <input type="checkbox" id="show-pwd-confirm" hidden/>
                                <label
                                        id="show-pwd-confirm-toggle"
                                        class="show-pwd"
                                        for="show-pwd-confirm"
                                >
                                    <i id="eye2" class="fa-regular fa-eye-slash"></i>
                                </label>
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="name">이름<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="name"
                                        id="name"
                                        type="text"
                                        placeholder="이름을 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
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
                                        placeholder="jungsukmarket@naver.com"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button>
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="addr">주소<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <input name="postcode" id="postcode" hidden/>
                            <input name="addr" id="addr" hidden/>
                            <div class="input">
                                <input
                                        name="addrdisplay"
                                        id="addr-display"
                                        type="text"
                                        placeholder="주소를 검색해주세요"
                                />
                            </div>
                            <div class="input" style="margin-top: 10px">
                                <input
                                        name="addrdetail"
                                        id="addr-detail"
                                        type="text"
                                        placeholder="상세 주소를 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="addr-search">
                                  <i class="fa-solid fa-magnifying-glass"></i>
                                  검색
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="birth">생년월일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        name="birth"
                                        id="birth"
                                        type="text"
                                        placeholder="yyyy / mm / dd"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
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
                        <div
                                class=""
                                style="
                    border-top: 1px solid #ddd;
                    border-bottom: 1px solid #ddd;
                  "
                        >
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
                                <input type="checkbox" id="check_2" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>이용약관 동의</span>
                            </label>
                            <label for="check_3" class="input-line">
                                <input type="checkbox" id="check_3" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span>개인정보 수집 및 이용 동의</span>
                            </label>
                            <label for="check_4" class="input-line">
                                <input type="checkbox" id="check_4" class="normal" hidden/>
                                <img
                                        class="agree-checkbox"
                                        src="/img/unchecked.png"
                                        width="20"
                                        height="20"
                                />
                                <span
                                >할인쿠폰/이벤트/감동적인 뉴스레터 선택 동의 (선택)</span
                                >
                            </label>
                        </div>
                        <div class="input-line" style="color: red; font-size: 14px">
                            개인정보 수집 및 이용 동의는 필수 입니다.
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
    let showRawPwd = (checkboxId, inputId, iconId) => {
        const checked = $(checkboxId).is(":checked");
        $(inputId).attr("type", !checked ? "text" : "password");
        $(iconId).attr(
            "class",
            !checked ? "fa-regular fa-eye" : "fa-regular fa-eye-slash"
        );
    };

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

                $("#addr-display").val(data.zonecode + " / " + data.address);
                $("#postcode").val(data.zonecode);
                $("#addr").val(data.address);
                $("#addr-detail").focus(); //상세주소에 focus
            },
        }).open();
    };

    let imgUrl = (checked) => {
        return checked ? "/img/checked.png" : "/img/unchecked.png";
    }

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

        $("#show-pwd-toggle").click(() =>
            showRawPwd("#show-pwd", "#pwd", "#eye")
        );
        $("#show-pwd-confirm-toggle").click(() =>
            showRawPwd("#show-pwd-confirm", "#pwd-confirm", "#eye2")
        );
    });
</script>
</body>
</html>
