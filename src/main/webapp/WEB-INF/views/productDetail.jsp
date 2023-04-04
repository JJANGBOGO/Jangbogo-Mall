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

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <button>문의하기</button>
  <div>
    <h2></h2>
    <div>
      <img url=""/>
      <div>[델리치오]목초육 안심 구이용 250g</div>
    </div>
  </div>
  <form action="">
    <div>제목</div>
    <input type="text"/>
    <div>내용</div>
    <input type="text"/>
    <button>취소</button>
    <button>등록</button>
  </form>
  <table board="1">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성날짜</th>
      <th>답변상태</th>
    </tr>
    <c:forEach var="prodInqryDtoEl" items="${prodInqryDto}">
      <tr>
        <td>${prodInqryDtoEl.idx}</td>
        <td>${prodInqryDtoEl.title}</td>
        <td>${prodInqryDtoEl.writer}</td>
        <td><fmt:formatDate value="${prodInqryDtoEl.wrt_tm}" pattern="yyyy.MM.dd" type="date"/></td>
        <td>${prodInqryDtoEl.res_state_cd}</td>
      </tr>
    </c:forEach>
  </table>

</body>
</html>
