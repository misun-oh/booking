<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 30px;
  }
  .form-container {
    max-width: 700px;
    margin: 0 auto;
    position: relative;
    padding-bottom: 25px;
  }
  .form-group {
    margin-bottom: 15px;
  }
  
  .banner {
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
  
  label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  input[type="text"], input[type="email"], input[type="password"], textarea {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  textarea {
    height: 200px;
    resize: none;
  }
  .button-group {
    text-align: right; /* 버튼을 우측 정렬 */
    margin-top: 20px;
  }
  button {
    padding: 10px 20px;
    background-color: #4CAF50;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    margin-left: 10px;
  }
  button:hover {
    opacity: 0.9;
  }
  .btn-edit {
    background-color: #007BFF;
  }
  .btn-edit:hover {
    background-color: #0069d9;
  }

  .flex-row {
    display: flex;
    gap: 10px; /* 입력창 사이 여백 */
  }
  .flex-row input {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  
  .btn-back {
    background-color: #6c757d;
  }
  .btn-back:hover {
    background-color: #5a6268;
  }
  
</style>
</head>
<body>
<%@ include file="/edu/header.jsp" %>

  	<!-- 공지사항 상단 배너 -->
	<div class="banner">
	  <img src="res/imgs/not2.jpg" alt="공지 배너 이미지">
	</div>

  <div class="form-container">
  

    <center><h2 style="font-size: 28px; font-weight: bold; color: #022703; margin-bottom: 15px;">공지 사항</h2></center>
    <center>
    <p style="font-size: 10px; font-weight: bold; color: #5c5c5c; margin-bottom: 15px;">
    운영에 관한 공지 및 셀러&수강생 분들을 위한 정보 확인. ⓒ 2025 내맘대로 E.D.U</p>
    </center>
    <form action="/notice" method="post">
      
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
      </div>

      <div class="form-group">
        <label for="content">내용</label>
        <textarea id="content" name="content" required></textarea>
      </div>



		<div class="button-group">
		  <button type="submit" class="btn-edit">저장</button>
		  <button type="button" onclick="location.href='list.jsp'" class="btn-back">목록</button>
		</div>
    </form>
  </div>
  
<%@ include file="/edu/footer.jsp" %>
</body>
</html>
