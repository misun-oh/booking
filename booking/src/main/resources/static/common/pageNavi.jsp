<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/common/header.jsp" %>
<%
	boolean isPrev = false;
	boolean isNext = true;
	int startNo = 1;
	int endNo = 10;
	int pageNo = 5;
	
	
	for(int i=1;i<=10;i++){
%>
		<%=i %>
<%
	}
%>

<nav aria-label="...">
<ul class="pagination">
	
<%
	// 만약 isPrev가 true이면 코드블럭안의 소스코드를 실행
	if (isPrev) {
%>
	  <!-- 이전블럭 이동 -->
	  <li class="page-item disabled">
	    <a class="page-link">Previous</a>
	  </li>
<%
	}
%>
  
<%
	for(int i=startNo; i<=endNo; i++){
		String active = i==pageNo?"active":"";
%>
  <li class="page-item <%=active%>"><a class="page-link" href="#"><%=i %></a></li>
<%
	}
%>  
  
<%
	if(isNext){
%>
  <!-- 다음블럭으로 이동 -->
  <li class="page-item">
    <a class="page-link" href="#">Next</a>
  </li>
<%
	}
%>
</ul>
</nav>

<hr>

<nav aria-label="...">
<ul class="pagination">
  <li class="page-item disabled">
    <a class="page-link">Previous</a>
  </li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item active" aria-current="page">
    <a class="page-link" href="#">2</a>
  </li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item">
    <a class="page-link" href="#">Next</a>
  </li>
</ul>
</nav> 



</body>
</html>