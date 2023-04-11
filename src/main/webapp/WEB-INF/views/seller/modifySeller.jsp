<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/modifyUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>판매자 정보 수정</h2>
        </div>
        <!-- end of page-header -->
        <div class="check-pwd-content">
            <form id="modify_seller" class="check-pwd-form" action="/seller/modify" method="post">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label for="email">이메일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="email"
                                        name="email"
                                        type="text"
                                        value="${seller.email}"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cpnm">브랜드명<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cpnm"
                                        name="cpnm"
                                        type="text"
                                        placeholder="브랜드명을 입력해주세요"
                                        value="${seller.cpnm}"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="cpnm_duplicate_chk">
                                중복확인
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd">새 비밀번호</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd"
                                        name="pwd"
                                        type="password"
                                        placeholder="새 비밀번호를 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="pwd_confirm">새 비밀번호 확인</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="pwd_confirm"
                                        name="pwd_confirm"
                                        type="password"
                                        placeholder="새 비밀번호를 다시 입력해주세요"
                                />
                            </div>
                            <!-- 없었다가 에러 시 참조 얻어서 append를 한다. 그렇지 않으면 영역이 깨짐 -->
                            <div class="error-msg">새 비밀번호와 일치하지 않습니다.</div>
                        </div>
                        <div class="btn-space"></div>
                    </div>

                    <div class="input-line">
                        <div class="input-label">
                            <label for="phone">휴대전화<span>*</span></label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="phone"
                                        type="text"
                                        name="email"
                                        value="${seller.mpno}"
                                        placeholder="휴대전화를 숫자만 입력해주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space">
                            <button id="mpno_chk">
                                다른 번호로 인증
                            </button>
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="guid_nm">안내 담당자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="guid_nm"
                                        name="guid_nm"
                                        type="text"
                                <%--                                        추후 로그인된 값으로 수정--%>
                                        value=""
                                        placeholder="안내 담당자 이름을 입력해 주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="guid_email">안내 담당자 이메일</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="guid_email"
                                        name="guid_email"
                                        type="text"
                                <%--                                        추후 로그인된 값으로 수정--%>
                                        value=""
                                        placeholder="안내 담당자 이메일을 입력해 주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cller_nm">고객센터 담당자</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cller_nm"
                                        name="cller_nm"
                                        type="text"
                                <%--                                        추후 로그인된 값으로 수정--%>
                                        value=""
                                        placeholder="고객센터 담당자 이름을 입력해 주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label for="cller_tellno">고객센터 전화번호</label>
                        </div>
                        <div class="input-box">
                            <div class="input">
                                <input
                                        id="cller_tellno"
                                        name="cller_tellno"
                                        type="text"
                                        placeholder="고객센터 전화번호를 입력해 주세요"
                                />
                            </div>
                        </div>
                        <div class="btn-space"></div>
                    </div>
                    <div class="btn-container">
                        <button class="info-modify">수정 취소</button>
                        <button class="info-modify">수정 완료</button>
                    </div>
                </div>
                <!-- end of center-padding -->
            </form>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/regEx.js"></script>
<script src="/js/member/common.js"></script>
<script>
    $(document).ready(function () {
        $("#optional_chk").click(function () {
            $(".agree-checkbox2").attr("src", imgUrl($(this).is(":checked")));
        });

        //인증버튼들 비활성화 (초기값)
        $("#cpnm_duplicate_chk").attr("disabled", true); // #nick_duplicate_chk
        $("#mpno_chk").attr("disabled", true);

    });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

