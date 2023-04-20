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


    $(document).ready(function () {

    //     추후 개발 예정
    });
</script>
</body>
</html>
