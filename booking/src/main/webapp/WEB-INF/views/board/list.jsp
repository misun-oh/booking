<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	window.addEventListener('load', function(){
		let searchField = document.querySelector('[name=searchField]');
		
	    let optionList = [{value:"title", text:"제목"}
	    					, {value:"title/content", text:"제목 + 내용"}
	    					, {value:"id", text:"아이디"}
	    					, {value:"content", text:"내용"}];
	    
	    // selectbox, optionList, selectedItem
	    // 셀렉트박스, 옵션목록, 선택할아이템
	    settingSelect(searchField, optionList, '${param.searchField}');
	    
	});
</script>
<body>
<!-- header 영역 -->
<%@include file="/common/header.jsp" %>
<!-- main 영역 -->
<div id="wrap">
<h2>게시판</h2>

<!-- pageDto가 있으면 검색폼을 추가 -->
<c:if test="${not empty pageDto }">
	<%@include file="/common/search.jsp" %>
</c:if>	
 
<!-- 리스트 출력 -->
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일시</th>
    </tr>
  </thead>
  <tbody>
  	<!-- 향상된 for문 -->
    <c:forEach items="${list}" var="board">
	    <tr>
	      <th scope="row">${board.num }</th>
	      <td>${board.title }</td>
	      <td>${board.id }</td>
	      <td>${board.postdate }</td>
	    </tr>
    </c:forEach>
    <!-- 데이터가 없을때 게시글이 존재하지 않습니다 -->
    <c:if test="${empty list}">
    	<tr><td colspan="4" class="text-center">게시글이 존재하지 않습니다.</td></tr>
    </c:if>
  </tbody>
</table>

<!-- pageDto를 이용해서 페이지 블럭을 화면에 출력 -->
<c:if test="${not empty pageDto }">
	<%@ include file="/common/pageing.jsp" %>
</c:if>

</div>
<!-- footer 영역 -->
<%@include file="/common/footer.jsp" %>


</body>
</html>