
<%@page import="com.booking.boot.Dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	tr.link {
		cursor : pointer;
	}
</style>
<%@include file="/common/header.jsp" %>
<script>
	window.addEventListener('load', function(){
		let searchField = document.querySelector('[name=searchField]');
		searchField.innerHTML = `
	          <option ${param.searchField eq "user_id" ? "selected" : ""} value="user_id">아이디</option>
	          <option ${param.searchField eq "user_id/username" ? "selected" : ""} value="user_id/username">아이디 + 이름</option>
	          <option ${param.searchField eq "username" ? "selected" : ""} value="username">내용</option>`;
	   
	    
	    // account_locked 클릭 이벤트 추가
		account_locked_btn_list = document.querySelectorAll("[name=account_locked]");
		account_locked_btn_list.forEach(function(btn, index){
			
			btn.addEventListener('click', function(){
				// 버튼 비활성화 처리 - 사용자가 연속해서 버튼을 클릭할수 없도록 처리
				btn.disabled = true;

				// 서버 처리 
				// checked속성이 있으면 true, 없으면 false를 반환
				// 사용자계정 잠금/잠금해제
				// 서버 호출 -> 아이디, 체크상태를 서버에 전달 -> account_lock 업데이트 처리
				console.log('btn.checked', btn.checked);
				console.log('btn.data-user-id', btn.dataset.userId);
				
				let user_id = btn.dataset.userId;
				let account_locked = btn.checked ? 'Y' : 'N';
				
				// 자바스크립트에서 백팃을 이용하면 변수처리를 쉽게 할 수 있다
				// el표현식에서 처리되지 않도록 하는 처리가 필요!!!!!!!!!!!!
				let url = `/member/accountlock/\${user_id}/\${account_locked}`;
				//let url = '/member/accountlock/' + user_id + '/' + account_locked;
				console.log('url', url);
				// 서버 전송(요청)
				//location.href= url; // 화면 갱신 -> 비동기방식으로 처리
				fetch(url) // 요청URL
				  .then(response => response.json())	// 요청결과를 object로 변환
				  .then(result => {
					  	// 서버의 통신결과
				    	console.log(result.res);
					  	
					  	if(!result.res){
					  		// 요청 실패
					  		// 메세지 처리
					  		//showModal("계정 잠금/해제", "계정 잠금/해제 처리중 예외사항이 발생 하였습니다.");
					  		showToast(result.title, result.msg);
					  		// 버튼처리
					  		btn.checked = btn.checked ? false : true; 
					  	}
					  	// 버튼 잠금 해제
						btn.disabled = false;
				  })
				  .catch(err=>{
					  	// 네트워크 장애, 매핑된 url이 없는경우
						console.log('err', err);  
				  });
				
			})
		});
	});
</script>


<div id="wrap">

	<h2>사용자 목록 조회</h2>
	<!-- search.jsp -->
	<%@include file="/common/search.jsp" %>

	
	<!-- 버튼 시작 -->
	<c:if test='${member.hasRole("WRITE") }'>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-info" onclick="location.href='/member/register'">사용자 등록</button>
		</div>
	</c:if>
	<!-- 버튼 끝 -->
	
	<!-- 테이블 시작 -->
	<table  class="table table-hover">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>등록일</th>
			<th>계정잠금/잠금해제</th>
		</tr>
		<%
		if(request.getAttribute("list") != null) {
			List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
			for(MemberDto member : list){
		%>
				
				<tr class="link" >
					<td><a href="/member/view/<%=member.getUser_id() %>"><%=member.getUser_id() %></a></td>
					<td onclick="location.href='/member/view/<%=member.getUser_id() %>'"><%=member.getUsername() %></td>
					<td><%=member.getCreated_at() %></td>
					<td>
						<!-- 스위치 -->
						<div class="form-check form-switch">
							
							<!-- getAccount_locked이 Y이면 체크(chekced속성추가) 아니면 체크안함 -->
							<input class="form-check-input" type="checkbox" role="switch" 
									<%="Y".equals(member.getAccount_locked())? "checked" : "" %>
									name="account_locked"
									data-user-id="<%=member.getUser_id()%>">
						</div>
					</td>
				</tr>
		<%
			}
		} else {
			out.print("<tr><td colspan='3'>사용자가 존재하지 않습니다.</td></tr>");
		}
		%>
	</table>
	
	<!-- 테이블 시작 -->
	
	<!-- 페이지 블럭 -->
	<%@include file="/common/pageing.jsp" %>
	
	
</div>



<%@include file="/common/footer.jsp" %>
