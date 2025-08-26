<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ROOM INFO</title>

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
  /* 배너 화면 영역 */
  .banner {
    position: relative;
    width: 1920px;
    height: 800px;
    overflow: hidden;
    margin: 0 auto;
    border: 1px solid #ccc;
  }
  .slides {
    display: flex;
    width: 9600px;
    transition: transform 1s ease;
  }
  .slides img {
    width: 1920px;
    height: 800px;
    object-fit: cover;
    flex-shrink: 0;
  }
  .prev, .next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0,0,0,0.5);
    color: #fff;
    border: none;
    font-size: 40px;
    cursor: pointer;
    padding: 10px 20px;
    z-index: 10;
  }
  .prev { left: 10px; }
  .next { right: 10px; }
  .indicators {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
  }
  .indicators div {
    width: 12px;
    height: 12px;
    background: rgba(255,255,255,0.5);
    border-radius: 50%;
    cursor: pointer;
  }
  .indicators .active {
    background: #fff;
  }

  /* 공통 */
  body {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    background: #f9f9f9;
  }
  .container {
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    border-radius: 10px;
  }

  /* 객실 정보 */
  .info { text-align: left; margin-bottom: 40px; }
  .info h3 {
    font-size: 24px;
    margin-bottom: 15px;
    border-bottom: 2px solid #ddd;
    padding-bottom: 5px;
  }
  .info ul { list-style: disc; padding-left: 20px; line-height: 1.6; }
  .info ul li { margin-bottom: 8px; font-size: 16px; }

  /* 가격 안내 */
  .price-table { width: 100%; border-collapse: collapse; text-align: center; margin-bottom: 30px; }
  .price-table th, .price-table td {
    border: 1px solid #ddd;
    padding: 12px 0;
    font-size: 16px;
  }
  .price-table th { background: #f0f0f0; font-weight: 700; }
  .price-table tbody tr:nth-child(even) { background: #fafafa; }

  /* 예약 섹션 */
  .booking {
    max-width: 900px;
    margin: 30px auto 80px;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    text-align: center;
  }
  .booking h2 {
    font-size: 22px;
    margin-bottom: 20px;
  }
  .reservation {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 20px;
  }
  .reservation label { font-weight: 600; }
  .reservation input {
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 150px;
    cursor: pointer;
  }
  .price-amount {
    margin: 20px 0;
    font-size: 18px;
    font-weight: 600;
    color: #0078ff;
  }
  .confirm-button {
    padding: 12px 25px;
    background: #0078ff;
    color: #fff;
    font-size: 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
  }
  .confirm-button:hover { background: #0056cc; }
</style>
</head>
<body>
<%@include file="/booking/header.jsp" %>

<!-- 배너 -->
<div class="banner">
  <div class="slides">
    <img src="res/img/city01.jpg" alt="배너1">
    <img src="res/img/city02.jpg" alt="배너2">
    <img src="res/img/city03.jpg" alt="배너3">
    <img src="res/img/city04.jpg" alt="배너4">
    <img src="res/img/city05.jpg" alt="배너5">
  </div>
  <button class="prev">&#10094;</button>
  <button class="next">&#10095;</button>
  <div class="indicators">
    <div class="active"></div><div></div><div></div><div></div><div></div>
  </div>
</div>

<!-- JS 슬라이드 -->
<script>
  const slides = document.querySelector('.slides');
  const indicators = document.querySelectorAll('.indicators div');
  const prevBtn = document.querySelector('.prev');
  const nextBtn = document.querySelector('.next');
  let index = 0, total = 5, width = 1920, timer;

  function showSlide(i) {
    index = i;
    slides.style.transform = `translateX(-${width * index}px)`;
    indicators.forEach((dot, idx) => {
      dot.classList.toggle('active', idx === index);
    });
  }
  function nextSlide() { index = (index + 1) % total; showSlide(index); }
  function prevSlide() { index = (index - 1 + total) % total; showSlide(index); }
  function startAutoSlide() { timer = setInterval(nextSlide, 4000); }
  function stopAutoSlide() { clearInterval(timer); }
  nextBtn.addEventListener('click', () => { nextSlide(); stopAutoSlide(); startAutoSlide(); });
  prevBtn.addEventListener('click', () => { prevSlide(); stopAutoSlide(); startAutoSlide(); });
  indicators.forEach((dot, idx) => {
    dot.addEventListener('click', () => { showSlide(idx); stopAutoSlide(); startAutoSlide(); });
  });
  showSlide(0); startAutoSlide();
</script>

<!-- 객실 정보 + 가격 -->
<div class="container">
  <div class="info">
    <h3>객실정보</h3>
    <ul>
      <li>한실 구조, 침대룸, 화장실</li>
      <li>기준 2인 / 최대 2인</li>
      <li>건물: 기준층 / 복층구조</li>
      <li>시설: TV, 에어컨, 냉장고, 전자렌지, 세면도구 등</li>
      <li>입실: 오후 3시 / 퇴실: 오전 11시</li>
    </ul>
  </div>
  <h3>가격안내</h3>
  <table class="price-table">
    <thead>
      <tr><th>구분</th><th>비수기</th><th>성수기</th></tr>
    </thead>
    <tbody>
      <tr><td>주중</td><td>200,000</td><td>300,000</td></tr>
      <tr><td>금요일</td><td>220,000</td><td>320,000</td></tr>
      <tr><td>주말</td><td>240,000</td><td>340,000</td></tr>
    </tbody>
  </table>
</div>

<!-- 예약 날짜 선택 -->
<div class="booking">
  <h2>숙박일정 <br><small>(날짜 선택)</small></h2>
  <div class="reservation">
    <label for="checkin">체크인:</label>
    <input type="text" id="checkin" placeholder="날짜 선택">
    <label for="checkout">체크아웃:</label>
    <input type="text" id="checkout" placeholder="날짜 선택">
  </div>
  <div class="price-amount" id="price-result">총 금액(₩) : 0 원</div>
  <button class="confirm-button">예약 확정(결제)</button>
</div>

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const PRICE_PER_NIGHT = 200000; // 1박당 요금
    const priceEl = document.getElementById('price-result');
    const checkinInput = document.getElementById('checkin');
    const checkoutInput = document.getElementById('checkout');

    // "YYYY-MM-DD"를 안전하게 Date로 변환 (타임존 문제 회피)
    function parseYMD(str) {
      const parts = str.split('-').map(Number);
      if (parts.length !== 3) return null;
      const [y, m, d] = parts;
      if (!y || !m || !d) return null;
      return new Date(y, m - 1, d); // 월은 0부터
    }

    function calculatePrice() {
      const inStr = checkinInput.value;
      const outStr = checkoutInput.value;

      if (!inStr || !outStr) {
        priceEl.textContent = 'Total 금액(₩) : 0 원';
        return;
      }

      const start = parseYMD(inStr);
      const end = parseYMD(outStr);
      if (!start || !end) {
        priceEl.textContent = 'Total 금액(₩) : 0 원';
        return;
      }

      // 날짜만 비교
      start.setHours(0, 0, 0, 0);
      end.setHours(0, 0, 0, 0);

      const MS_PER_DAY = 1000 * 60 * 60 * 24;
      // DST 등으로 23/25시간 차이도 반올림으로 1일 처리
      const nights = Math.round((end - start) / MS_PER_DAY);

      if (nights > 0) {
        const total = nights * PRICE_PER_NIGHT;
        priceEl.textContent = `총 금액(₩) : ${total.toLocaleString()} 원 (총 ${nights}박)`;
      } else {
        priceEl.textContent = '총 금액(₩) : 0 원';
      }
    }

    // flatpickr 초기화 (달력 선택 시 즉시 계산)
    const fpIn = flatpickr(checkinInput, {
      dateFormat: 'Y-m-d',
      minDate: 'today',
      onChange: function (selectedDates, dateStr) {
        fpOut.set('minDate', dateStr || 'today');
        calculatePrice();
      }
    });

    const fpOut = flatpickr(checkoutInput, {
      dateFormat: 'Y-m-d',
      minDate: 'today',
      onChange: function () {
        calculatePrice();
      }
    });

    // 수동 입력 대비
    checkinInput.addEventListener('change', calculatePrice);
    checkoutInput.addEventListener('change', calculatePrice);
  });
</script>


<%@include file="/booking/footer.jsp" %>
</body>
</html>
