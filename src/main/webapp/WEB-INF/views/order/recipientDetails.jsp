<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/04/12
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>배송 정보 수정</title>
        <link rel="stylesheet" href="/css/order/recipientDetails.css"/>
        <script src = "/js/order/format.js"></script>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <div>
            <div class="recipient-details__title">
                <h2>배송 정보</h2>
                <label class="recipient-details__check">
                    <input type="checkbox" class="recipient-details__checkbox">
                    <span>주문자 정보와 동일</span>
                </label>
            </div>
            <div class="recipient-details__main">
                <div class="recipient-details__info">
                    <label for="receiver-name">받으실 분</label>
                    <span>*</span>
                    <div height="44" class="recipient-details__info-value">
                        <input data-testid="input-box" id="receiver-name" name="name" placeholder="이름을 입력해 주세요" type="text" required="" height="44">
                        <button size="16" id="recipientDeleteBtn" tabindex="-1" aria-label="delete-input" type="button"></button>
                    </div>
                </div>
                <div class="recipient-details__info">
                    <label for="receiver-phone">휴대폰</label>
                    <span>*</span>
                    <div height="44" class="recipient-details__info-value">
                        <input data-testid="input-box" id="receiver-phone" name="phone" placeholder="숫자만 입력해 주세요" type="tel" required="" height="44">
                        <button size="16" id="mpnoDeleteBtn" tabindex="-1" aria-label="delete-input" type="button"></button>
                    </div>
                </div>
                <div>
                    <label class="recipient-details__location-title">받으실 장소<span>*</span></label>
                    <div class="recipient-details__location-main">
                        <label class="recipient-details__location-main_lbl" for="door">
                            <input data-testid="radio-DOOR" id="door" name="receivePlace" type="radio" value="DOOR" checked="">
                            <span aria-labelledby="door">문 앞</span>
                        </label>
                        <label class="recipient-details__location-main_lbl" for="security-office">
                            <input data-testid="radio-SECURITY_OFFICE" id="security-office" name="receivePlace" type="radio" value="SECURITY_OFFICE">
                            <span aria-labelledby="security-office">경비실</span>
                        </label>
                    </div>
                </div>
                <div class="recipient-details__buttons">
                    <button type="button" height="56" radius="3">
                        <span>취소</span></button>
                    <button type="submit" height="56" radius="3"><span>저장</span></button>
                </div>
            </div>
            <script>
                $(document).ready(() => {
                    // 주문자와 동일 체크된 경우
                    // 받으실 분 과 휴대전화 번호 input 값을 부모창의 값들로 채운다.
                    let recipient = opener.$("#ordererName").html();
                    let mpno      = opener.$("#ordererMpno").html();

                    // $("input#receiver-name").val(recipient);
                    // $("input#receiver-phone").val(mpno);

                    // 이벤트 대상 : 받으실 분 input의 '삭제' 버튼
                    // 이벤트 : click
                    // 이벤트 핸들러 기능 : '삭제' 버튼 클릭 g시, input의 value를 ""처리
                    $("#recipientDeleteBtn").on("click", (e) => {
                        if (!$("input.recipient-details__checkbox").is(":checked")) $("input#receiver-name").val("");
                        else $("input#receiver-name").val(recipient);
                    })

                    // 이벤트 대상 : 휴대폰 input의 '삭제' 버튼
                    // 이벤트 : click
                    // 이벤트 핸들러 기능 : '삭제' 버튼 클릭 시, input의 value를 ""처리
                    $("#mpnoDeleteBtn").on("click", (e) => {
                        if(!$("input.recipient-details__checkbox").is(":checked")) $("input#receiver-phone").val("");
                        else $("input#receiver-phone").val(mpno);
                    })

                    // 이벤트 대상 : 받으실 분 input의 '삭제' 버튼
                    // 이벤트 : keydown
                    // 이벤트 핸들러 기능 : 키 '조작' 시, '주문자와 동일' 체크된 경우 체크가 풀린다.
                    $("input#receiver-name").keydown((e) => {
                        if($("input.recipient-details__checkbox").is(":checked")) $("input.recipient-details__checkbox").prop("checked", false);
                    });

                    // 이벤트 대상 : '주문자와 동일' 체크박스
                    // 이벤트 : click
                    // 이벤트 핸들러 기능 : '주문자와 동일' 체크박스 클릭 시, 받으실 분, 휴대폰 두 input의 value들을 ""처리
                    $("input[type=checkbox]").on("click", (e) => {
                        if ($("input.recipient-details__checkbox").is(":checked")) {
                            $("input#receiver-name").val(recipient);
                            $("input#receiver-phone").val(mpno);
                        } else {
                            $("input#receiver-name").val("");
                            $("input#receiver-phone").val("");
                        }
                    })

                    // 이벤트 대상 : '취소' 버튼
                    // 이벤트 : click
                    // 이벤트 핸들러 기능 : '취소' 버튼 클릭 시, 자식 창 닫기
                    $(".recipient-details__buttons > button:first-of-type").click(() => {
                        window.close();
                    })
                    // 이벤트 대상 : '저장' 버튼
                    // 이벤트 : click
                    // 이벤트 핸들러 기능 : '저장' 버튼 클릭 시, 자식창에 입력한 값들을 부모창에 데이터 렌더링하기
                    $(".recipient-details__buttons > button:last-of-type").click(() => {
                        let recipient = $("#receiver-name").val();
                        let mpno = $("#receiver-phone").val();
                        let pickUpLocation = ($('.recipient-details__location-main  input:checked').val() === "DOOR") ? "문 앞" : "경비실";

                        // 유효성 검사를 통과하지 못 하면, 경고창 띄우고 아래 코드가 실행되지 않는다.
                        if(!checkNameLength(recipient) || !checkNameRegex(recipient) || !checkMpnoRegex(mpno) || !checkMpnoLength(mpno)) return;

                        // 부모창 값을 자식창 값으로 수정
                        $("#deliveryRecipient", opener.document).html(
                            "<span>" + recipient + "</span> , <span>" + formatMpnoWithHyphen(mpno) + "</span>"
                        )
                        $("#deliveryLocation", opener.document).html(
                            "<span>받으실 장소 | " + pickUpLocation + "</span>"
                        )
                        // 자식창 닫기
                        window.close();
                    })

                    // 메서드명 : checkNameLength
                    // 기   능 : 이름의 길이가 0인 경우 이벤트 핸들러 실행을 멈춘다.
                    const checkNameLength = (name) => {
                        if(!name.length) {
                            alert("받는 분 이름을 입력해주세요.")
                            return false;
                        }
                        return true;
                    }

                    // 메서드명 : checkMpnoLength
                    // 기   능 : 이름의 길이가 0인 경우 이벤트 핸들러 실행을 멈춘다.
                    const checkMpnoLength = (mpno) => {
                        if(!mpno.length) {
                            alert("휴대폰 번호를 입력해주세요.")
                            return false;
                        }
                        return true;
                    }

                    // 메서드명 : checkMpnoRegex
                    // 기   능 : 휴대폰 번호 형식이 아닌 경우, 이벤트 핸들러 실행을 멈춘다.
                    const checkMpnoRegex = (mpno) => {
                        // 휴대폰 번호 정규식 체크
                        mpno = mpno.replace(/-/g, "");  // 하이픈 제거
                        const regex = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
                        if(!regex.test(mpno)){
                            alert("휴대폰번호가 올바르지 않습니다.");
                            return false;
                        }
                        return true;
                    }

                    // 메서드명 : checkNameRegex
                    // 기   능 : 주문자명이 10글자 이상이면, 이벤트 핸들러 실행을 멈춘다.
                    const checkNameRegex = (name) => {
                        const regex = /^[가-힣]{2,4}$/;
                        if(!regex.test(name)) {
                            alert("주문자 이름이 올바르지 않습니다.(한글 2 ~ 4글자)");
                            return false;
                        }
                        return true;
                    }
                })
            </script>
        </div>
    </body>
</html>
