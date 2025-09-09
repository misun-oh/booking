<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room List</title>
</head>
<body>
<%@include file="/booking/header.jsp" %>

<style>
  .container {
    display: flex;
    flex-direction: column; /* 1열 세로 배치 */
    gap: 10px;
  }
  .notice {
    width: 100%;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
  }
 
  .notice_id {
    flex: 1;
    margin-left: 10px;
    margin-top : 10px;
    font-size: 25px;
    font-weight: bold;
  }
  .notice-info {
    flex: 1;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    font-size: 18px;
    align-items: flex-start;
	  overflow: visible;           /* 넘치면 숨김 */
	  text-overflow: ellipsis;    /* ... 표시 */
  }
  .info-row {
  display: flex;
  align-items: center;        /* 세로 중앙 정렬 */
  justify-content: space-between; /* 좌측 info, 우측 버튼 */
  gap: 10px; /* 글자와 버튼 간격 */
  }

  .btn {
  	flex-shrink: 0; /* 버튼 크기 줄어둘지 않게  */
    background: #c05010;
    margin-right: 10px;
    color: #fff;
    border: none;
    padding: 10px 18px;
    border-radius: 10px;
    cursor: pointer;
    height: fit-content;
  }
  .btn:hover {
    background: #a0400c;
  }
</style>

<div class="container">
  <table class="qna-table">
    <thead>
      <tr>
        <th>공지번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>등록일</th>
        <th>열람수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${noticeList }" var="noticeList">
        <tr>
          <td>${noticeList.notice_id}</td>
          <td>${noticeList.title}</td>
          <td style="max-width:400px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
            ${noticeList.content}
          </td>
          <td>${noticeList.created_at}</td>
          <td>${noticeList.view_count}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<%@include file="/common/search2.jsp" %>
<%@include file="/common/pageing.jsp" %>
<%@include file="/booking/footer.jsp" %>
</body>
</html>
