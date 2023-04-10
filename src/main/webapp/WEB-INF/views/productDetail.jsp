<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-03
  Time: 오후 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <title>Document</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }
    .container {
      width : 50%;
      margin : auto;
    }
    .writing-header {
      position: relative;
      margin: 20px 0 0 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #323232;
    }
    input {
      width: 100%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      background: #f8f8f8;
      outline-color: #e6e6e6;
    }
    textarea {
      width: 100%;
      background: #f8f8f8;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }
    .frm {
      width:100%;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }
    .btn:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <h2>상품 문의</h2>
  <button class="btn-open-popup" id="writeNewInqryBtn">문의하기</button>
  <form class="modal" id="inqryWrite" method="post">
    <div class="modal_body">
      <div class="head">
        <h1>상품문의하기</h1>
        <button>X</button>
      </div>
      <div class="body_1">
        <!-- <img
          src="	https://img-cf.kurly.com/shop/data/goods/1655775819130l0.jpg
        "
          alt=""
        /> -->
        <div class="prod-title">
          <span>[스윗밸런스] 오늘의 샐러드 10종 (리뉴얼) (택1)</span>
        </div>
      </div>
      <div class="body_21">
        <div class="inqry-title">
          <span>제목</span>
        </div>
        <div class="inqry-title-input">
          <input type="text" name="titleInput" value="" />
        </div>
        <div class="inqry-content">
          <span>내용</span>
        </div>
        <div class="inqry-content-input">
          <input type="text" name="contentInput" />
        </div>
      </div>
      <input type="checkbox" id="isSecret" name="isSecret" value="secret"/>
      <label for="isSecret">비밀글로 문의하기</label>
      <button type="button" id="cancelInqryBtn">취소</button>
      <button type="submit" id="writeInqryBtn">등록</button>
    </div>
  </form>
  <table board="1">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성날짜</th>
      <th>답변상태</th>
    </tr>
    <c:forEach var="prodInqryDtoEl" items="${prodInqryDtoList}">
      <tr>
        <td>${prodInqryDtoEl.idx}</td>
        <td><a href="<c:url value='/product/list?idx=${prodInqryDtoEl.idx}'/>"> ${prodInqryDtoEl.title}</a></td>
        <td>${prodInqryDtoEl.writer}</td>
        <td><fmt:formatDate value="${prodInqryDtoEl.wrt_tm}" pattern="yyyy.MM.dd" type="date"/></td>
        <td>${prodInqryDtoEl.res_state_cd}</td>
      </tr>
    </c:forEach>
  </table>
<%--  제목을 누르면 게시판 내용과 답변이 아코디언 형식으로 나온다. --%>
  <div class="inqry-content">
    <img />
    <div class="inqry-content-text">${prodInqryDto.ctent}</div>
  </div>
  <%--      문의에 대한 댓글이 달렸을 시 나오는 아코디언--%>
  <div class="inqry-answer" data-getAnswerd="false">
    <img />
    <div class="inqry-answer-text"></div>
    <div class="inqry-answer-regdate"></div>
  </div>
  <%--      수정, 삭제 버튼은 항상있다. 작성자 본인이 아닐때만 안보인다. --%>
  <div data-isWriter="false">
    <button data-getAnswerd="false" id="modifyInqryBtn">수정</button>
    <button data-getAnswerd="false" type="button" id="deleteInqryBtn">삭제</button>
  </div>
  <br>
  <div>
    <c:if test="${ph.showPrev}">
      <a href="<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
      <a href="<c:url value='/product/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
    </c:forEach>
    <c:if test="${ph.showNext}">
      <a href="<c:url value='/product/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
    </c:if>

    <script>
      const modal = document.querySelector(".modal");
      const btnOpenPopup = document.querySelector(".btn-open-popup");
      const input = document.querySelector('input[name="isSecret"]');

      btnOpenPopup.addEventListener("click", () => {
        modal.style.display = "block";
        modal.style.overflow = "hidden";
      });
      //checkbox 토글값

      $(document).ready(function () {
        let formCheck = function() {
          let form = document.getElementById("inqryWrite");
          if(form.titleInput.value=="") {
            alert("제목을 입력해주세요");
            form.titleInput.focus();
            return false;
          }
          if(form.contentInput.value=="") {
            alert("내용을 입력해 주세요.");
            form.contentInput.focus();
            return false;
          }
          return true;
        }
        $('#writeInqryBtn').on("click", function() {
          let form = $("#inqryWrite");
          form.attr("action", "<c:url value='/product/list'/>");
          form.attr("method", "post");
          if(formCheck()) {
            form.submit();
          }
        })
        $('#deleteInqryBtn').on("click", function() {
          let form = $("#inqryWrite");
          form.attr("action", "<c:url value='/product/list'/>?page=${page}&pageSize=${pageSize}");
          form.attr("method", "post");
          form.submit();
        })
        $("input[type=checkbox]").change(function () {
          if (this.checked) {
            console.log(input.checked);
          } else {
            console.log(input.checked);
          }
        });
      });
    </script>
  </div>
</body>
</html>
