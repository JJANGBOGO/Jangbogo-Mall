<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/user/baseForm.css"/>
    <link rel="stylesheet" href="/css/user/findUser.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<body>
<div class="member-container">
    <div class="contents">
        <div class="member-wrap">
            <h2 class="page-title">이메일 찾기</h2>
            <div class="tab-box">
                <button class="tab-button" data-a="0">회원</button>
                <button class="tab-button" data-a="1">판매자</button>
            </div>
            <div class="member-form">
                <form id="user_form" class="find-form" action="/find/user/email" method="post">
                    <div class="find-input-box">
                        <label>닉네임</label>
                        <input
                                class="input-control"
                                name="nick_nm"
                                type="text"
                                placeholder="닉네임을 입력해주세요."
                        />
                    </div>
                    <div class="find-input-box">
                        <label>비밀번호</label>
                        <input
                                class="input-control"
                                name="pwd"
                                type="text"
                                placeholder="비밀번호를 입력해주세요."
                        />
                    </div>
                    <a class="find-other-link" href="/find/member/pwd">비밀번호 찾기</a>
                    <button class="find-confirm-button" type="submit">
                        확인
                    </button>
                </form>
            </div>
            <div class="member-form">
                <form id="seller_form" class="find-form" action="/find/seller/email" method="post">
                    <div class="find-input-box">
                        <label>닉네임</label>
                        <input
                                class="input-control"
                                name="nick_nm"
                                type="text"
                                placeholder="닉네임을 입력해주세요"
                        />
                    </div>
                    <div class="find-input-box">
                        <label>비밀번호</label>
                        <input
                                class="input-control"
                                name="pwd"
                                type="text"
                                placeholder="비밀번호를 입력해주세요"
                        />
                    </div>
                    <a class="find-other-link" href="/find/member/pwd">비밀번호 찾기</a>
                    <button class="find-confirm-button" type="submit">
                        확인
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(document).ready(function () {
        $(".tab-button").eq(0).addClass("on");
        $(".member-form").eq(0).addClass("show");

        $(".tab-box").click(function (e) {
            let data_id = e.target.dataset.a;

            $(".tab-button").removeClass("on");
            $(".member-form").removeClass("show");

            $(".tab-button").eq(data_id).addClass("on");
            $(".member-form").eq(data_id).addClass("show");
        });
    });
</script>
</body>
</html>
