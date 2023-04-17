<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-08
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
    .prodInqry-wrap {
      position: relative;
      width: 1010px;
      /* background-color: rgb(190, 185, 201); */
      padding-bottom: 148px;
      margin: 0 auto;
    }

    .prodInqry-wrap .prodInqry {
      margin-bottom: 60px;
    }

    .prodInqry-wrap .prodInqry .open-modal {
      position: absolute;
      right: 0;
      border-radius: 5px;
      display: block;
      width: 120px;
      height: 40px;
      background-color: #5f0080;
      color: white;
      border: 0 none;
      text-align: center;
    }
    .prodInqry-wrap .prodInqry .open-modal span {
      display: inline-block;
      font-weight: 500;
      font-size: 14px;
    }

    .modal {
      position: absolute;
      top: 0;
      left: 0;

      width: 100%;
      height: 100%;

      display: none;

      background-color: rgba(0, 0, 0, 0.4);
    }

    /*.modal.show {*/
    /*  display: block;*/
    /*}*/

    .modal .modal_body {
      position: absolute;
      top: 50%;
      left: 50%;

      width: 600px;
      height: 600px;

      padding: 40px;

      text-align: center;

      background-color: rgb(246, 246, 246);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
      z-index: 1;
    }
    .modal_body .inqry_head {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }
    .modal_body .inqry_head .xBtn {
      position: relative;
      width: 50px;
      height: 50px;
      border: none;
      display: inline-block;
      padding: 25px;
      margin: 10px;
      text-align: center;
      background-image: url("data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0ibm9uZSIgZD0iTTAgMGgzMnYzMkgweiIvPgogICAgICAgIDxnIHN0cm9rZT0iIzk5OSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIj4KICAgICAgICAgICAgPHBhdGggZD0iTTI2IDI2IDYgNk02IDI2IDI2IDYiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZD0ibTYuMjg0IDUuNTg5LjA3LjA1N0wxNiAxNS4yOTNsOS42NDYtOS42NDdhLjUuNSAwIDAgMSAuNzY1LjYzOGwtLjA1Ny4wN0wxNi43MDcgMTZsOS42NDcgOS42NDZhLjUuNSAwIDAgMS0uNjM4Ljc2NWwtLjA3LS4wNTdMMTYgMTYuNzA3bC05LjY0NiA5LjY0N2EuNS41IDAgMCAxLS43NjUtLjYzOGwuMDU3LS4wN0wxNS4yOTMgMTYgNS42NDYgNi4zNTRhLjUuNSAwIDAgMSAuNjM4LS43NjV6IiBmaWxsPSIjOTk5Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=");
      background-size: cover;
      background-position: center center;
      cursor: pointer;
    }
    .modal .modal_body .xBtn span {
      display: flex;
      align-items: center;
      justify-content: center;
      /* line-height: 0px; */
    }

    .modal_body .inqry_head h4 {
      font-size: 30px;
      line-height: 0;
    }

    .modal_body .inqry_sub {
      display: flex;
      position: relative;
      left: 12px;
    }

    .modal_body .inqry_sub img {
      position: absolute;
      width: 72px;
      height: 72px;
      object-fit: cover;
      border-radius: 5px;
      background-color: white;
      background-position: 50% 50%;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      justify-content: flex-start;
      flex-basis: 0;
      flex-shrink: 1;
      flex-grow: 1;
    }

    .modal_body .inqry_sub div {
      display: flex;
      flex-basis: 0;
      flex-grow: 6.5;
      align-items: center;
      padding: 30px;
    }

    .modal_body .inqry_sub div span {
      position: relative;
      left: 80px;
    }

    .modal_body .inqry_title {
      display: flex;
      margin-top: 16px;
      justify-content: space-between;
    }
    .modal_body .inqry_title .title {
      width: 100px;
      padding-top: 12px;
    }

    .modal_body .inqry_title .title span {
    }
    .modal_body .inqry_title .title_input {
      height: 44px;
      flex-grow: 6.5;
      flex-shrink: 1;
      flex-basis: 0;
    }
    .modal_body .inqry_title .title_input input {
      height: 44px;
      width: 444px;
      padding: 0px 11px 0px 15px;
      font-size: 14px;
    }
    .modal_body .inqry_content {
      display: flex;
      margin-top: 16px;
      justify-content: space-between;
    }
    .modal_body .inqry_content .content {
      width: 100px;
      padding-top: 12px;
    }
    .modal_body .inqry_content .content span {
    }
    .modal_body .inqry_content .content_input {
      height: 44px;
      flex-grow: 6.5;
      flex-shrink: 1;
      flex-basis: 0;
    }
    .modal_body .inqry_content .content_input input {
      height: 265px;
      width: 444px;
      padding: 0px 11px 0px 15px;
      font-size: 14px;
    }

    .modal_body .inqry_secret {
      display: flex;
      position: absolute;
      bottom: 93px;
      margin: 0;
    }
    .modal_body .inqry_secret .secret_head {
      width: 100px;
      padding-top: 12px;
    }
    .modal_body .inqry_secret label {
      position: relative;
      display: flex;
      align-items: center;
      font-size: 14px;
      line-height: 30px;
      margin-left: 10px;
    }
    .modal_body .inqry_secret label input {
    }
    .modal_body .inqry_secret label span {
    }

    .modal_body .inqry_button {
      position: absolute;
      bottom: 40px;
      left: 153px;
    }
    .modal_body .inqry_button .closeBtn {
      width: 115px;
      height: 42px;
    }
    .modal_body .inqry_button .register {
      width: 115px;
      height: 42px;
    }

    .prodInqry-wrap .prodInqry .inqry-head {
      padding-bottom: 33px;
      letter-spacing: -0.5px;
    }

    .prodInqry-wrap .prodInqry .inqry-head span {
      display: block;
      padding-bottom: 10px;
      font-size: 24px;
      font-weight: 500px;
      line-height: 21px;
      color: #333;
    }
    .prodInqry-wrap .prodInqry .inqry-head div {
      color: #999;
      font-weight: 400;
      line-height: 19px;
      margin-top: 6px;
    }
    .prodInqry-wrap .prodInqry .inqry-head div .warn_1 {
      padding-left: 10px;
    }

    .prodInqry-wrap .prodInqry .inqry-head div .warn_2 {
      padding-left: 10px;
    }

    .prodInqry-wrap .prodInqry .inqry-notice-wrap {
      height: 64px;
      line-height: 19px;
      letter-spacing: -0.5px;
      padding-bottom: 14px;
      padding-top: 10px;
      border-top: 1px solid rgb(244, 244, 244);
    }

    .prodInqry-wrap .prodInqry .inqry-notice-wrap .inqry-notice {
      position: relative;
      display: flex;
      justify-content: space-between;
      text-align: left;
      padding: 0px 20px;
      cursor: pointer;
    }
    .prodInqry-wrap .prodInqry .inqry-notice-wrap .inqry-notice .notice-title {
      padding: 4px 8px;
      margin-right: 12px;
      font-size: 12px;
      font-weight: 500px;
      border-radius: 4px;
      color: rgb(102, 102, 102);
      background-color: rgba(102, 102, 102, 0.06);
    }

    /*.prodInqry-wrap .prodInqry .inqry-notice-wrap .inqry-notice .notice-title #notice-title-span{*/
    /*  background-color: darkgray;*/
    /*  padding: 4px;*/
    /*  width: 40px;*/
    /*  height: 22px;*/
    /*  text-align: center;*/
    /*  line-height: 21px;*/
    /*  border-radius: 5px;*/
    /*}*/

    .prodInqry-wrap .prodInqry .inqry-notice-wrap .inqry-notice .text {
      position: absolute;
      left: 96px;
      padding-top: 3px;
    }
    .prodInqry-wrap .prodInqry .inqry-notice-wrap .inqry-notice .text span {
      line-height: 14px;
    }

    .prodInqry-wrap .prodInqry .inqry-body {
      box-sizing: border-box;
      margin: 0px;
    }
    .prodInqry-wrap .prodInqry .inqry-body #prodInqryList {
      width: 100%;
    }
    .prodInqry-wrap .prodInqry .inqry-body #prodInqryList table {
    }
    .prodInqry-wrap .prodInqry .inqry-body #prodInqryList table tr:nth-child(1) {
      box-sizing: border-box;
      margin: 0;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(1)
    th:nth-child(1) {
      width: 710px;
      font-weight: 500;
      letter-spacing: -0.5px;
      color: #333;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(1)
    th:nth-child(2) {
      width: 100px;
      font-weight: 500;
      letter-spacing: -0.5px;
      color: #333;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(1)
    th:nth-child(3) {
      width: 100px;
      font-weight: 500;
      letter-spacing: -0.5px;
      color: #333;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(1)
    th:nth-child(4) {
      width: 100px;
      font-weight: 500;
      letter-spacing: -0.5px;
      color: #333;
    }
    .prodInqry-wrap .prodInqry .inqry-body #prodInqryList table tr:nth-child(2) {
      height: 64px;
      border-bottom: 1px solid rgb(244, 244, 244);
      line-height: 19px;
      letter-spacing: -0.5px;
    }

    tbody #noticeBlock {
      postion: relative;
      height: 64px;
      border-bottom: 1px solid rgb(244, 244, 244);
      line-height: 19px;
      letter-spacing: -0.5px;
    }
    tbody #noticeBlock .title #title-text {
      position: absolute;
      left: 24px;
      line-height: 0px;
    }

    tbody #noticeBlock .name {
      text-align: center;
      color: rgb(153, 153, 153);
    }

    tbody #noticeBlock .reg_date {
      text-align: center;
      color: rgb(153, 153, 153);
    }

    tbody #noticeBlock #res-state-cd {
      text-align: center;
      color: rgb(95, 0, 128);
    }

    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(2)
    .title {
      text-align: left;
      padding: 0px 20px;
      cursor: pointer;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(2)
    .name {
      text-align: center;
      color: rgb(153, 153, 153);
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(2)
    .reg_date {
      text-align: center;
      color: rgb(153, 153, 153);
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    tr:nth-child(2)
    .response_state {
      text-align: center;
      color: rgb(95, 0, 128);
    }

    .prodInqry-wrap .prodInqry .inqry-body #prodInqryList table .accordion-wrap {
      background-color: rgb(250, 250, 250);
      border-bottom: 1px solid rgb(244, 244, 244);
      max-width: 100px;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion {
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap {
      max-width: 1010px;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap
    .request {
      display: flex;
      padding: 22px 20px 30px;
      align-items: flex-start;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap
    .request
    .img {
      box-sizing: border-box;
      margin: 0;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap
    .request
    .img
    .glasses {
      width: 24px;
      height: 24px;
      display: block;
      background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ0NSAtODc2KSB0cmFuc2xhdGUoNDIzIDI3NikgdHJhbnNsYXRlKDIgMzE2KSB0cmFuc2xhdGUoMjAgMjg0KSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjEyIiBmaWxsPSIjQTg2NEQ4Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik0xMS45NDYgNy41YzIuNDU2IDAgNC40NDYgMS45OSA0LjQ0NiA0LjQ0NiAwIC45MDctLjI3MSAxLjc1LS43MzcgMi40NTNsLjg0NS44NDMtMS4yNTggMS4yNTgtLjg0My0uODQ1Yy0uNzAzLjQ2Ni0xLjU0Ni43MzctMi40NTMuNzM3LTIuNDU1IDAtNC40NDYtMS45OS00LjQ0Ni00LjQ0NkM3LjUgOS40OTEgOS40OSA3LjUgMTEuOTQ2IDcuNXptMCAxLjc3OGMtMS40NzMgMC0yLjY2OCAxLjE5NS0yLjY2OCAyLjY2OHMxLjE5NSAyLjY2OCAyLjY2OCAyLjY2OGMuNDEyIDAgLjgwMi0uMDk0IDEuMTUtLjI2bC0uMzY5LS4zNyAxLjI1OC0xLjI1Ny4zNjkuMzY5Yy4xNjYtLjM0OC4yNi0uNzM4LjI2LTEuMTUgMC0xLjQ3My0xLjE5NS0yLjY2OC0yLjY2OC0yLjY2OHoiLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=");
      background-position: center center;
      background-repeat: no-repeat;
      background-size: contain;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap
    .request
    .text {
      margin-left: 12px;
      padding-top: 2px;
      font-size: 14px;
      word-break: break-all;
      line-height: 19px;
      letter-spacing: -0.5px;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .request-wrap
    .request
    .text
    span {
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap {
      max-width: 1010px;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .response {
      display: flex;
      padding: 22px 20px 30px;
      align-items: flex-start;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .response
    .img {
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .response
    .img
    span {
      width: 24px;
      height: 24px;
      display: block;
      background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ0NSAtMTkxOCkgdHJhbnNsYXRlKDQyMyAyNzYpIHRyYW5zbGF0ZSgyIDE2MjIpIHRyYW5zbGF0ZSgyMCAyMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIGQ9Ik05Ljc2IDE1LjcwOGwuNTQtMS40MDRoMy40NTZsLjU1MiAxLjQwNGgyLjE0OEwxMyA3LjVoLTEuOTMyTDcuNiAxNS43MDhoMi4xNnptMy4zMjQtMy4xMzJoLTIuMTEybDEuMDU2LTIuNzEyIDEuMDU2IDIuNzEyeiIvPgogICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==");
      background-position: center center;
      background-repeat: no-repeat;
      background-size: contain;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .response
    .text {
      margin-left: 12px;
      padding-top: 2px;
      font-size: 14px;
      word-break: break-all;
      line-height: 19px;
      letter-spacing: -0.5px;
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .response
    .text
    div {
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .reg_date {
      position: relative;
      padding: 0px 16px 20px;
      margin-left: 40px;
      font-size: 14px;
      line-height: 22px;
      color: rgb(153, 153, 153);
    }
    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .reg_date
    .btnGroup {
      position: absolute;
      right: 22px;
      top: 5px;
    }

    .prodInqry-wrap
    .prodInqry
    .inqry-body
    #prodInqryList
    table
    .accordion-wrap
    .accordion
    .response-wrap
    .reg_date
    .btnGroup
    button {
      position: relative;
      padding: 0px 11px;
      font-size: 14px;
      line-height: 20px;
      border: 0px;
      background: none;
      color: rgb(153, 153, 153);
    }
    .no-answer-a-wrap {
      background-color: rgb(250, 250, 250);
      border-bottom: 1px solid rgb(244, 244, 244);
      max-width: 100px;
    }
    .no-answer-a-wrap .accordion {
    }
    .no-answer-a-wrap .accordion .request-wrap {
      max-width: 1010px;
    }
    .no-answer-a-wrap .accordion .request-wrap .request {
      display: flex;
      padding: 22px 20px 30px;
      align-items: flex-start;
    }
    .no-answer-a-wrap .accordion .request-wrap .request .img {
    }
    .no-answer-a-wrap .accordion .request-wrap .request .img .glasses {
      width: 24px;
      height: 24px;
      display: block;
      background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ0NSAtODc2KSB0cmFuc2xhdGUoNDIzIDI3NikgdHJhbnNsYXRlKDIgMzE2KSB0cmFuc2xhdGUoMjAgMjg0KSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjEyIiBmaWxsPSIjQTg2NEQ4Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik0xMS45NDYgNy41YzIuNDU2IDAgNC40NDYgMS45OSA0LjQ0NiA0LjQ0NiAwIC45MDctLjI3MSAxLjc1LS43MzcgMi40NTNsLjg0NS44NDMtMS4yNTggMS4yNTgtLjg0My0uODQ1Yy0uNzAzLjQ2Ni0xLjU0Ni43MzctMi40NTMuNzM3LTIuNDU1IDAtNC40NDYtMS45OS00LjQ0Ni00LjQ0NkM3LjUgOS40OTEgOS40OSA3LjUgMTEuOTQ2IDcuNXptMCAxLjc3OGMtMS40NzMgMC0yLjY2OCAxLjE5NS0yLjY2OCAyLjY2OHMxLjE5NSAyLjY2OCAyLjY2OCAyLjY2OGMuNDEyIDAgLjgwMi0uMDk0IDEuMTUtLjI2bC0uMzY5LS4zNyAxLjI1OC0xLjI1Ny4zNjkuMzY5Yy4xNjYtLjM0OC4yNi0uNzM4LjI2LTEuMTUgMC0xLjQ3My0xLjE5NS0yLjY2OC0yLjY2OC0yLjY2OHoiLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=);
      background-position: center center;
      background-repeat: no-repeat;
      background-size: contain;
    }
    .no-answer-a-wrap .accordion .request-wrap .request .text {
      margin-left: 12px;
      padding-top: 2px;
      font-size: 14px;
      word-break: break-all;
      line-height: 19px;
      letter-spacing: -0.5px;
    }
    .no-answer-a-wrap .accordion .request-wrap .request .text span {
    }
    .no-answer-a-wrap .accordion .request-wrap .btn-for-Change {
      position: relative;
      width: 100%;
      padding: 0px 30px 30px;
      display: flex;
      -webkit-box-pack: end;
      justify-content: flex-end;
    }
    .no-answer-a-wrap .accordion .request-wrap .btn-for-Change .btnGroup {
      position: absolute;
      right: 80px;
    }

    .no-answer-a-wrap .accordion .request-wrap .btn-for-Change .btnGroup button {
      position: relative;
      padding: 0px 11px;
      font-size: 14px;
      line-height: 20px;
      border: 0px;
      background: none;
      color: rgb(153, 153, 153);
    }

    .prodInqry-wrap .prodInqry .paging-container {
      position: relative;
      width: 100%;
      height: 44px;
      display: -webkit-box;
      display: -webkit-flex;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-align-items: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      margin-top: 20px;
    }
    .prodInqry-wrap .prodInqry .paging-container .button-left {
      background-image: url(https://res.kurly.com/kurly/ico/2021/paging-prev-disabled.svg);
      cursor: default;
      width: 44px;
      height: 44px;
      padding: 0;
      margin: 0;
      border: 0;
      background-color: transparent;
      background-image: url(https://res.kurly.com/kurly/ico/2021/paging-prev-activated.svg);
      background-repeat: no-repeat;
      -webkit-background-size: cover;
      background-size: cover;
    }
    .prodInqry-wrap .prodInqry .paging-container .button-right {
      margin-left: 12px;
      width: 44px;
      height: 44px;
      padding: 0;
      margin: 0;
      border: 0;
      cursor: pointer;
      background-color: transparent;
      background-image: url(https://res.kurly.com/kurly/ico/2021/paging-next-activated.svg);
      background-repeat: no-repeat;
      -webkit-background-size: cover;
      background-size: cover;
    }

    .footer {
    }
  </style>
</head>
<body>
  <div class="prodInqry-wrap">
    <div class="prodInqry">
      <button class="open-modal"><span>문의하기</span></button>
      <div class="modal">
        <div id="modal-body" class="modal_body">
          <div class="inqry_head">
            <h4>상품 문의하기</h4>
            <button type="button" class="xBtn"><span></span></button>
          </div>
          <div class="inqry_sub">
            <img
                    src="https://img-cf.kurly.com/shop/data/goods/1655775819130l0.jpg"
            />
            <div>
              <span>[스윗밸런스]오늘의 샐러드 10종 (리뉴얼)(택1)</span>
            </div>
          </div>
          <div class="inqry_title">
            <div class="title">
              <span>제목</span>
            </div>
            <div class="title_input">
              <input id="modal-title" type="text" />
            </div>
          </div>
          <div class="inqry_content">
            <div class="content">
              <span>내용</span>
            </div>
            <div class="content_input">
              <input id="modal-ctent" type="text" />
            </div>
          </div>
          <div class="inqry_secret">
            <div class="secret_head"></div>
<%--            <label for="isSecret">--%>
<%--              <input id="isSecret" type="checkbox" name="opub_yn"/>--%>
<%--              <span>비밀글로 문의하기</span>--%>
<%--            </label>--%>
          </div>
          <div class="inqry_button">
            <button class="closeBtn">취소</button>
            <button class="register" id="sendBtn">등록</button>
          </div>
        </div>
      </div>
      <div class="inqry-head">
        <span>상품문의</span>
        <ul>
          <li class="warn_1">
            상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은
            사전동의 없이 담당 게시판으로 이동될 수 있습니다.
          </li>
          <li class="warn_2">
            배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내
            1:1문의에 남겨주세요.
          </li>
        </ul>
      </div>
      <div class="inqry-notice-wrap">
        <div class="inqry-notice">
          <div class="notice_title"><span id="notice-title-span">공지</span></div>
          <div class="text">
            <span>공지내용</span>
          </div>
        </div>
      </div>
      <div class="inqry-body">
        <div id="prodInqryList">
          <table id="table">

<%--            <c:forEach var="boardDto" items="${list}">--%>
<%--              <tr>--%>
<%--                <td class="no">${boardDto.bno}</td>--%>
<%--                <td class="title"><a href="<c:url value="/board/read${ph.sc.queryString}&bno=${boardDto.bno}"/>"><c:out value="${boardDto.title}"/></a></td>--%>
<%--                <td class="writer">${boardDto.writer}</td>--%>
<%--                <c:choose>--%>
<%--                  <c:when test="${boardDto.reg_date.time >= startOfToday}">--%>
<%--                    <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>--%>
<%--                  </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                <td class="viewcnt">${boardDto.view_cnt}</td>--%>
<%--              </tr>--%>
<%--            </c:forEach>--%>

          </table>
        </div>
      </div>
      <div class="paging-container">
        <button class="button-left"></button>
        <button class="button-right"></button>
      </div>
    </div>
  </div>
  <div id="sessionID" style="display: none">${session_idx}</div>
  <div class="footer"></div>

<script>
  let prod_idx = 12;
  let showList = function(prod_idx) {
    $.ajax({
      type:'GET',       // 요청 메서드
      url: '/product/list?prod_idx='+prod_idx,  // 요청 URI
      success : function(result){
        $('#table').html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
        $('.response_state').html(resStateToString(result));
        // $('#btnGroup').html(checkMyBoard(result));
      },
      error : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
  }

  let xBtn = function() {
    $(".xBtn").click(function() {
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);

    })
  }

  let closeBtn = function() {
    $(".closeBtn").click(function() {
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);


    })
  }

  $(document).ready(function(){
    // console.log("prodInqryDto = "+prodInqryDto);
    // console.log("session_idx = "+session_idx);

    showList(prod_idx);

    $(".xBtn").click(function() {
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);
      return;
    })

    $(".closeBtn").click(function() {
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);

      return;
    })

    $(".open-modal").click(function() {
      let inqryButton = $(".inqry_button");
      if(inqryButton[0].children[1].textContent == '수정') {
        // 태그 제거 해줌
        let inqryButton = $(".inqry_button");
        inqryButton[0].children[1].remove();
        //태그 생성
        let modBtn = $('<button class="register" id="sendBtn">등록</button>');
        inqryButton.append(modBtn);

      }

      $(".modal").css("display", "block");
    })

    // $("#sendBtn").click(function() {
    $(".inqry_button").on("click", "#sendBtn", function() {
      let ctent = $("input[id=modal-ctent]").val();
      let title = $("input[id=modal-title]").val();
      let opub_yn;

      if($("input:checkbox[id='isSecret']").is(":checked")) {
        opub_yn = 'N';
      } else {
        opub_yn = 'Y';
      }

      if(title.trim()=='') {
        alert("제목을 입력해주세요");
        $("input[id=modal-title]").focus();
        return;
      }

      if(ctent.trim()=='') {
        alert("내용을 입력해주세요");
        $("input[id=modal-ctent]").focus();
        return;
      }

      $.ajax({
        type:'POST',       // 요청 메서드
        url: '/product/write?prod_idx='+prod_idx,  // 요청 URI   // /product?prod_idx=1 POST
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({prod_idx:prod_idx, title:title, ctent:ctent, opub_yn:opub_yn}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          alert("문의가 등록되었습니다.");
          showList(prod_idx);
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input:checkbox[id='isSecret']").prop("checked", false);
    });

    // 동적으로 생성되는, 문의에 달려있는 "수정" 버튼을 누르면
    $("#table").on("click", ".modBtn", function() {

      // console.log("session_idx"+session_idx);
      // if(session_idx.idx !== )
      let user_idx = $(this).closest("tr").attr("data-user_idx");
      //수정 버튼이 포함되어 있는 tr 라인 안에 들어있는 idx를 가져온다.
      //title과 ctent의 내용들도 가져와서 변수에 담는다.
      let idx = $(this).closest("tr").attr("data-idx");
      let ctent = $(this).closest("tr").children().children().children().find('div:eq(1)[name=text]').children().text();
      let inquiry_idx = $(this).closest("tr").attr("data-idx");
      let dtoArr = $(".modBtn").closest("tr").siblings("tr[data-idx=" + inquiry_idx + "]");
      let title = dtoArr[0].dataset.title;

      let opub_yn = $(this).closest("tr").attr("data-opub_yn");
      console.log("opub_yn="+opub_yn);
      if(user_idx !== $(sessionID).text()) {
        alert("수정권한이 없습니다.");
        return;
      }

      let isChecked = function (yn) {
        if (yn == 'N') {
          return "true";
        } else if (yn == 'Y'){
          return "false";
        }
        return
      }

      let inqryButton = $(".inqry_button");

      //버튼을 "수정"으로 변경
      if(inqryButton[0].children[1].textContent == '등록') {
        // 태그 제거 해줌
        let inqryButton = $(".inqry_button");
        inqryButton[0].children[1].remove();
        //태그 생성
        let modBtn = $('<button class="register" id="modBtn">수정</button>');
        inqryButton.append(modBtn);

      }

      //idx값을 새로 생성한 태그에 사용자 정의 속성으로 전달
      $("#modBtn")[0].setAttribute("data-idx", idx);

      //게시물에 있던 내용들을 옮겨왔다.
      $("input[id=modal-title]").val(title);
      $("input[id=modal-ctent]").val(ctent);
      $("input:checkbox[id='isSecret']").prop("checked", isChecked(opub_yn));

      //모달이 열린다.
      $(".modal").css("display", "block");



    });

    $(".inqry_button").on("click", "#modBtn", function() {

      //속성 data-idx의 값을 저장한다.
      let idx = $(this).attr("data-idx");
      console.log("id 수정 버튼을 눌렀을 때 = "+idx);
      //동일하게 불러온 정보를 변수에 저장한다.
      let newTitle = $("input[id=modal-title]").val();
      let newCtent = $("input[id=modal-ctent]").val();
      let newOpub_yn = $("input[type=checkbox]").attr("checked");

      //등록 버튼을 눌러 새롭게 정보를 저장한다.
      $.ajax({
        type:'PATCH',
        url: '/products/'+idx+'?prod_idx='+prod_idx,
        headers: {"content-type": "application/json"},
        data: JSON.stringify({idx:idx, prod_idx:prod_idx, title:newTitle, ctent:newCtent, opub_yn: newOpub_yn}),
        success: function(result) {
          alert("수정되었습니다.")
          showList(prod_idx);
        },
        error: function() {alert("수정권한이 없습니다")}
      })
      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);

      let inqryButton = $(".inqry_button");
      console.log("inqryButton = "+ inqryButton)
      inqryButton[0].children[1].remove();
      //태그 생성
      let sendBtn = $('<button class="register" id="sendBtn">등록</button>');
      inqryButton.append(sendBtn);
      return;
    });


    $("#table").on("click", ".delBtn", function() { //prodInqryList 안에 있는 delBtn에 click 이벤트를 건다.

      let idx = $(this).closest("tr").attr("data-idx");
      let prod_idx = $(this).closest("tr").attr("data-prod_idx");

      $.ajax({
        type:'DELETE',       // 요청 메서드
        url: '/products/'+idx+'?prod_idx='+prod_idx,  // 요청 URI
        success : function(result){
          alert("삭제되었습니다.");
          showList(prod_idx);
        },
        error   : function(){ alert("삭제권한이 없습니다.") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    })
  });

  let resStateToString = function(states) {
    let tmp = "";

    states.forEach((state) => {
      if(state.res_state_cd == 1) {
        tmp = "답변대기";
        return;
      } else if (state.res_state_cd == 2) {
        tmp = "답변완료";
        return;
      }
    })
    return tmp;
  }

  // let checkMyBoard = (result) => {
  //   result.forEach(one, () => {
  //     // 1. 세션에서 저장한 id값(user_idx)과 data-uid를 비교한다.
  //     // 2.1 둘이 같을 경우, jquery css visibility를 display 처리
  //     // 2.2 다를 경우, jquery css visibility를 hidden 처리
  //   })
  // }
  // let showList = (user_idx) => {
  //   // ajax 요청(비동기)
  //   $.ajax({
  //     type:'GET',
  //     url:'/cart/list?user_idx=' + user_idx,
  //     success: (result) => {  // 성공 응답이 오면, 장바구니 목록, 주문정보, 체크박스 정보를 페이지에 랜더링하기
  //       $('#cartItems').html(listToHtml(result));       // listToHtml메서드 호출
  //       checkMyBoard(result)  // :TODO user_idx에 해당하는 회원이 쓴 글의 경우 보기, 수정 버튼을 보여준다.
  //       $('#cartEstimate').html(estimateToHtml(result));    // estimateToHtml메서드 호출
  //       $('#totalChkBox').html(checkBoxToHtml(result)); // checkBoxToHtml메서드 호출
  //     },
  //     error : function() { alert("comment get error");}   // 실패 응답이 오면, 경고창 띄우기
  //   });  // $.ajax() end
  // }

  let checkMyBoard = function(buttons) {
    let tmp = "";
    buttons.forEach(function(button) {
      if($(".according-wrap").attr("data-user_idx") == $("#sessionID").text()) {
        return tmp += '<button class="modBtn">수정</button><br/><button class="delBtn">삭제</button>'
      }

    })
    return tmp;
  }


  let toHtml = function(inqrys) {  //GetMapping통해서 정보 들어온다.

    let tmp = "<tbody>";
    tmp += "<tr>";
    tmp += "<th>제목</th>";
    tmp += "<th>작성자</th>";
    tmp += "<th>작성일</th>";
    tmp += "<th>답변상태</th></tr>";

    inqrys.forEach(function(inqry) {
      tmp += '<tr id="noticeBlock" data-idx=' + inqry.idx
      tmp += ''
      tmp += ' data-prod_idx=' + inqry.prod_idx
      tmp += ' data-title=' + inqry.title
      tmp += ' data-ctent='+ inqry.ctent
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td id="noticeBlock-title" class="title" data-opub_yn=' + inqry.opub_yn + '><span id="title-text">' + inqry.title + '</span></td>'
      tmp += '<td class="name" data-user_idx=' + inqry.user_idx + '>' + inqry.writer + '</td>'
      tmp += '<td class="reg_date" >' + inqry.wrt_tm + '</td>'
      tmp += '<td id="res-state-cd" class="response_state" >'+inqry.res_state_cd+'</td>'
      tmp += '</tr>'
      tmp += '<tr class="accordion-wrap" data-idx=' + inqry.idx
      tmp += ' data-prod_idx='+ inqry.prod_idx
      tmp += ' data-user_idx='+ inqry.user_idx
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td class="accordion" colspan="4">'
      tmp += '<div class="request-wrap">'
      tmp += '<div class="request">'
      tmp += '<div class="img">'
      tmp += '<span class="glasses">'
      tmp += '</span>'
      tmp += '</div>'
      tmp += '<div id="noticeBlock-ctent" name="text" class="text">'
      tmp += '<span>' + inqry.ctent
      tmp += '</span>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '<div class="response-wrap">'
      tmp += '<div class="response">'
      tmp += '<div class="img">'
      tmp += '<span>'
      tmp += '</span>'
      tmp += '</div>'
      tmp += '<div class="text">'
      tmp += '<div>' + inqry.ans_content
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '<div class="reg_date"><span>' + inqry.ans_write_time + '</span>'
      tmp += '<div class="btnGroup" id="btnGroup">'
      tmp +=    '<button class="modBtn">수정</button>'
      tmp +=    '<button class="delBtn">삭제</button>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</td>'
      tmp += '</tr>'
      // 나의 문의에 답변이 안 달렸을 시
      // tmp +=    '<tr class="no-answer-a-wrap" data-idx=' + inqry.idx
      // tmp +=    ' data-prod_idx=' + inqry.prod_idx
      // tmp +=    ' data-ctent=' + inqry.ctent + '>'
      // tmp +=    '<td class="accordion" colspan="4">'
      // tmp +=    '<div class="request-wrap">'
      // tmp +=    '<div class="request">'
      // tmp +=    '<div class="img">'
      // tmp +=    '<span class="glasses"></span>'
      // tmp +=    '</div>'
      // tmp +=    '<div class="text">'
      // tmp +=    '<span>'+inqry.ctent+'</span>'
      // tmp +=    '</div>'
      // tmp +=    '</div>'
      // tmp +=    '<div class="btn-for-Change">'
      // tmp +=    '<div class="btnGroup">'
      // tmp +=    '<button class="modBtn" >수정</button>'
      // tmp +=    '<button class="delBtn" >삭제</button>'
      // tmp +=    '</div>'
      // tmp +=    '</div>'
      // tmp +=    '</div>'
      // tmp +=    '</td>'
      // tmp +=    '</tr>'
      //나의 문의에 답변이 안 달렸을 시 끝
    })
    return tmp += "</tbody>";
  }
</script>
</body>
</html>
