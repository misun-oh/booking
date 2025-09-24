<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background: #fff;
  }
  .play-container {
    display: flex;
    max-width: 1700px;
    margin: 20px auto;
    gap: 20px;
  }
  .player {
    flex: none;
    width: 1400px;
    height: 700px;
    background: #000;
  }
  .side-list {
    flex: none;
    width: 300px;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
  .side-list img {
    width: 100%;
    border-radius: 4px;
    cursor: pointer;
  }
</style>
</head>
<body>
<%@ include file="/edu/header.jsp" %>

<div class="play-container">
  <!-- 메인 플레이어 -->
  <div class="player">
    <iframe width="100%" height="700"
            src="https://www.youtube.com/embed/2bmRT2JSc14"
            frameborder="0" allowfullscreen></iframe>
  </div>

  <!-- 우측 리스트 -->
  <div class="side-list">
    <a href="videoPlay.jsp?videoId=2bmRT2JSc14">
      <img src="https://img.youtube.com/vi/2bmRT2JSc14/mqdefault.jpg">
    </a>
    <a href="videoPlay.jsp?videoId=kXYiU_JCYtU">
      <img src="https://img.youtube.com/vi/kXYiU_JCYtU/mqdefault.jpg">
    </a>
    <a href="videoPlay.jsp?videoId=dQw4w9WgXcQ">
      <img src="https://img.youtube.com/vi/dQw4w9WgXcQ/mqdefault.jpg">
    </a>
  </div>
</div>

<%@ include file="/edu/footer.jsp" %>
</body>
</html>