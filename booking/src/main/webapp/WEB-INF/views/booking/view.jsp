<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/booking/header.jsp" %>

<div class="container">
    
    
    <div id="carouselExampleCaptions" class="carousel slide">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active">
		    <img src="/res/img/room.png" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h5>First slide label</h5>
		      <p>Some representative placeholder content for the first slide.</p>
		    </div>
		  </div>
		  <div class="carousel-item">
		    <img src="/res/img/room.png" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h5>Second slide label</h5>
		      <p>Some representative placeholder content for the second slide.</p>
		    </div>
		  </div>
		  <div class="carousel-item">
		    <img src="/res/img/room.png" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h5>Third slide label</h5>
		      <p>Some representative placeholder content for the third slide.</p>
		    </div>
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	</div>
    
    <h1>디럭스 룸 (Deluxe Room)</h1>

    <div class="info">
      <div>
        <h3>객실정보</h3>
        <ul>
          <li>한실 구조, 침대룸, 화장실</li>
          <li>기준 2인 / 최대 2인</li>
          <li>건물: 기준층 / 복층구조</li>
          <li>시설: TV, 에어컨, 냉장고, 전자렌지, 세면도구 등</li>
          <li>입실: 오후 3시 / 퇴실: 오전 11시</li>
        </ul>
      </div>
    </div>

    <h3>가격안내</h3>
    <table class="price-table">
      <thead>
        <tr>
          <th>구분</th>
          <th>비수기</th>
          <th>성수기</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>주중</td>
          <td>200,000</td>
          <td>300,000</td>
        </tr>
        <tr>
          <td>금요일</td>
          <td>220,000</td>
          <td>320,000</td>
        </tr>
        <tr>
          <td>주말</td>
          <td>240,000</td>
          <td>340,000</td>
        </tr>
      </tbody>
    </table>

    <div class="booking">
      <h2>숙박일정<br><small>(날짜 선택)</small></h2>
      <button>입실</button>
      <button>퇴실</button>

      <div class="price-amount">금액(₩) : 220,000 원</div>
      <button class="confirm-button">예약 확정(결제)</button>
    </div>
  </div>  

<%@include file="/booking/footer.jsp" %>
</body>
</html>