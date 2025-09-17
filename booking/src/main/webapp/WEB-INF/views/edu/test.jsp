<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background: #f9f9f9;
    }
    .container {
      display: flex;
      max-width: 1200px;
      margin: 40px auto;
      gap: 30px;
    }
    /* 왼쪽 - 상품 이미지 */
    .product-images {
      flex: 1;
    }
    .product-images img.main {
      width: 100%;
      border: 1px solid #ddd;
      border-radius: 6px;
    }
    .thumbnail-list {
      display: flex;
      flex-direction: column;
      margin-top: 10px;
      gap: 8px;
    }
    .thumbnail-list img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border: 1px solid #ccc;
      border-radius: 4px;
      cursor: pointer;
    }

    /* 오른쪽 - 상품 상세 정보 */
    .product-info {
      flex: 1;
      background: #fff;
      padding: 20px;
      border-radius: 6px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }
    .product-info h1 {
      font-size: 22px;
      margin-bottom: 10px;
    }
    .desc {
      color: #666;
      margin-bottom: 15px;
    }
    .price {
      font-size: 20px;
      color: #e60023;
      margin: 15px 0;
    }
    .old-price {
      text-decoration: line-through;
      color: #888;
      margin-right: 8px;
    }
    .highlight {
      background: #fffae0;
      border: 1px solid #ffe08c;
      padding: 10px;
      margin: 15px 0;
      border-radius: 4px;
      font-size: 14px;
    }
    .shipping {
      font-size: 14px;
      color: #444;
      margin: 15px 0;
    }
    .extra-product {
      margin-top: 25px;
      border-top: 1px solid #ddd;
      padding-top: 15px;
    }
    .extra-product h3 {
      font-size: 16px;
      margin-bottom: 10px;
    }
    .extra-item {
      display: flex;
      gap: 15px;
      align-items: center;
    }
    .extra-item img {
      width: 80px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }
    .buy-btn {
      margin-top: 25px;
      padding: 15px;
      width: 100%;
      background: #ffce00;
      border: none;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }
    .buy-btn:hover {
      background: #ffc107;
    }
  </style>

</head>
<body>
<%@include file="/edu/header.jsp" %>

<div class="container">
  <!-- 왼쪽 영역 -->
  <div class="product-images">
    <img src="https://via.placeholder.com/600x600.png?text=Main+Image" alt="데님 쇼트 데미지 팬츠" class="main">
    <div class="thumbnail-list">
      <img src="https://via.placeholder.com/80.png?text=Thumb1">
      <img src="https://via.placeholder.com/80.png?text=Thumb2">
      <img src="https://via.placeholder.com/80.png?text=Thumb3">
      <img src="https://via.placeholder.com/80.png?text=Thumb4">
    </div>
  </div>

  <!-- 오른쪽 영역 -->
  <div class="product-info">
    <h1>데님 쇼트 데미지 팬츠</h1>
    <p class="desc">데미지 가공으로 캐주얼한 분위기 연출</p>
    <p>• 다양한 코디에 활용 가능<br>
       • 허리 밴드로 사이즈 조절 가능<br>
       • 신축성 좋은 스트레치 소재로 편안한 착용감</p>
    
    <div class="price">
      <span class="old-price">19,000원</span> 
      <strong>17,000원</strong> (11% 할인)
    </div>

    <div class="highlight">카카오톡 채널 추가하고 쿠폰 받기</div>

    <div class="shipping">
      배송방법: 택배 <br>
      배송비: 2,500원 (50,000원 이상 구매 시 무료)
    </div>

    <div class="extra-product">
      <h3>추가 구성상품</h3>
      <div class="extra-item">
        <img src="https://via.placeholder.com/80.png?text=Hat">
        <div>
          <p>와이드 크로셰 햇</p>
          <p><strong>27,000원</strong></p>
        </div>
      </div>
    </div>

    <button class="buy-btn">구매하기</button>
  </div>
</div>

<%@include file="/edu/footer.jsp" %>
</body>
</html>