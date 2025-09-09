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
					<img src="${viewDto.main_img }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">${viewDto.room_name }</h1>
						<p style="font-size: 25px; font-weight: 200; opacity: 0.7;">${viewDto.room_info }</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${viewDto.sub_img1 }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">${viewDto.room_name }</h1>
						<p style="font-size: 25px; font-weight: 200; opacity: 0.7;">${viewDto.room_info }</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${viewDto.sub_img2 }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">${viewDto.room_name }</h1>
						<p style="font-size: 25px; font-weight: 200; opacity: 0.7;">${viewDto.room_info }</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${viewDto.sub_img3 }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">${viewDto.room_name }</h1>
						<p style="font-size: 25px; font-weight: 200; opacity: 0.7;">${viewDto.room_info }</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${viewDto.sub_img4 }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">${viewDto.room_name }</h1>
						<p style="font-size: 25px; font-weight: 200; opacity: 0.7;">${viewDto.room_info }</p>
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
	<form action="/re_data" name="re_form" method="post">
		<div class="container my-4">

			<h1></h1>

			<!-- 객실 정보 + 가격 안내 -->
			<div class="container my-5">
				<h2>객실 정보</h2>
				<ul>
					<li>${viewDto.info1 }</li>
					<li>${viewDto.info2 }</li>
					<li>${viewDto.info3 }</li>
					<li>${viewDto.info4 }</li>
					<li>${viewDto.info5 }</li>
				</ul>

				<h2>가격 안내</h2>
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
							<td>${viewDto.price1 }</td>
							<td>${viewDto.price4 }</td>
						</tr>
						<tr>
							<td>금요일</td>
							<td>${viewDto.price2 }</td>
							<td>${viewDto.price5 }</td>
						</tr>
						<tr>
							<td>주말</td>
							<td>${viewDto.price3 }</td>
							<td>${viewDto.price6 }</td>
						</tr>
					</tbody>
				</table>
			</div>


			<!-- 예약 섹션 -->
			<div class="card p-4 shadow-sm mb-5">
				<h4 class="mb-3">숙박 예약</h4>
				<div class="row g-3 align-items-center">
					<div class="col-md-6">
						<label for="name" class="form-label">예약자 이름</label> <input
							type="text" id="name" class="form-control" placeholder="이름 입력"
							name="name">
					</div>
					<div class="col-md-6">
						<label for="phone" class="form-label">전화번호</label> <input
							type="text" id="phone" class="form-control" placeholder="전화번호 입력"
							name="phone">
					</div>
					<div class="col-md-6">
						<label for="checkin" class="form-label">체크인</label> <input
							type="text" id="checkin" class="form-control" placeholder="날짜 선택"
							name="checkin">
					</div>
					<div class="col-md-6">
						<label for="checkout" class="form-label">체크아웃</label> <input
							type="text" id="checkout" class="form-control"
							placeholder="날짜 선택" name="checkout">
					</div>
				</div>
				<div class="mt-3 fw-bold" id="price-result">총 숙박: 0박 / 금액: 0원</div>
				<input type="hidden" id="nights" name="nights"> <input
					type="hidden" id="totalPrice" name="price">
				<button id="reserveBtn" class="btn btn-primary mt-3" disabled>예약
					확정(결제)</button>
			</div>


		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<script>

const PRICE_PER_NIGHT = ${viewDto.price1 };
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
	  const name = document.getElementById('name').value.trim();
	  const phone = document.getElementById('phone').value.trim();

	  if(checkinDate && checkoutDate){
	    const diffTime = checkoutDate.getTime() - checkinDate.getTime();
	    const nights = Math.floor(diffTime / (1000*60*60*24));

	    if(nights > 0 && name && phone){
	      const totalPrice = nights * PRICE_PER_NIGHT;
	      priceEl.textContent = `총 숙박: \${nights}박 / 금액: \${totalPrice}원`;
	      
	      document.getElementById('nights').value = `\${nights}`;
	      document.getElementById('totalPrice').value = `\${totalPrice}`;
	      
	      
	      reserveBtn.disabled = false;
	    } else {
	      priceEl.textContent = `총 숙박: 0박 / 금액: 0원`;
	      
	      document.getElementById('nights').value = '';
	      document.getElementById('totalPrice').value = '';
	      
	      
	      reserveBtn.disabled = true;
	    }
	  } else {
	    priceEl.textContent = `총 숙박: 0박 / 금액: 0원`;
	    reserveBtn.disabled = true;
	  }
	}

document.getElementById('name').addEventListener('input', updatePrice);
document.getElementById('phone').addEventListener('input', updatePrice);

// 예약 버튼 클릭
reserveBtn.addEventListener('click', function() {
  const name = document.getElementById('name').value.trim();
  const phone = document.getElementById('phone').value.trim();
  const nights = Math.floor((checkoutDate.getTime() - checkinDate.getTime()) / (1000*60*60*24));
  const totalPrice = nights * PRICE_PER_NIGHT;

  alert(
    `예약자 이름: \${name}\n` +
    `전화번호: \${phone}\n` +
    `체크인: \${checkinDate.toISOString().slice(0,10)}\n` +
    `체크아웃: \${checkoutDate.toISOString().slice(0,10)}\n` +
    `총 숙박: \${nights}박 / 금액: \${totalPrice}원`
  );
  
 re_form.submit();
  
  
});

</script>

	<%@ include file="/booking/footer.jsp"%>
</body>
</html>
