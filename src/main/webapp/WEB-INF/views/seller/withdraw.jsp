<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/user/withdraw.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="withdraw-content">
    <h1 class="header">판매자 탈퇴 안내</h1>
    <p>* 별도의 목적의 경우 고객센터로 문의해주시기 바랍니다.</p>
    <p>* 개인정보는 개인정보 처리 방침에 따라 보관합니다.</p>
    <p>* 탈퇴가 진행되면 이후에는 어떠한 복구도 할 수 없습니다.</p>
    <div class="warn-list">
        <p class="text-danger">
            * 판매자 탈퇴 시, 기존의 판매한 상품들에 대한 정산금액들은 모두 소멸됩니다.
        </p>
        <p class="text-danger">
            * 탈퇴 시 기존의 이메일, 닉네임은 본인 또는 타인 모두 재사용할 수 없음을 알립니다.
        </p>
    </div>
    <div class="user-info">
        <h4>가입 정보</h4>
        <p>이메일: <span>${seller.email}</span></p>
        <p>브랜드명: <span>${seller.cpnm}</span></p>
        <p>대표명: <span>${seller.repr_nm}</span></p>
        <p>가입날짜: <span><fmt:formatDate value="${seller.reg_tm}" pattern="yyyy.MM.dd" type="date"/></span></p>
    </div>
    <form id="seller_withdraw" action="/seller/withdraw" method="post">
        <div class="confirm-input">
            <h4>비밀번호 입력</h4>
            <input
                    id="pwd"
                    name="pwd"
                    type="password"
                    class="input-control"
                    placeholder="현재 비밀번호를 입력해 주세요."
            />
        </div>
        <label for="withdraw_agre" class="input-line" id="chk_label">
            <input type="checkbox" id="withdraw_agre" class="normal" hidden/>
            <img
                    class="agree-checkbox"
                    src="/img/unchecked.png"
                    width="20"
                    height="20"
            />
            <span>위 사항을 모두 숙지하였으며 동의합니다.</span>
        </label>
        <div class="btn-container">
            <button class="cancel">취소하기</button>
            <button class="confirm" id="confirm">탈퇴하기</button>
        </div>
    </form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/member/msg.js"></script>
<script>
    let msg = "${msg}";
    if (msg === "EXCEPTION_ERR") alert("오류가 발생했습니다. 다시 시도해 주세요");
    if (msg === "SELLER_NOT_FOUND") alert("비밀번호가 일치하지 않습니다");

    $(document).ready(function (e) {
        $(".cancel").click(function (e) {
            e.preventDefault();
            window.location.href = "/seller/info";
        });

        $("#chk_label").click(function () {
            let chked = $("#withdraw_agre").is(":checked");

            $("#chk_label")
                .children("img")
                .attr(
                    "src",
                    chked ? "/img/checked.png" : "/img/unchecked.png"
                );
        });

        $("#confirm").click(function (e) {
            e.preventDefault();

            let pwd = $("#pwd").val();
            if (pwd === "") {
                alert(pwd_empty);
                return false;
            }

            if (!$("#withdraw_agre").is(":checked")) {
                alert("탈퇴 동의 여부를 체크해 주세요");
                return false;
            }

            $("#seller_withdraw").submit();
        });
    });
</script>
</body>
</html>
