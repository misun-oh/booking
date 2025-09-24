<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 목록</title>
<style>
.grid-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  padding: 20px;
}
.item {
  border: 1px solid #ccc;
  padding: 15px;
  text-align: center;
  border-radius: 8px;
  transition: box-shadow 0.3s;
}
.item:hover {
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
</style>
</head>
<body>

<%@ include file="/edu/header.jsp" %>

<c:if test="${empty list}">
  <p>신청자가 없습니다</p>
</c:if>

<div class="grid-container">
  <c:forEach var="enrollment" items="${list}">
    <div class="item">
      <h3>Enrollment ID: ${enrollment.enrollment_id}</h3>
      <p>User ID: ${enrollment.user_id}</p>
      <p>Instructor ID: ${enrollment.instructor_id}</p>
      <p>Status: ${enrollment.status}</p>
      <p>Enrolled At: ${enrollment.enrolled_at}</p>
      <p>Level: ${enrollment.level}</p>
      <p>Price: ${enrollment.price} 원</p>
    </div>
  </c:forEach>
</div>

<%@ include file="/edu/footer.jsp" %>

</body>
</html>
