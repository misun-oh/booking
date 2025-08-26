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
  <div class="room">
    <img src="/res/img/room.png" alt="객실 NO.1">
    <div class="room-content">
      <div class="room-text">
        <h3><strong>객실명 NO.1</strong></h3>
        <p>
          소중한 사람과의 시간을 더욱 편안하고 따스하게 느끼게끔<br>
          구성된 객실에는 휴식과 힐링 시간이 자연스레 녹아듭니다.<br>
          머무시는 그 자체에 집중할 수 있도록 수영장과 뷰티풀한 세팅이 준비되어 있습니다.
        </p>
      </div>
      <button class="btn" onclick="location.href='/view'">예약 하기</button>
    </div>
  </div>

  <div class="room">
    <img src="/res/img/room.png" alt="객실 NO.2">
    <div class="room-content">
      <div class="room-text">
        <h3><strong>객실명 NO.2</strong></h3>
        <p>
          소중한 사람과의 시간을 더욱 편안하고 따스하게 느끼게끔<br>
          구성된 객실에는 휴식과 힐링 시간이 자연스레 녹아듭니다.<br>
          머무시는 그 자체에 집중할 수 있도록 수영장과 뷰티풀한 세팅이 준비되어 있습니다.
        </p>
      </div>
      <button class="btn" onclick="location.href='/view'">예약 하기</button>
    </div>
  </div>

  <div class="room">
    <img src="/res/img/room.png" alt="객실 NO.3">
    <div class="room-content">
      <div class="room-text">
        <h3><strong>객실명 NO.3</strong></h3>
        <p>
          소중한 사람과의 시간을 더욱 편안하고 따스하게 느끼게끔<br>
          구성된 객실에는 휴식과 힐링 시간이 자연스레 녹아듭니다.<br>
          머무시는 그 자체에 집중할 수 있도록 수영장과 뷰티풀한 세팅이 준비되어 있습니다.
        </p>
      </div>
      <button class="btn" onclick="location.href='/view'">예약 하기</button>
    </div>
  </div>

 
  <%@include file="/common/pageing.jsp" %>
</div> 

<%@include file="/booking/footer.jsp" %>
</body>
</html>