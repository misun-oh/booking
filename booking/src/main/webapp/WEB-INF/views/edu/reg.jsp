<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 선택</title>

  <style>
    .btn-container {
      display: flex;
      flex-direction: column; /* 위아래 배치 */
      align-items: center;    /* 가운데 정렬 */
      gap: 20px;              /* 버튼 사이 간격 */
      margin-top: 50px;
    }

    .img-btn {
	  width: 600px;              /* 버튼 가로 크기 600px */
	  height: 300px;             /* 버튼 세로 크기 300px */
	  border: none;              /* 버튼 기본 테두리 제거 */
	  cursor: pointer;           /* 마우스를 올리면 손가락 모양(클릭 가능 표시) */
	  background-size: cover;    /* 배경 이미지를 버튼 크기에 맞춰 채움 (잘릴 수 있음) */
	  background-position: center; /* 배경 이미지를 버튼의 중앙에 위치시킴 */
    }

    .btn1 {
      background-image: url("res/imgs/student.jpg");
    }

    .btn2 {
      background-image: url("res/imgs/Instructor.jpg");
    }
  </style>

</head>
<body>
<%@include file="/edu/header.jsp" %>
  <div class="btn-container">
    <button class="img-btn btn1" onclick="location.href='/page1'"></button>
    <button class="img-btn btn2" onclick="location.href='/page2'"></button>
  </div>
  
	<br>
	<br>
  

<%@include file="/edu/footer.jsp" %>
</body>
</html>