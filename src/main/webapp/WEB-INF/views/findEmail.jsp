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
                <form id="user_find_email" class="find-form" action="/user/find/email" method="post">
                    <div class="find-input-box">
                        <label>닉네임</label>
                        <input
                                id="user_nick_nm"
                                class="input-control"
                                name="nick_nm"
                                type="text"
                                placeholder="닉네임을 입력해주세요."
                        />
                    </div>
                    <div class="find-input-box">
                        <label>비밀번호</label>
                        <input
                                id="user_pwd"
                                class="input-control"
                                name="pwd"
                                type="password"
                                placeholder="비밀번호를 입력해주세요."
                        />
                    </div>
                    <input
                            name="type"
                            type="hidden"
                            value="user"
                    />
                    <a class="find-other-link" href="/find/pwd">비밀번호 찾기</a>
                    <button class="find-confirm-button" id="user_form_btn">
                        확인
                    </button>
                </form>
            </div>
            <div class="member-form">
                <form id="seller_find_email" class="find-form" action="/seller/find/email" method="post">
                    <div class="find-input-box">
                        <label>브랜드명</label>
                        <input
                                class="input-control"
                                name="cpnm"
                                type="text"
                                placeholder="브랜드명을 입력해주세요"
                        />
                    </div>
                    <div class="find-input-box">
                        <label>비밀번호</label>
                        <input
                                class="input-control"
                                name="pwd"
                                type="password"
                                placeholder="비밀번호를 입력해주세요"
                        />
                    </div>
                    <input
                            name="type"
                            type="hidden"
                            value="seller"
                    />
                    <a class="find-other-link" href="/find/pwd">비밀번호 찾기</a>
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
    let msg = "${msg}";
    if(msg == "EMPTY_ERR") alert("정보를 모두 입력해 주세요");
    if(msg == "NOT_FOUND_ERR") alert("정보를 찾을 수 없습니다");
    if(msg == "EXCEPTION_ERR") alert("오류가 발생했습니다. 다시 시도해 주세요");
</script>
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

        let findEmailChk = function (nickname, pwd) {
            if ($.trim(nickname) == "") {
                alert("닉네임을 입력해주세요");
                return false;
            }
            if ($.trim(pwd) == "") {
                alert("비밀번호를 입력해 주세요");
                return false;
            }
            return true;
        };

        //회원 이메일 폼 전송
        $("#user_form_btn").click(function (e) {
            let user_nick = $("#user_nick_nm").val();
            let user_pwd = $("#user_pwd").val();

            e.preventDefault();
            if (findEmailChk(user_nick, user_pwd))
                //유효성 검사 다시 해. 여기서도 이메일 형식 검사하잖아.
                // 컬리는 button을 disabled한다.
                // 로그인 시에는 아이디랑 비번 형식을 안 따지는데/
                $("#user_find_email").submit();
        });

        //판매자 이메일 폼 전송
    });
</script>
</body>
</html>
