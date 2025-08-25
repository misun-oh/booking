
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.red{color:red}
</style>
roles : ${member.hasRole("ADMIN") }


<c:if test="${member != null }">
	c:if : ${member }
</c:if>

<script>
	window.addEventListener('load', function(){
		let logoutBtn = document.querySelector('#logoutFormBtn');
		if(logoutBtn != null){
			logoutBtn.addEventListener('click', ()=>{
				//location.href="/member/logout";
				// 스크립트를 이용하여 폼을 서브밋하는 방법
				logoutForm.action="/member/logout";
				logoutForm.method="get";
				logoutForm.submit();
			})
		}
	});
</script>


<%@include file="/common/header.jsp" %>

<h1>로그인</h1>
<%
	if(session.getAttribute("user_id") == null) {
%>

${param.msg} : 쿼리스트링으로 넘어온 데이터를 출력
<br>${msg } : 내장객체의 영역에 저장된 데이터를 출력

<div class="red">${msg}</div>
<!-- method 주의 -->
<form name="loginForm" action="/login/loginAction_dto" method="post">
	id : <input type="text" name="user_id" value="${user_id }">
	pw : <input type="text" name="password"> 
	<button>로그인</button>

</form>
<%
	} else {
%>
로그인 id : ${sessionScope.user_id } 님 환영합니다.
	
	<button id="logoutFormBtn">로그아웃</button>
<%
	} 
%>

<%@include file="/common/footer.jsp" %>
