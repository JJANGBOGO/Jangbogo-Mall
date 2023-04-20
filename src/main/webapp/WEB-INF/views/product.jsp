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
  <%@ include file="/WEB-INF/views/include/header.jsp" %>
  <%@ include file="/WEB-INF/views/include/navbar.jsp" %>

  <title>Title</title>

  <style>
    #body {
      width: 100%;
      position: relative;
    }

    #body .body-wrap {
      position: relative;
      width: 1050px;
      margin: 0 auto;
      padding-top: 30px;
    }

    #main {
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
    }

    #prod-img {
      width: 430px;
      height: 552px;
      background: url(https://img-cf.kurly.com/shop/data/goods/1653037954138l0.jpeg)
      0% 0% / cover,
      url(https://res.kurly.com/_next/static/images/noimg-150x195-2c819ff….svg)
      50% 50% / contain no-repeat rgb(245, 245, 245);
    }

    #main .info-block {
      width: 560px;
      display: block;
    }
    #prod-title-wrap {
      display: flex;
      flex-direction: column;
    }
    #prop-title {
      display: flex;
      flex: 1;
      -webkit-box-pack: justify;
      justify-content: space-between;
    }
    #prop-title h1 {
      width: 500px;
      font-weight: 500;
      font-size: 24px;
      color: #333;
      line-height: 34px;
      letter-spacing: -0.5px;
      word-break: keep-all;
      margin-right: 20px;
    }
    #prod-title-wrap h2 {
      padding-top: 5px;
      font-size: 14px;
      font-weight: 400;
      color: #b5b5b5;
      line-height: 19px;
      letter-spacing: -0.5px;
    }
    .prod-price-info #prod-dc {
      padding-right: 9px;
      font-size: 28px;
      color: #fa622f;
    }
    .prod-price-info #prod-price {
      padding-right: 4px;
      font-size: 28px;
      color: #333;
    }
    .prod-price-info #prod-unit {
      display: inline-block;
      position: relative;
      top: 3px;
      font-size: 18px;
      color: #333;
      vertical-align: top;
    }
    .info-block #defore-dc {
      display: inline-block;
      font-size: 16px;
      color: #b5b5b5;
      letter-spacing: -0.5px;
      padding-top: 9px;
      text-decoration: line-through;
      margin-right: 0;
    }
    .info-block #defore-dc img {
      width: 21px;
      height: 21px;
      vertical-align: -4px;
      padding-left: 1px;
      cursor: pointer;
    }
    img {
      border: 0;
      max-width: 100%;
    }
    .info-block #info-table {
      margin-top: 20px;
    }
    #info-table .delivery {
      display: flex;
      flex: 1;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .delivery .delColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .delivery .del-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .delivery .del-info .del-name {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .delivery .del-info .del-content {
      display: block;
      font-size: 12px;
      color: #666;
      padding-top: 4px;
      line-height: 16px;
      white-space: pre-line;
    }
    #info-table .seller {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .seller .sellerColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .seller .seller-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .seller .seller-info .seller-name {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .packingType {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .packingType .packingColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .packingType .packing-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .packingType .packing-info .packing-name {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .packingType .packing-info .packing-content {
      display: block;
      font-size: 12px;
      color: #666;
      padding-top: 4px;
      line-height: 16px;
      white-space: pre-line;
    }
    #info-table .salesUnit {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .salesUnit .salesUnitColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .salesUnit .salesUnit-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .salesUnit .salesUnit-info .salesUnit-content {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .volume {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .volume .volColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .volume .vol-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .volume .vol-info .vol-content {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .origin {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .origin .originColumn {
      width: 128px;
      height: 100%;
      color: #333;
      font-weight: 700;
      line-height: 19px;
    }
    #info-table .origin .origin-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .origin .origin-info .origin-content {
      color: #333;
      font-weight: 700;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .expDate {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .expDate .expDateColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .expDate .expDate-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .expDate .expDate-info .expDate-content {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    #info-table .notice {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    #info-table .notice .noticeColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    #info-table .notice .notice-info {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    #info-table .notice .notice-info .notice-content {
      color: #333;
      font-weight: 400;
      line-height: 19px;
      white-space: pre-line;
      word-break: break-all;
      overflow: hidden;
    }
    .info-block .selectItem-block {
      padding-bottom: 40px;
    }
    .info-block .selectItem-block .selectItem-wrap {
      border-bottom: 1px solid rgb(244, 244, 244);
    }
    .info-block .selectItem-block .selectItem-wrap .selectItem {
      display: flex;
      flex-direction: row;
      align-items: flex-start;
      overflow: hidden;
      width: 100%;
      padding: 17px 0 18px;
      border-top: 1px solid #f4f4f4;
      font-size: 14px;
      letter-spacing: -0.5px;
    }
    .info-block .selectItem-block .selectItem-wrap .selectItem .selectItemColumn {
      width: 128px;
      height: 100%;
      color: #666;
      font-weight: 400;
      line-height: 19px;
    }
    .info-block .selectItem-block .selectItem-wrap .selectItem .countItem-block {
      display: flex;
      flex: 1;
      flex-direction: column;
    }
    .info-block
    .selectItem-block
    .selectItem-wrap
    .selectItem
    .countItem-block
    .countItem:last-of-type {
      border-bottom: 1px solid rgb(244, 244, 244);
    }
    .info-block
    .selectItem-block
    .selectItem-wrap
    .selectItem
    .countItem-block
    .countItem {
      display: flex;
      flex-direction: column;
      -webkit-box-pack: justify;
      justify-content: space-between;
      padding: 11px 10px 11px 15px;
      font-size: 12px;
      border-left: 1px solid rgb(244, 244, 244);
      border-top: 1px solid rgb(244, 244, 244);
      border-right: 1px solid rgb(244, 244, 244);
    }
    .info-block
    .selectItem-block
    .selectItem-wrap
    .selectItem
    .countItem-block
    .countItem
    .itemName {
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      align-items: flex-start;
    }
    .info-block
    .selectItem-block
    .selectItem-wrap
    .selectItem
    .countItem-block
    .countItem
    .itemName
    .itemName-content {
      line-height: 16px;
      width: 320px;
      color: rgb(51, 51, 51);
      overflow-wrap: break-word;
    }
    .info-block
    .selectItem-block
    .selectItem-wrap
    .selectItem
    .countItem-block
    .countItem
    span {
      line-height: 16px;
      width: 320px;
      overflow-wrap: break-word;
      font-size: 12px;
      color: rgb(102, 102, 102);
      margin-top: 4px;
    }
    .countItem .countBlock-wrap {
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      -webkit-box-align: center;
      align-items: center;
      padding-top: 12px;
    }
    .countItem .countBlock-wrap .countBlock {
      display: inline-flex;
      flex-direction: row;
      -webkit-box-align: center;
      align-items: center;
      border: 1px solid rgb(221, 223, 225);
      width: 88px;
      border-radius: 3px;
    }
    .countItem .countBlock-wrap .countBlock .downCount {
      display: inline-flex;
      width: 28px;
      height: 28px;
      border: none;
      font-size: 1px;
      color: transparent;
      background-size: cover;
      background-color: transparent;
      background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iI0RERCIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
      vertical-align: top;
    }
    button:disabled {
      cursor: default;
    }
    .countItem .countBlock-wrap .countBlock .num {
      display: inline-flex;
      overflow: hidden;
      white-space: nowrap;
      -webkit-box-pack: center;
      justify-content: center;
      font-size: 14px;
      font-weight: 600;
      color: rgb(51, 51, 51);
      text-align: center;
      width: 31px;
      height: 28px;
      line-height: 28px;
      font-weight: 400;
    }
    .countItem .countBlock-wrap .countBlock .upCount {
      display: inline-flex;
      width: 28px;
      height: 28px;
      border: none;
      font-size: 1px;
      color: transparent;
      background-size: cover;
      background-color: transparent;
      background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xNiAxMHY0aDR2MmgtNHY0aC0ydi00aC00di0yaDR2LTRoMnoiIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyIvPgo8L3N2Zz4K);
      vertical-align: top;
    }
    .countBlock-wrap .m-price .m-price-origin {
      margin-right: 4px;
      font-weight: normal;
      font-size: 12px;
      color: rgb(181, 181, 181);
      text-decoration: line-through;
    }
    .countBlock-wrap .m-price .m-price-dc {
      font-weight: bold;
      font-size: 12px;
      color: rgb(51, 51, 51);
      padding-right: 5px;
    }
    .selectItem-block .totalprice-wrap {
      padding-top: 30px;
    }
    .selectItem-block .totalprice-wrap .totalprice {
      letter-spacing: -0.5px;
    }
    .selectItem-block .totalprice-wrap .totalprice .totalprice-content {
      display: flex;
      -webkit-box-pack: end;
      justify-content: flex-end;
      align-items: flex-end;
    }
    .selectItem-block
    .totalprice-wrap
    .totalprice
    .totalprice-content
    .price-before {
      padding-right: 12px;
      font-size: 13px;
      font-weight: 500;
      color: #333;
      line-height: 20px;
    }
    .selectItem-block .totalprice-wrap .totalprice .totalprice-content .price {
      font-weight: bold;
      font-size: 32px;
      color: #333;
      line-height: 36px;
    }
    .selectItem-block
    .totalprice-wrap
    .totalprice
    .totalprice-content
    .price-after {
      padding-left: 5px;
      font-size: 20px;
      font-weight: 600;
      color: #333;
      line-height: 30px;
    }
    .selectItem-block .totalprice-wrap .totalprice .acc-block {
      display: flex;
      -webkit-box-pack: end;
      justify-content: flex-end;
      padding-top: 10px;
    }
    .selectItem-block .totalprice-wrap .totalprice .acc-block .accColumn {
      background-color: #ffbf00;
      margin: 1px 6px 0 0;
      padding: 0 7px;
      border-radius: 10px;
      font-size: 11px;
      font-weight: 500;
      color: #fff;
      line-height: 20px;
    }
    .selectItem-block .totalprice-wrap .totalprice .acc-block .acc-content {
      line-height: 1.45;
      color: #666;
    }
    .selectItem-block .cart-wrap {
      display: flex;
      gap: 8px;
      margin-top: 20px;
    }
    .selectItem-block .cart-wrap .wishlistBtn {
      display: block;
      padding: 0 10px;
      text-align: center;
      overflow: hidden;
      width: 56px;
      height: 56px;
      border-radius: 3px;
      color: #333;
      background-color: #fff;
      border: 1px solid #ddd;
    }
    .selectItem-block .cart-wrap .wishlistBtn .btn-wrap {
      display: inline-block;
      font-size: 16px;
      font-weight: 500;
    }
    .selectItem-block .cart-wrap .wishlistBtn .btn-wrap img {
      border: 0;
      vertical-align: top;
      max-width: 100%;
    }

    .selectItem-block .cart-wrap .cartBtn-wrap {
      -webkit-box-flex: 1;
      flex-grow: 1;
    }
    .selectItem-block .cart-wrap .cartBtn-wrap .cartBtn {
      display: block;
      padding: 0 10px;
      text-align: center;
      overflow: hidden;
      width: 100%;
      height: 52px;
      border-radius: 3px;
      color: #fff;
      background-color: #5f0080;
      border: 0 none;
      font-weight: 500;
      height: 56px;
    }
    .selectItem-block .cart-wrap .cartBtn-wrap .cartBtn .cartBtn-content {
      display: inline-block;
      font-size: 16px;
      font-weight: 500;
    }
    #product-desc #inquiry .prodInqry-wrap {
      position: relative;
      width: 1010px;
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
      font-weight: 500;
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
      font-weight: 500;
      border-radius: 4px;
      color: rgb(102, 102, 102);
      background-color: rgba(102, 102, 102, 0.06);
    }

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
    .reg_date {
      position: relative;
      padding: 0 16px 20px;
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
      display: block;
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
      padding: 0 11px;
      font-size: 14px;
      line-height: 20px;
      border: 0;
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
      padding: 0 30px 30px;
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
      padding: 0 11px;
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
<div id="top">

  <div id="body" class="css-n48rgu ex9g73v0">

    <div class="body-wrap" >
      <div id="main" class="main">
          <div id="prod-img"></div>
          <section class="info-block">
            <div id="prod-title-wrap">
              <div id="prod-title">
                <h1>${list.name}fff</h1>
              </div>
              <h2 class="prod-ctent"></h2>
            </div>
            <h2 class="prod-price-info">
              <span id="prod-dc">${list.dc_rate}%</span>
              <span id="prod-price">14,320</span>
              <span id="prod-unit">원</span>
            </h2>
            <span id="defore-dc">
                17,900원
              </span>
            <div id="info-table" class="css-iqoq9n e6qx2kx2">
              <div class="delivery">
                <div class="delColumn">배송</div>
                <div class="del-info">
                  <p class="del-name">샛별배송</p>
                  <p class="del-content">
                    23시 전 주문 시 내일 아침 7시 전 도착 (대구·부산·울산
                    샛별배송 운영시간 별도 확인)
                  </p>
                </div>
              </div>
              <div class="seller">
                <div class="sellerColumn">판매자</div>
                <div class="seller-info">
                  <p class="seller-name">컬리</p>
                </div>
              </div>
              <div class="packingType">
                <div class="packingColumn">포장타입</div>
                <div class="packing-info">
                  <p class="packing-name">냉장(종이포장)</p>
                  <p class="packing-content">
                    택배배송은 에코 포장이 스티로폼으로 대체됩니다.
                  </p>
                </div>
              </div>
              <div class="salesUnit">
                <div class="salesUnitColumn">판매단위</div>
                <div class="salesUnit-info">
                  <p class="salesUnit-content">1팩</p>
                </div>
              </div>
              <div class="volume">
                <div class="volColumn">중량/용량</div>
                <div class="vol-info">
                  <p class="vol-content">300g</p>
                </div>
              </div>
              <div class="origin">
                <div class="originColumn">원산지</div>
                <div class="origin-info">
                  <p class="origin-content">호주산</p>
                </div>
              </div>
              <div class="expDate">
                <div class="expDateColumn">유통기한(또는 소비기한)정보</div>
                <div class="expDate-info">
                  <p class="expDate-content">
                    수령일 포함 3일 이상 남은 상품을 보내드립니다.
                  </p>
                </div>
              </div>
              <div class="notice">
                <div class="noticeColumn">주의사항</div>
                <div class="notice-info">
                  <p class="notice-content">
                    해당 상품은 냉장상품이며, 상품 수령후 최대한 빠른 시일 내
                    섭취를 권장드립니다.
                  </p>
                </div>
              </div>
            </div>
            <div class="selectItem-block" css-1bp09d0 e17iylht1>
              <div class="selectItem-wrap" class="css-2lvxh7 e1qy0s5w0">
                <div class="selectItem" class="css-e6zlnr epzddad2">
                  <div class="selectItemColumn">상품선택</div>
                  <div class="countItem-block">
                    <div class="countItem">
                      <div class="itemName">
                        <span class="itemName-content">[델리치오] 호주산 채끝 스테이크 300g (냉장)</span>
                      </div>
                      <span>적립제외상품</span>
                      <div
                              class="countBlock-wrap"
                              class="css-1liqj4s e1bjklo14"
                      >
                        <div class="countBlock">
                          <button class="downCount">수량내리기</button>
                          <div class="num">1</div>
                          <button class="upCount">수량올리기</button>
                        </div>
                        <div class="m-price">
                          <span class="m-price-origin">17,900원</span>
                          <span class="m-price-dc">14,320원</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="totalprice-wrap" class="css-9y0nwt e17iylht0">
                <div class="totalprice">
                  <div class="totalprice-content">
                    <span class="price-before">총 상품금액 :</span>
                    <span class="price">14,320</span>
                    <span class="price-after">원</span>
                  </div>
                  <div class="acc-block">
                    <span class="accColumn">적립</span>
                    <span class="acc-content"
                    >로그인 후, 할인 및 적립 혜택 제공</span
                    >
                  </div>
                </div>
              </div>
              <div class="cart-wrap">
                <button class="wishlistBtn">
                    <span class="btn-wrap">
                      <img
                              class="btn-img"
                              src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhl…vZGQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K"
                              alt=""
                      />
                    </span>
                </button>
                <div class="cartBtn-wrap">
                  <button class="cartBtn">
                    <span class="cartBtn-content">장바구니 담기</span>
                  </button>
                </div>
              </div>
            </div>
          </section>

      </div>
      <div id="product-desc">
        <div id="description"></div>
        <div id="detail"></div>
        <div id="review"></div>
        <div id="inquiry">
          <div class="prodInqry-wrap">
            <div class="prodInqry">
              <button class="open-modal"><span>문의하기</span></button>
              <div class="modal">
                <div id="modal-body" class="modal_body">
                  <div class="inqry_head">
                    <h4>상품 문의하기</h4>
                    <button type="button" class="xBtn">
                      <span></span>
                    </button>
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
                    상품에 대한 문의를 남기는 공간입니다. 해당 게시판의
                    성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수
                    있습니다.
                  </li>
                  <li class="warn_2">
                    배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은
                    마이컬리 내 1:1문의에 남겨주세요.
                  </li>
                </ul>
              </div>
              <div class="inqry-notice-wrap">
                <div class="inqry-notice">
                  <div class="notice_title">
                    <span id="notice-title-span">공지</span>
                  </div>
                  <div class="text">
                    <span>공지내용</span>
                  </div>
                </div>
              </div>
              <div class="inqry-body">
                <div id="prodInqryList">
                  <table id="table"></table>
                </div>
              </div>
              <div class="paging-container">


              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
  <div id="prod_idx">${prod_idx}</div>
  <div id="sessionID" style="display: none">${session_idx}</div>
  <div class="footer"></div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
  // let prod_idx = 9;

  let showInqryList = function(prod_idx) {
    $.ajax({
      type:'GET',       // 요청 메서드
      url: '/product/inqry/list?prod_idx='+prod_idx,  // 요청 URI
      success : function(result){
        $('#table').html(InqrytoHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
      },
      error : function() { alert("GETerror") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
  }

  let showProdDetailList = function(prod_idx) {
    $.ajax({
      type: 'GET',
      url: '/product/productDetail/list?prod_idx'+prod_idx,
      success: function(result) {
        $('#main').html(prodDetailtoHtml(result));
      }
    })
  }

  let prodDetailtoHtml = function() {


  }

  $(document).ready(function(){
    // let idx = $('#sessionID').text();
    let prod_idx = $('#prod_idx').text();
    showInqryList(prod_idx);
    showProdDetailList(prod_idx);

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

    $(".open-modal").click(function(e) {
      target = $(e.target);
      let p = $(target).offset();

      let divTop = p.top + 400;
      let divLeft = p.left - 500;

      $('#modal-body').css({"z-index": '10', "top": divTop, "left": divLeft, "position": "absolute"}).show();


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
      let prod_idx = $('#prod_idx').text();

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
        url: '/product/inqry/write?prod_idx='+prod_idx,  // 요청 URI   // /product?prod_idx=1 POST
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({prod_idx:prod_idx, title:title, ctent:ctent}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(){
          alert("문의가 등록되었습니다.");
          showInqryList(prod_idx);
        },
        error   : function(){ alert("Wrterror") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
    });

    // 동적으로 생성되는, 문의에 달려있는 "수정" 버튼을 누르면
    $("#table").on("click", ".modBtn", function(e) {

      target = $(e.target).closest("tr");
      let p = $(target).offset();

      let divTop = p.top + 0;
      let divLeft = p.left + 350;

      $('#modal-body').css({"z-index": '10', "top": divTop, "left": divLeft, "position": "absolute"}).show();

      let user_idx = $(this).closest("tr").attr("data-user_idx");
      //수정 버튼이 포함되어 있는 tr 라인 안에 들어있는 idx를 가져온다.
      //title과 ctent의 내용들도 가져와서 변수에 담는다.
      let idx = $(this).closest("tr").attr("data-idx");
      let ctent = $(this).closest("tr").children().children().children().find('div:eq(1)[name=text]').children().text();
      let inquiry_idx = $(this).closest("tr").attr("data-idx");
      let dtoArr = $(".modBtn").closest("tr").siblings("tr[data-idx=" + inquiry_idx + "]");
      let title = dtoArr[0].dataset.title;

      if(user_idx != $('#sessionID').text()) {
        alert("수정권한이 없습니다.");
        return;
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
      let prod_idx = $('#prod_idx').text();
      //등록 버튼을 눌러 새롭게 정보를 저장한다.
      $.ajax({
        type:'PATCH',
        url: '/product/inqry/'+idx+'?prod_idx='+prod_idx,
        headers: {"content-type": "application/json"},
        data: JSON.stringify({title:newTitle, ctent:newCtent}),
        success: function() {
          alert("수정되었습니다.")
          showInqryList(prod_idx);
        },
        error: function() {alert("수정권한이 없습니다")}
      })
      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");

      let inqryButton = $(".inqry_button");
      console.log("inqryButton = "+ inqryButton)
      inqryButton[0].children[1].remove();
      //태그 생성
      let sendBtn = $('<button class="register" id="sendBtn">등록</button>');
      inqryButton.append(sendBtn);
      return;
    });


    $("#table").on("click", ".delBtn", function() { //prodInqryList 안에 있는 delBtn에 click 이벤트를 건다.

      let user_idx = $(this).closest("tr").attr("data-user_idx");
      let idx = $(this).closest("tr").attr("data-idx");
      let prod_idx = $('#prod_idx').text();
      // let prod_idx = $(this).closest("tr").attr("data-prod_idx");
      if(user_idx != $('#sessionID').text()) {
        alert("삭제권한이 없습니다.")
        return;
      }

      $.ajax({
        type:'DELETE',       // 요청 메서드
        url: '/product/inqry/list/'+idx+'?prod_idx='+prod_idx,  // 요청 URI
        success : function(){
          alert("삭제되었습니다.");
          showInqryList(prod_idx);
        },
        error   : function(){ alert("삭제권한이 없습니다.") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    })
  });

  let InqrytoHtml = function(inqrys) {  //GetMapping통해서 정보 들어온다.

    let tmp = "<tbody>";
    tmp += "<tr>";
    tmp += "<th>제목</th>";
    tmp += "<th>작성자</th>";
    tmp += "<th>작성일</th>";
    tmp += "<th>답변상태</th></tr>";



    inqrys.forEach(function(inqry) {
      console.log(inqry.res_state_cd);
      let res_state_cd = "";
      if(inqry.res_state_cd == 1) {
        res_state_cd = "답변대기";
      } else if(inqry.res_state_cd == 2) {
        res_state_cd = "답변완료"
      }


      let timeStamp = Date.now();
      // [2]. 타임 스탬프 >> Date 로 변환
      let reg_date = new Date(inqry.wrt_tm);
      let answer_date = new Date(inqry.ans_write_time);
      // [3]. moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
      let now24Date = moment(reg_date).format("YYYY-MM-DD");
      let now24Date2 = moment(answer_date).format("YYYY-MM-DD");
      console.log("?????", now24Date)


      tmp += '<tr id="noticeBlock" data-idx=' + inqry.idx
      tmp += ''
      tmp += ' data-prod_idx=' + inqry.prod_idx
      tmp += ' data-title=' + inqry.title
      tmp += ' data-ctent='+ inqry.ctent
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td id="noticeBlock-title" class="title" data-opub_yn=' + inqry.opub_yn + '><span id="title-text">' + inqry.title + '</span></td>'
      tmp += '<td class="name" data-user_idx=' + inqry.user_idx + '>' + inqry.writer + '</td>'
      tmp += '<td class="reg_date" >' + now24Date+ '</td>'
      tmp += '<td id="res-state-cd" class="response_state" >'+res_state_cd+'</td>'
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
      tmp += '<div class="reg_date"><span>' + now24Date2 + '</span>'
      tmp += '<div class="btnGroup" id="btnGroup">'
      tmp +=    '<button class="modBtn">수정</button>'
      tmp +=    '<button class="delBtn">삭제</button>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</td>'
      tmp += '</tr>'
    })
    return tmp += "</tbody>";
  }
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
