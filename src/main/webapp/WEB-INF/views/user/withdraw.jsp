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
    <h1 class="header">회원 탈퇴 안내</h1>

    <p>* 별도의 목적의 경우 고객센터로 문의해주시기 바랍니다.</p>
    <p>* 개인정보는 개인정보 처리 방침에 따라 보관합니다.</p>
    <p>* 탈퇴가 진행되면 이후에는 어떠한 복구도 할 수 없습니다.</p>

    <div class="warn-list">
        <p class="text-danger">
            * 회원 탈퇴 시 기존의 등급, 주문 내역, 쿠폰 등은 즉시 소멸됩니다.
        </p>
        <p class="text-danger">
            * 탈퇴 시 기존의 이메일, 닉네임은 본인 또는 타인 모두 재사용할 수
            없음을 알립니다.
        </p>
        <p class="text-danger">
            * 회원 탈퇴 시 기존 주문 교환/환불 처리가 불가능해집니다.
        </p>
    </div>

    <div class="user-info">
        <h4>가입 정보</h4>
        <p>이메일: <span>${user.email}</span></p>
        <p>닉네임: <span>${user.nick_nm}</span></p>
        <p>가입날짜: <span><fmt:formatDate value="${user.reg_tm}" pattern="yyyy.MM.dd" type="date"/></span></p>
        <p>로그인타입: <span>
            <c:choose>
                <c:when test="${loginService eq 'kakao'}">
                    카카오
                </c:when>
                <c:when test="${loginService eq 'naver'}">
                    네이버
                </c:when>
                <c:otherwise>
                    일반
                </c:otherwise>
            </c:choose>
        </span>
        </p>
    </div>
    <div class="confirm-input">
        <h4>
            탈퇴 처리 진행을 원하시는 경우, 아래 입력칸에
            <b>탈퇴처리에 동의합니다</b>라고 입력해주세요
        </h4>
        <input
                id="withdraw"
                type="text"
                class="input-control"
                placeholder="탈퇴처리에 동의합니다"
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
        <span
        >위 사항을 모두 숙지하였으며 동의합니다.</span>
    </label>
    <div class="btn-container">
        <button class="cancel">취소하기</button>
        <button class="confirm">탈퇴하기</button>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/member/msg.js"></script>
<script>
    $(document).ready(function () {
        $(".cancel").click(function () {
            window.location.href = "/";
        });
        $(".confirm").attr("disabled", true); //ok

        let withdraw_msg = "탈퇴처리에 동의합니다";
        let input_failed = true; //인풋 불일치
        let chked = false; //동의 체크여부

        let validate = function (failed, checked) {
            $(".confirm").attr("disabled", (failed || !checked) ? true : false);
        }

        $("#withdraw").keyup(function (e) {
            input_failed = e.target.value != withdraw_msg;
            validate(input_failed, chked);
        });

        $("#chk_label").click(function () {
            chked = $("#withdraw_agre").is(":checked");

            $("#chk_label")
                .children("img")
                .attr(
                    "src",
                    chked ? "/img/checked.png" : "/img/unchecked.png"
                );
            validate(input_failed, chked);
        });

        $(".confirm").click(function () {
            $.ajax({
                url: "/user/withdraw",
                data: {idx: ${user.idx}, email: "${user.email}"},
                type: "POST",
                success: function (msg) {
                    if (msg === "SUCCESS") {
                        alert(withdraw_ok);
                        window.location.href = "/";
                    }
                },
                error: function (error) {
                    alert(error_msg);
                }
            });
        });
    });
</script>
</body>
</html>
