<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>예약 리스트</title>
		<style>
		    table { width:100%; border-collapse: collapse; }
		    th, td { border:1px solid #ccc; padding:8px; text-align:center; }
		    th { background:#d9f2d9; }
		    .pagination { margin-top:20px; text-align:center; }
		    .pagination a {
		        margin:0 5px; padding:5px 10px; border:1px solid #ccc; 
		        text-decoration:none; color:black;
		    }
		    .pagination a.active { background:#4CAF50; color:white; }
		    
		    .reservation-table {
			  width: 90%;              /* 화면 꽉 채우지 않고 양쪽 여백 */
			  margin: 30px auto;       /* 위아래 20px, 좌우 자동 → 가운데 정렬 */
			  border-collapse: collapse;
			  text-align: center;
			}
			
			.reservation-table th,
			.reservation-table td {
			  border: 1px solid #ccc;
			  padding: 12px 16px;      /* 셀 안쪽 여백 */
			}
			
			.reservation-table th {
			  background-color: #f4f4f4;
			}
			
			
			.pagination {
			    display: flex;
			    justify-content: center; /* 중앙 정렬 */
			    gap: 8px; /* 각 페이지 번호 간격 */
			    margin: 20px 0;
			}
			
			.pagination a {
			    padding: 8px 12px;
			    text-decoration: none;
			    border: 1px solid #ccc;
			    border-radius: 4px;
			}
			
			.pagination a.active {
			    background-color: #007bff;
			    color: white;
			    border-color: #007bff;
			}
						
					    
		</style>

</head>

<body>
<%@ include file="/booking/header.jsp" %>

  	<!-- 예약 확인 배너 -->
	<div class="banner">
	  <img src="res/img/reser.jpg" alt="예약 확인 배너">
	</div>





<br>

<h2 style="text-align:center;">예약 리스트</h2>

<table class="reservation-table">
  <thead>
    <tr>
      <th>예약번호</th>
      <th>이름</th>
      <th>전화</th>
      <th>체크인</th>
      <th>체크아웃</th>
      <th>숙박일수</th>
      <th>총금액</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="reservation" items="${list}">
      <tr>
        <td>${reservation.reid}</td>
        <td>${reservation.name}</td>
        <td>${reservation.phone}</td>
        <td>${reservation.checkin}</td>
        <td>${reservation.checkout}</td>
        <td>${reservation.nights}</td>
        <td><fmt:formatNumber value="${reservation.price}" type="number" /></td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<!-- 페이지네이션 -->
<div class="pagination">
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>
</div>





  
<%@ include file="/booking/footer.jsp" %>
</body>
</html>
