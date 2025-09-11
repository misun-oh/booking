<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내맘대로 HOTEL</title>
  <script src="https://kit.fontawesome.com/08035877d1.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
  <script src="/res/js/script.js"></script>
  
  
  <style>
    body {
      margin: 0;
      font-family: 'Helvetica', 'Arial', sans-serif;
      color: #333;
      background-color: #fff;
    }
    header {
      align: left;
      padding: 30px 100px;
      background: #fff;
      border-bottom: 1px solid #eee;
    }
    .logo {
      display: flex;
      justify-content:center;
      align-items: center;
      gap: 10px;
      font-size: 1.5rem;
      margin-bottom: 20px;
    }
    .logo img {
      width: 350px;
    }
    .nav {
      display: flex;
      justify-content:center;
      gap: 25px;
      
    }
    a{
    	color:#222;
    	text-decoration: none;
    }
    .user-menu {
    	position:absolute;
    	top:20px;
    	right:220px;
      	display: flex;
      	justify-content: flex-end;
      	gap : 10px;
      	font-size: 0.7rem;
    }
    .hero {
      width: 100%;
      height: auto;
    }
    .info-section {
      padding: 40px 60px;
      background: #f7f7f7;
    }
    .info-section h1 {
      font-size: 30px;
     
    }
    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
    }
    .info-section p {
      font-size: 14px;
      line-height: 1.8;
      color: #555;
    }
    .footer {
      padding: 30px 60px;
      border-top: 1px solid #ddd;
      font-size: 13px;
    }
    .footer-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .footer-icons {
      font-size: 1.2rem;
      width: 100px;
      margin-left: 10px;
    }
    .footer-bottom {
      display: flex;
      gap: 20px;
      color: #777;
      font-size: 12px;
    }
        .room {
      width: 768px;
      margin: 0 auto 40px auto;
      border: 1px solid #eee;
    }
    .room img {
      width: 100%;
      height: auto;
    }
    .room-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px;
      background-color: #fff;
    }
    .room-text {
      text-align: left;
    }
    .room-text h3 {
      margin: 0;
      font-size: 18px;
    }
    .room-text p {
      font-size: 13px;
      color: #333;
      margin-top: 8px;
      line-height: 1.6;
    }
    .btn {
      background-color: #c14d00;
      color: white;
      padding: 10px 20px;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .pagination {
      margin-top: 20px;
      font-size: 13px;
      color: #888;
    }
    
        .room-image {
      width: 100%;
      border-radius: 10px;
    }
    h1 {
      text-align: center;
      margin: 30px 0 10px;
    }
    .info, .price {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }
    .info ul {
      list-style: none;
      padding-left: 0;
    }
    .price-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    .price-table th, .price-table td {
      border: 1px solid #ccc;
      padding: 10px;
      text-align: center;
    }
    .booking {
      text-align: center;
      margin-top: 40px;
    }
    .booking h2 {
      margin-bottom: 10px;
    }
    .booking button {
      background-color: black;
      color: white;
      border: none;
      padding: 10px 20px;
      margin: 10px;
      font-size: 16px;
      cursor: pointer;
    }
    .price-amount {
      font-size: 24px;
      font-weight: bold;
      margin: 20px 0;
    }
    .confirm-button {
      background-color: #b30000;
      color: white;
      border: none;
      padding: 15px 30px;
      font-size: 18px;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <!-- 헤더 -->
  <div class="user-menu">
      <a href="/login1">로그인</a>
      <a href="/register1">회원가입</a>
      <a href="/mypage1">마이페이지</a>
      <a href="/input">강의 영상 등록</a>
      <a href="/input2">강사 등록</a>
      <a href="/wr_notice">공지 등록</a>
  </div>
  <header>
    <div class="logo">
       <a href="/main1"><img src="/res/imgs/logo2.jpg" alt="로고" /></a>
     
    </div>
    
    <nav class="nav">
      <a href="/study">AI/CODING</a>
      <a href="#">요리/취미</a>
      <a href="#">운동/건강</a>
      <a href="/main1">언어 교육</a>
      <a href="/notice_re">초등 교육</a>
      <a href="/qna">중학 교육</a>
      <a href="#">고등 교육</a>
      <a href="notice_edu">공지사항</a>
    </nav>
    
  </header>
</html>
</body>