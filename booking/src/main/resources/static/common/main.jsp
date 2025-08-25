<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*


fetch(url) // 요청URL
.then(response => response.json())	// 요청결과를 object로 변환
.then(result => {
	  	// 서버의 통신결과
  	console.log(result);
})
.catch(err=>{
	  	// 네트워크 장애, 매핑된 url이 없는경우
		console.log('err', err);  
});


*/
</script>
</head>
<body>
<!-- header 영역 -->
<%@include file="/common/header.jsp" %>
<!-- main 영역 -->
<div id="wrap">


	<!-- 페이지네이션이 렌더링될 위치 -->
	<nav aria-label="Page navigation">
	  <ul class="pagination justify-content-center" id="pagination">
	    <!-- fetch로 동적으로 채움 -->
	  </ul>
	</nav>

</div>
<!-- footer 영역 -->
<%@include file="/common/footer.jsp" %>
</body>
</html>