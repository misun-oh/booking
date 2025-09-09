<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ROOM INFO</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
<body>
	<%@ include file="/booking/header.jsp"%>

	<div class="container-fluid">


		<div id="carouselExampleCaptions" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="res/img/room1/main.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1>Main Room1</h1>
						<p>Hotel as I Like.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="res/img/room1/sub_img1.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>2 slide label</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="res/img/room1/sub_img2.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>3 slide label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="res/img/room1/sub_img3.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>4 slide label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="res/img/room1/sub_img4.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>5 slide label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container my-4">

		<h1>디럭스 더블 (Deluxe Room)</h1>

		<!-- 객실 정보 + 가격 안내 -->
		<div class="container my-5">
			<h3>객실정보</h3>
			<ul>
				<li>인원 : 기본 2인 / 최대 3인<br>8세이상 인원 추가시 추가비용 20,000원(현장결재)
				</li>
				<li>구조 : 룸 1, 욕실 1, 화장실 1, 베란다, 퀸사이즈 침대 1</li>
				<li>입실 PM14:00시작 / 퇴실 OM12:00 까지<br>24시간 체크인(24H Front
					desk)
				</li>
				<li>미니바, 무선인터넷(Wi-Fi), 무료주차, 수영장, 에어컨, 시티뷰</li>
				<li>어매니티 : 치약, 칫솔, 드라이어, 면봉세트, 가운x2, 타올x4, 비치타올x2, 전기포트, 물
					500mlx2, 컵x2, 샴푸, 린스, 바디워시, 비누</li>
			</ul>

			<h3 class="mt-4">가격 안내</h3>
			<table class="table table-bordered text-center">
				<thead class="table-light">
					<tr>
						<th>구분</th>
						<th>비수기</th>
						<th>성수기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>주중</td>
						<td>90,000</td>
						<td>180,000</td>
					</tr>
					<tr>
						<td>금요일</td>
						<td>110,000</td>
						<td>200,000</td>
					</tr>
					<tr>
						<td>주말</td>
						<td>130,000</td>
						<td>220,000</td>
					</tr>
				</tbody>
			</table>
		</div>


		<!-- 예약 섹션 -->
		<div class="card p-4 shadow-sm mb-5">
			<h4 class="mb-3">숙박 예약</h4>
			<div class="row g-3 align-items-center">
				<div class="col-md-6">
					<label for="checkin" class="form-label">체크인</label> <input
						type="text" id="checkin" class="form-control" placeholder="날짜 선택">
				</div>
				<div class="col-md-6">
					<label for="checkout" class="form-label">체크아웃</label> <input
						type="text" id="checkout" class="form-control" placeholder="날짜 선택">
				</div>
			</div>
			<div class="mt-3 fw-bold" id="price-result">총 숙박: 0박 / 금액: 0원</div>
			<button id="reserveBtn" class="btn btn-primary mt-3" disabled>예약
				확정(결제)</button>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<script>
const PRICE_PER_NIGHT = 200000;
let checkinDate = null;
let checkoutDate = null;

// 체크인 달력
const fpIn = flatpickr("#checkin", {
  dateFormat: "Y-m-d",
  minDate: "today",
  onChange: function(selectedDates) {
    checkinDate = selectedDates[0] ? new Date(selectedDates[0].getFullYear(), selectedDates[0].getMonth(), selectedDates[0].getDate()) : null;
    fpOut.set('minDate', checkinDate || "today"); 
    updatePrice();
  }
});

// 체크아웃 달력
const fpOut = flatpickr("#checkout", {
  dateFormat: "Y-m-d",
  minDate: "today",
  onChange: function(selectedDates) {
    checkoutDate = selectedDates[0] ? new Date(selectedDates[0].getFullYear(), selectedDates[0].getMonth(), selectedDates[0].getDate()) : null;
    updatePrice();
  }
});

const reserveBtn = document.getElementById('reserveBtn');

function updatePrice() {
  const priceEl = document.getElementById('price-result');

  if(checkinDate && checkoutDate){
    const diffTime = checkoutDate.getTime() - checkinDate.getTime();
    const nights = Math.floor(diffTime / (1000*60*60*24));

    if(nights > 0){
      priceEl.textContent = `총 숙박: \${nights}박 / 금액: \${nights*PRICE_PER_NIGHT}원`;
      reserveBtn.disabled = false;
    } else {
      priceEl.textContent = `총 숙박: 0박 / 금액: 0원`;
      reserveBtn.disabled = true;
    }
  } else {
    priceEl.textContent = `총 숙박: 0박 / 금액: 0원`;
    reserveBtn.disabled = true;
  }
}

// 예약 버튼 클릭
reserveBtn.addEventListener('click', function() {
  alert(`예약이 확정되었습니다!\n체크인: ${checkinDate.toISOString().slice(0,10)}\n체크아웃: ${checkoutDate.toISOString().slice(0,10)}`);
});
</script>

	<%@ include file="/booking/footer.jsp"%>
</body>
</html>
