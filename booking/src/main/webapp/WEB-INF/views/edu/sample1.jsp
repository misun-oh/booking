<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container {
      width: 1000px;
      margin: 50px auto; /* 화면 중앙 정렬 */
      padding: 20px;
      border: 1px solid #ccc;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      text-align: center;
    }
    .search-box {
      width: 70%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .search-btn {
      padding: 10px 20px;
      font-size: 16px;
      margin-left: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .search-btn:hover {
      background-color: #45a049;
    }
  </style>

</head>
<body>
<%@include file="/edu/header.jsp" %>
<div class="container">
    <input type="text" class="search-box" placeholder="검색어를 입력하세요">
    <button class="search-btn">검색</button>
  </div>
    


<%@include file="/edu/footer.jsp" %>
</body>
</html>