<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/leaveUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
    <div class="leave-user-layout">
        <div class="header">회원탈퇴안내</div>
        <div class="info">
            <div class="label">회원탈퇴안내</div>
            <div class="desc">
                회원 탈퇴 시 아래 사항 숙지해주세요~~~ 블라블
                <ul>
                    <li>1.설명1</li>
                    <li>1.설명2</li>
                    <li>1.설명3</li>
                    <li>1.설명4</li>
                </ul>
            </div>
        </div>
        <form action="/leave" class="leave-user-form" method="post">
            <div class="input-line">
                <div class="label">비밀번호 입력</div>
                <div class="input-box">
                    <input type="password" placeholder="현재 비밀번호를 입력해주세요"/>
                </div>
            </div>
            <div class="info complain">
                <div class="label">무엇이 불편하였나요?</div>
                <div class="desc">
                    <div class="complain-check">
                        <div class="container">
                            <label for="">
                                <input type="checkbox"/>
                                <!-- 추후에 체크박스 이미지로 변경 -->
                                <span>고객서비스(상담,포장 등) 불만</span>
                            </label>
                            <label for="">
                                <input type="checkbox"/>
                                <!-- 추후에 체크박스 이미지로 변경 -->
                                <span>고객서비스(상담,포장 등) 불만</span>
                            </label>
                            <label for="">
                                <input type="checkbox"/>
                                <!-- 추후에 체크박스 이미지로 변경 -->
                                <span>고객서비스(상담,포장 등) 불만</span>
                            </label>
                            <label for="">
                                <input type="checkbox"/>
                                <!-- 추후에 체크박스 이미지로 변경 -->
                                <span>고객서비스(상담,포장 등) 불만</span>
                            </label>
                        </div>
                    </div>
                    <div class="comment-textarea">
                  <textarea
                          name=""
                          id=""
                          cols="30"
                          rows="10"
                          placeholder="의견 부탁드립니다."
                  ></textarea>
                    </div>
                </div>
            </div>
            <div class="leave-user-btn">
                <button>
                    <span>취소</span>
                </button>
                <button type="submit">
                    <span>탈퇴</span>
                </button>
            </div>
        </form>
    </div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

