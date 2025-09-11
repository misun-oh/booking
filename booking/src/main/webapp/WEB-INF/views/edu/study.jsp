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
    margin: 30px;
  }
  .banner {
  	position: relative; /* 텍스트를 배너 위에 올리려면 relative 필요 */
    padding-bottom: 20px;   /* 하단 패딩 적용 */
  }
  
  .banner img {
    width: 100%;          /* 화면 너비에 맞게 */
    max-width: 1920px;    /* 최대 크기 제한 */
    height: auto;         /* 세로 비율 자동 조절 */
    max-height: 250px;    /* 세로 최대치 설정 */
    display: block;       /* 가운데 정렬 효과 */
    margin: 0 auto;       /* 좌우 여백 자동 */
    object-fit: cover;    /* 잘리는 경우에도 꽉 차게 */
  }
  
    .banner h1 {
    position: absolute;      /* 배너 안에서 절대 위치 */
    top: 50%;                /* 세로 중앙 */
    left: 50%;               /* 가로 중앙 */
    transform: translate(-50%, -50%); /* 정확히 가운데 정렬 */
    color: white;            /* 흰색 글씨 */
    font-size: 78px;         /* H1 크기 */
    text-shadow: 2px 2px 5px rgba(0,0,0,0.5); /* 가독성 위한 그림자 */
    margin: 0;
  }
</style>


</head>
<body>
<%@ include file="/edu/header.jsp" %>

	<!-- 상단 배너 -->
	<div class="banner">
	  <img src="res/imgs/ai.jpg" alt="상단 배너 이미지">
	  <h1>AI/Coding</h1>
	</div>


<%@ include file="/edu/footer.jsp" %>
</body>
</html>