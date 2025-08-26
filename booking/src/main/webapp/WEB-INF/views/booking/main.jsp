<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내맘대로 호텔</title>
<style>
  /* 배너 화면 영역 */
  .banner {
    position: relative;
    width: 1920px;
    height: 800px;
    overflow: hidden;
    margin: 0 auto;
    border: 1px solid #ccc; /* 확인용 */
  }

  /* 슬라이드 컨테이너 */
  .slides {
    display: flex;
    width: 9600px; /* 5장 이미지 폭 합 */
    transition: transform 1s ease;
  }

  /* 슬라이드 이미지 */
  .slides img {
    width: 1920px; /* 화면 폭과 동일 */
    height: 800px;
    object-fit: cover;
    flex-shrink: 0;
  }

  /* 좌우 버튼 */
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

  /* 인디케이터 */
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
</style>
</head>
<body>

<%@ include file="/booking/header.jsp" %>

<div class="banner">
  <div class="slides">
    <img src="res/img/banner3.jpg" alt="배너1">
    <img src="res/img/banner2.jpg" alt="배너2">
    <img src="res/img/banner3.jpg" alt="배너3">
    <img src="res/img/banner4.jpg" alt="배너4">
    <img src="res/img/banner5.jpg" alt="배너5">
  </div>

  <!-- 좌우 버튼 -->
  <button class="prev">&#10094;</button>
  <button class="next">&#10095;</button>

  <!-- 인디케이터 -->
  <div class="indicators">
    <div class="active"></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>
</div>

<script>
  const slides = document.querySelector('.slides');
  const indicators = document.querySelectorAll('.indicators div');
  const prevBtn = document.querySelector('.prev');
  const nextBtn = document.querySelector('.next');
  let index = 0;
  const total = 5;
  const width = 1920; // 화면 노출 폭 기준
  let timer;

  function showSlide(i) {
    index = i;
    slides.style.transform = `translateX(-${width * index}px)`;
    indicators.forEach((dot, idx) => {
      dot.classList.toggle('active', idx === index);
    });
  }

  function nextSlide() {
    index = (index + 1) % total;
    showSlide(index);
  }

  function prevSlide() {
    index = (index - 1 + total) % total;
    showSlide(index);
  }

  function startAutoSlide() {
    timer = setInterval(nextSlide, 4000);
  }

  function stopAutoSlide() {
    clearInterval(timer);
  }

  nextBtn.addEventListener('click', () => {
    nextSlide();
    stopAutoSlide();
    startAutoSlide();
  });

  prevBtn.addEventListener('click', () => {
    prevSlide();
    stopAutoSlide();
    startAutoSlide();
  });

  indicators.forEach((dot, idx) => {
    dot.addEventListener('click', () => {
      showSlide(idx);
      stopAutoSlide();
      startAutoSlide();
    });
  });

  // 초기 실행
  showSlide(0);
  startAutoSlide();

  // 화면 크기 변경 시 현재 슬라이드 위치 보정
  window.addEventListener('resize', () => showSlide(index));
</script>

<%@ include file="/booking/footer.jsp" %>
</body>
</html>
