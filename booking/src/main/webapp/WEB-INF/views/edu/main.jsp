<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내맘대로 EDU</title>
<style>

/* 헤더 맨 위에 그리기*/
header {
  position: relative;  /* 필요시 fixed도 가능 */
  z-index: 1000;       /* 배너보다 높은 값 */
}


/* 배너 화면 영역 */
.banner {
	position: relative;
	width: 100%; /* 화면 전체 폭 */
	max-width: 1920px; /* 필요시 최대 폭 */
	overflow: hidden;
	margin: 0 auto;
	border: 1px solid #ccc; /* 확인용 */
}

/* 슬라이드 컨테이너 */
.slides {
	display: flex;
	transition: transform 1s ease;
}

/* 슬라이드 이미지 */
.slides img {
	width: 100%; /* 부모 폭에 맞춤 */
	object-fit: cover;
	flex-shrink: 0;
}

/* 좌우 버튼 */
.prev, .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	border: none;
	font-size: 40px;
	cursor: pointer;
	padding: 10px 20px;
	z-index: 10;
}

.prev {
	left: 10px;
}

.next {
	right: 10px;
}

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
	background: rgba(255, 255, 255, 0.5);
	border-radius: 50%;
	cursor: pointer;
}

.indicators .active {
	background: #fff;
}
</style>
</head>
<body>

<%@ include file="/edu/header.jsp"%>

	<div class="banner">
		<div class="slides">
			<img src="res/imgs/banner1.jpg" alt="배너1"> <img
				src="res/imgs/banner2.jpg" alt="배너2"> <img
				src="res/imgs/banner3.jpg" alt="배너3"> <img
				src="res/imgs/banner4.jpg" alt="배너4"> <img
				src="res/imgs/banner5.jpg" alt="배너5">
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
  const banner = document.querySelector('.banner');
  const slides = document.querySelector('.slides');
  const indicators = document.querySelectorAll('.indicators div');
  const prevBtn = document.querySelector('.prev');
  const nextBtn = document.querySelector('.next');
  const total = slides.children.length;
  let index = 0;
  let width = slides.children[0].clientWidth; // 첫 이미지 실제 폭 기준
  let timer;

  function updateWidth() {
    width = slides.children[0].clientWidth; // 이미지 폭 갱신
  }

  function showSlide(i) {
    index = i;
    slides.style.transform = `translateX(-${width * index}px)`;
    indicators.forEach((dot, idx) => dot.classList.toggle('active', idx === index));
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

  // 버튼 클릭 이벤트
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

  // 인디케이터 클릭
  indicators.forEach((dot, idx) => {
    dot.addEventListener('click', () => {
      showSlide(idx);
      stopAutoSlide();
      startAutoSlide();
    });
  });

  // 초기 실행
  updateWidth();
  showSlide(0);
  startAutoSlide();


</script>

	<%@ include file="/edu/footer.jsp"%>
</body>
</html>
