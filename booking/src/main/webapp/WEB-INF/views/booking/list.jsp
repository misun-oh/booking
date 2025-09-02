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
  .room {
    width: 100%;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
  }
  .room img {
    width: 100%;
    height: 300px;
    object-fit: cover;
  }
  .room-no {
    flex: 1;
    margin-left: 10px;
    margin-top : 10px;
    font-size: 25px;
    font-weight: bold;
  }
  .room-info {
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

  <c:forEach items="${list }" var="room">
   <div class="room">
      <img src="${room.main_img }" alt="${room.room_name }">
      <div class="room-no">${room.room_no }</div>  
      <!-- info + button 묶음 -->
      <div class="info-row">
      	<div class="room-info">${room.room_info }</div>
      	<button class="btn" onclick="location.href='/view?room_no=${room.room_no}'"> 상세 보기</button>
      </div>

     </div>
  </c:forEach> 

</div>


<%@include file="/common/pageing.jsp" %>
<%@include file="/common/search2.jsp" %>
</div> 

<%@include file="/booking/footer.jsp" %>
</body>
</html>