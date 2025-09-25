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
<%@ include file="/edu/header.jsp" %>

  	<!-- 예약 확인 배너 -->
	<div class="banner">
	  <img src="res/imgs/not2.jpg" alt="공지 배너 이미지">
	</div>





<br>

<h2 style="text-align:center;">공지 사항</h2>

<table class="reservation-table">
  <thead>
    <tr>
      <th>공지번호</th>
      <th>공제 제목</th>
      <th>내용</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
      
    </tr>
  </thead>
  <tbody>
    <c:forEach var="re" items="${list}">
      <tr>
        <td>${re.notice_id}</td>
        <td>${re.title}</td>
        <td>${re.content}</td>
        <td>${re.writer}</td>
        <td>${re.created_at}</td>
        <td>${re.view_count}</td>
        
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





  
<%@ include file="/edu/footer.jsp" %>
</body>
</html>
