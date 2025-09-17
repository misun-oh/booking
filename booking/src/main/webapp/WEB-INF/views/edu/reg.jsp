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
      width: 600px;
      height: 300px;
      border: none;
      cursor: pointer;
      background-size: cover;
      background-position: center;
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

<%@include file="/edu/footer.jsp" %>
</body>
</html>