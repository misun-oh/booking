<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 공통 - PageDto객체가 있으면 페이지 블럭을 출력 -->

	<!-- 태그라이브러리를 이용하여 출력시 el문법을 이용하여 null처리 없이 편리하게 이용할 수 있다! -->
	<c:if test="${pageDto != null }">
		<nav aria-label="...">
		<ul class="pagination justify-content-center">
		<!-- 앞으로 가기 버튼 -->
		<!-- $ {객체명.필드명} ->  get메서드의 실행 결과를 반환 -->
		<!-- ()를 붙여서 메서드를 실행 -->
		  <c:if test="${pageDto.isPrev()}">
			  <li class="page-item">
			    <a class="page-link" href="javascript:go(${pageDto.startNo-1})">이전</a>
			  </li>
		  </c:if>
		<!-- var=변수명, begin=시작번호, end=끝번호 -->
		<c:forEach var="pageNo" begin="${pageDto.startNo }" end="${pageDto.endNo}">
	      <li class="page-item ${pageDto.pageNo == pageNo ? "active" : "" }">
	      	<a class="page-link" href="javascript:go(${pageNo })">${pageNo }</a>
	      </li>
		</c:forEach>
		  
		<!-- 뒤로가기 버튼 -->
		<c:if test="${pageDto.isNext() }">
		  <li class="page-item">
		    <a class="page-link" href="javascript:go(${pageDto.endNo+1 })">Next</a>
		  </li>
		</c:if>
		</ul>
		</nav>
		
	</c:if>
	<c:if test="${pageDto == null }">
		<h6>pageDto is null - pageDto 데이터가 없으면 블럭을 그릴수 없어요</h6>
	</c:if>
	
</body>
</html>