<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${instructor.name} | 강사 상세보기</title>
<style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
      padding: 0;
      background: #fff;
      color: #333;
    }

    .container {
      display: flex;
      max-width: 1200px;
      margin: 40px auto;
      gap: 40px;
    }

    /* 상품 이미지 */
    .product-image {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid #eee;
      border-radius: 8px;
      background: #fafafa;
      padding: 20px;
    }
    .product-image img {
      max-width: 100%;
      height: auto;
      border-radius: 6px;
    }

    /* 상품 정보 */
    .product-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .title {
      font-size: 20px;
      font-weight: 600;
    }

    .price {
      font-size: 24px;
      font-weight: bold;
      color: #000;
    }

    .label {
      font-weight: bold;
      margin-right: 10px;
    }

    .options select, .options button {
      padding: 8px;
      font-size: 14px;
      margin-top: 5px;
    }

    .color-options {
      display: flex;
      gap: 8px;
      margin-top: 5px;
    }
    .color-box {
      width: 32px;
      height: 32px;
      border-radius: 4px;
      border: 1px solid #ccc;
      cursor: pointer;
    }

    .order-box {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-top: 20px;
    }
    .order-box input {
      width: 50px;
      text-align: center;
      padding: 5px;
    }
    .buy-btn {
      flex: 1;
      padding: 12px;
      background: #222;
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      border: none;
      cursor: pointer;
      border-radius: 6px;
    }
    .buy-btn:hover {
      background: #000;
    }
     .hidden {
    display: none;
  }
  </style>
</head>
<body>

<%@ include file="/edu/header.jsp" %>

<div class="container">

  <!-- 강사 이미지 -->
  <div class="product-image">
    <img src="/download/${instructor.file_id}/${instructor.attach_idx}" alt="${instructor.name} 강사 이미지">
  </div>

  <!-- 강사 정보 -->
  <div class="product-info">
    <div class="title">${instructor.name} 강사</div>
    <div class="price">${instructor.word}</div>

   
    <c:if test="${empty intructor.category_id}">
      <div><span class="label">카테고리 ID</span> ${instructor.category_id}</div>
    </c:if>

    

    

    <div class="order-box">
      
      <button class="buy-btn" onclick="subscribe()">구독하기</button>
    </div>
    
    <!-- 숨겨진 영상 영역 -->
    <div id="video-section" class="hidden" style="margin-top: 20px;">
      <h3>강의 영상</h3>
      <video width="640" height="360" controls>
        <source src="/video/sample.mp4" type="video/mp4">
        해당 브라우저는 video 태그를 지원하지 않습니다.
      </video>
    </div>
   
    <script type="text/javascript">
    	function subscribe() {
			alert("구독 하셨습니다")
			
			 // 숨겨진 영상 보이게 하기
	        document.getElementById("video-section").classList.remove("hidden");
		}
    </script>
  </div>

</div>

<%@ include file="/edu/footer.jsp" %>

</body>
</html>