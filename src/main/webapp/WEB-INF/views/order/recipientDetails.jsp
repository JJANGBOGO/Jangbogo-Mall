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
        <title>배송 정보 상세</title>
        <style>
            * {
                box-sizing: border-box;
                margin :0;
            }

            body {
                margin: 0;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                background-color: #fff;
                -webkit-tap-highlight-color: transparent;
            }

            body, button, input, select, textarea {
                font-size: 14px;
                color: #333;
            }

            ul {
                list-style-type: none;
            }

            input[type=checkbox], input[type=radio] {
                box-sizing: border-box;
                padding: 0;
            }

            .recipient-details__title {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
                -webkit-box-align: center;
                align-items: center;
                position: fixed;
                top: 0px;
                left: 0px;
                z-index: 21;
                width: 100%;
                padding: 30px 30px 14px;
                background: rgb(255, 255, 255);
            }
            .recipient-details__title > h2 {
                font-weight: 500;
                font-size: 24px;
                line-height: 36px;
                color: rgb(51, 51, 51);
            }
            .recipient-details__check {
                position: relative;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                vertical-align: top;
                line-height: normal;
                color: rgb(51, 51, 51);
                margin-top: 9px;
                font-size: 14px;
                padding: 6px 0px;
            }
            .recipient-details__checkbox {
                overflow: hidden;
                margin-right: 5px;
                /*position: absolute;*/
                /*clip: rect(0px, 0px, 0px, 0px);*/
                /*clip-path: inset(50%);*/
                /*width: 1px;*/
                /*height: 1px;*/
            }
            .recipient-details__checkbox-content {
                margin-right: 12px;
            }

            .recipient-details__main {
                overflow-y: auto;
                padding: 90px 30px 30px;
                height: 100vh;
                box-sizing: border-box;
            }

            .recipient-details__main > * {
                margin-top: 20px;
            }
            .recipient-details__info {
                padding-bottom: 25px;
            }
            .recipient-details__info > label {
                display: inline-block;
                font-size: 14px;
                font-weight: 500;
                line-height: 19px;
                color: rgb(51, 51, 51);
                font-weight: 500;
                font-size: 14px;
                padding: 0px 0px 8px;
            }
            .recipient-details__info > span,
            .recipient-details__location-title > span,
            .recipient-details__gateio-title > span,
            .recipient-details__complete-msg_lbl > span {
                color: rgb(250, 98, 47);
            }

            .recipient-details__info-value {
                position: relative;
                height: 44px
            }
            .recipient-details__info-value > input {
                width: 100%;
                height: 44px;
                padding: 0px 11px 1px 15px;
                border: 1px solid rgb(221, 221, 221);
                font-weight: 400;
                line-height: 42px;
                color: rgb(51, 51, 51);
                outline: none;
                box-sizing: border-box;
                border-radius: 3px;
                font-size: 14px;
            }
            .recipient-details__info-value > button {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                right: 12px;
                height: 16px;
                width: 16px;
                background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBmaWxsPSIjOTk5IiBvcGFjaXR5PSIuNSIgY3g9IjgiIGN5PSI4IiByPSI4Ii8+CiAgICAgICAgPGcgc3Ryb2tlPSIjRkZGIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41Ij4KICAgICAgICAgICAgPHBhdGggZD0ibTEwLjg5NyAxMC43ODYtNS43Ny01Ljc2OU01LjEyMiAxMC43ODVsNS43NzUtNS43NzUiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=) 0% 0% / 16px 16px no-repeat transparent;
                border-width: initial;
                border-style: none;
                border-color: initial;
                border-image: initial;
            }
            .recipient-details__location-title {
                display: inline-block;
                padding: 0px 0px 3px;
                font-size: 14px;
                font-weight: 500;
                line-height: 18px;
            }

            .recipient-details__location-main_lbl {
                position: relative;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                height: 44px;
                padding: 0px;
            }

            .recipient-details__location-main_lbl > input[type=radio] {
                overflow: hidden;
            }
            .recipient-details__location-main__span-checked {
                min-width: 24px;
                min-height: 24px;
                display: inline-block;
                position: relative;
                border-radius: 50%;
                border: none;
                background-color: #f58412;
                font-size: 14px;
                line-height: 24px;
            }

            .recipient-details__location-main__span {
                min-width: 24px;
                min-height: 24px;
                display: inline-block;
                position: relative;
                border-radius: 50%;
                background-color: white;
                border: 1px solid rgb(221, 221, 221);
                /*border: none;*/
                /*background-color: #f58412;*/
                font-size: 14px;
                line-height: 24px;
            }

            .recipient-details__location-main__span > div {
                width: 10px;
                height: 10px;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                border-radius: 50%;
                background-color: white;
            }
            .recipient-details__location-main_lbl > span:last-of-type {
                position: relative;
                margin-left: 12px;
                font-size: 14px;
                line-height: 24px;
            }

            .recipient-details__complete-msg_lbl {
                display: inline-block;
                padding: 8px 0px 5px;
                font-size: 14px;
                font-weight: 500;
                line-height: 19px;
            }

            .recipient-details__complete-msg_box {
                display: flex;
            }
            .recipient-details__complete-msg_box > label {
                position: relative;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                padding: 12px 0px 9px;
            }
            .recipient-details__complete-msg_box > label:first-of-type {
                margin-right: 72px;
            }
            .recipient-details__complete-msg_box > label > input {
                overflow: hidden;
            }
            .recipient-details__complete-msg_box__span {
                min-width: 24px;
                min-height: 24px;
                display: inline-block;
                position: relative;
                border-radius: 50%;
                background-color: #f58412;
                font-size: 14px;
            }
            .recipient-details__complete-msg_box__span > div {
                width: 10px;
                height: 10px;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                border-radius: 50%;
                background-color: white;
            }
            .recipient-details__complete-msg_box > label > span:last-of-type {
                font-size: 14px;
                position: relative;
                margin-left: 12px;
            }

            .recipient-details__buttons {
                display: flex;
                flex-direction: row;
                padding-top: 30px;
            }

            .recipient-details__buttons > button {
                cursor: pointer;
            }

            .recipient-details__buttons > button > span {
                display: inline-block;
                font-size: 16px;
                font-weight: 500;
            }
            .recipient-details__buttons > button:first-of-type{
                display: block;
                padding: 0px 10px;
                text-align: center;
                overflow: hidden;
                width: 100%;
                height: 56px;
                border-radius: 3px;
                color: rgb(51, 51, 51);
                background-color: rgb(255, 255, 255);
                border: 1px solid rgb(221, 221, 221);
            }
            .recipient-details__buttons > button:last-of-type{
                display: block;
                padding: 0 10px;
                text-align: center;
                overflow: hidden;
                width: 100%;
                height: 56px;
                border-radius: 3px;
                color: rgb(255, 255, 255);
                border: 0 none;
                background-color: #f58412;
            }
        </style>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <div>
            <div class="recipient-details__title">
                <h2>배송 정보</h2>
                <label class="recipient-details__check">
                    <input type="checkbox" class="recipient-details__checkbox" checked="">
                    <span>주문자 정보와 동일</span>
                </label>
            </div>
            <div class="recipient-details__main">
                <div class="recipient-details__info">
                    <label for="receiver-name">받으실 분</label>
                    <span>*</span>
                    <div height="44" class="recipient-details__info-value">
                        <input data-testid="input-box" id="receiver-name" name="name" placeholder="이름을 입력해 주세요" type="text" required="" height="44" value="정지우">
                        <button size="16" id="delete-input" tabindex="-1" aria-label="delete-input" type="button"></button>
                    </div>
                </div>
                <div class="recipient-details__info">
                    <label for="receiver-phone">휴대폰</label>
                    <span>*</span>
                    <div height="44" class="recipient-details__info-value">
                        <input data-testid="input-box" id="receiver-phone" name="phone" placeholder="숫자만 입력해 주세요" type="tel" required="" height="44" value="01084354496">
                        <button size="16" id="delete-input" tabindex="-1" aria-label="delete-input" type="button"></button>
                    </div>
                </div>
                <div>
                    <label class="recipient-details__location-title">받으실 장소<span>*</span></label>
                    <div class="recipient-details__location-main">
                        <label class="recipient-details__location-main_lbl" for="door">
                            <input data-testid="radio-DOOR" id="door" name="receivePlace" type="radio" value="DOOR" checked="">
                            <span aria-labelledby="door" class="css-mgd87h et8nqc31">문 앞</span>
                        </label>
                        <label class="recipient-details__location-main_lbl" for="security-office">
                            <input data-testid="radio-SECURITY_OFFICE" id="security-office" name="receivePlace" type="radio" value="SECURITY_OFFICE">
                            <span aria-labelledby="security-office">경비실</span>
                        </label>
                    </div>
                </div>
                <div>
                    <label class="recipient-details__complete-msg_lbl">배송 완료 메시지 전송<span>*</span></label>
                    <div class="recipient-details__complete-msg_box">
                        <label for="immediately-after">
                            <input data-testid="radio-IMMEDIATELY" id="immediately-after" name="deliveryCompleteMessage" type="radio" value="IMMEDIATELY" checked="">
                            <span aria-labelledby="immediately-after" >배송 직후</span>
                        </label>
                        <label for="delivery-after">
                            <input data-testid="radio-AM7" id="delivery-after" name="deliveryCompleteMessage" type="radio" value="AM7">
                            <span aria-labelledby="delivery-after">오전 7시</span>
                        </label>
                    </div>
                </div>
                <div class="recipient-details__buttons">
                    <button type="button" height="56" radius="3">
                        <span>취소</span></button>
                    <button type="submit" height="56" radius="3"><span>저장</span></button>
                </div>
            </div>
        </div>
    <script>
        $(".recipient-details__buttons > button:first-of-type").click(() => {
            window.close();
        })

        $(".recipient-details__buttons > button:last-of-type").click(() => {
            let recipient = $("#receiver-name").val();
            let mpno = $("#receiver-phone").val();
            let pickUpLocation = $('.recipient-details__location-main  input:checked').val();
            let completeMsg = $('.recipient-details__complete-msg_box  input:checked').val();

            $.ajax({
                type:'PATCH', // 요청 URI /order/22 PATCH
                url: '/order/recipient-details',
                headers: {"content-type" : "application/json"},
                data : JSON.stringify({recipient: recipient, mpno: mpno, pickUpLocation: pickUpLocation, completeMsg: completeMsg}),
                success : function(result) {
                    window.close();
                },
                error : function() { alert("modifyDelieveryInfo Error")}
            })
        })
    </script>
    </body>
</html>
