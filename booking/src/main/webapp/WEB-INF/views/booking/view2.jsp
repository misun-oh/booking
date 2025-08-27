<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ROOM INFO</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
<body>
<%@ include file="/booking/header.jsp" %>

<div class="container my-4">

  <h1>디럭스 더블 (Deluxe Room)</h1>

  <!-- 예약 섹션 -->
  <div class="card p-4 shadow-sm mb-5">
    <h4 class="mb-3">숙박 예약</h4>
    <div class="row g-3 align-items-center">
      <div class="col-md-6">
        <label for="checkin" class="form-label">체크인</label>
        <input type="text" id="checkin" class="form-control" placeholder="날짜 선택">
      </div>
      <div class="col-md-6">
        <label for="checkout" class="form-label">체크아웃</label>
        <input type="text" id="checkout" class="form-control" placeholder="날짜 선택">
      </div>
    </div>
    <div class="mt-3 fw-bold" id="price-result">총 숙박: 0박 / 금액: 0원</div>
    <button id="reserveBtn" class="btn btn-primary mt-3" disabled>예약 확정(결제)</button>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
      priceEl.textContent = `총 숙박: ${nights}박 / 금액: ${nights*PRICE_PER_NIGHT}원`;
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

<%@ include file="/booking/footer.jsp" %>
</body>
</html>
