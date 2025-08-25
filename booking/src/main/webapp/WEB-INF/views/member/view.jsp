<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#profileImg {
		width : 130px;
		height : 130px;
		border-radius: 50%;
	}
	.center{
		text-align: center
	}
</style>
</head>
<body>
<!-- header 영역 -->
<%@include file="/common/header.jsp" %>
<!-- main 영역 -->
<div id="wrap">
	<h2>상세보기</h2>
	<div class="center">
		<img alt="프로필" src="/upload/download/${member.profile_image_url }/0" id="profileImg" 
					onerror="this.src='/res/img/no_img.png'">
					
	</div>
	
	<div class="form-floating mb-3">
		<input type="text" readonly class="form-control-plaintext" id="id" value="${member.user_id }">
		<label for="id">아이디</label>
	</div>
	<div class="form-floating mb-3">
		<input type="text" readonly class="form-control-plaintext" id="name" value="${member.username}">
		<label for="name">이름</label>
	</div>
	<div class="form-floating mb-3">
		<input type="text" readonly class="form-control-plaintext" id="phone_number" value="${member.phone_number}">
		<label for="phone_number">전화번호</label>
	</div>
	<div class="form-floating mb-3">
		<input type="text" readonly class="form-control-plaintext" id="email" value="${member.email}">
		<label for="email">이메일</label>
	</div>
	<div class="form-floating mb-3">
		<input type="text" readonly class="form-control-plaintext" id="regidate" value="${member.created_at}">
		<label for="regidate">가입일</label>
	</div>

	<!-- 어드민 권한이 있는 경우, 권한을 부여할수 있도록 처리 -->
	<c:if test='${sessionScope.member.hasRole("ADMIN")}'>
	
		<hr>
		<div class="input-group mb-3">
			권한
		</div>
		<div class="input-group mb-3">
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="roles" value="1" disabled  ${member.hasRole("ADMIN")?"checked":"" }> 
			  <label class="form-check-label" for="inlineCheckbox1">시스템관리자</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="roles" value="2" disabled ${member.hasRole("USER")?"checked":"" }> 
			  <label class="form-check-label" for="inlineCheckbox2">사용자</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="roles" value="3" disabled  ${member.hasRole("PARTNER")?"checked":"" }>
			  <label class="form-check-label" for="inlineCheckbox3">파트너</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="roles" value="4" disabled  ${member.hasRole("WRITE")?"checked":"" }>
			  <label class="form-check-label" for="inlineCheckbox4">등록권한</label>
			</div>
		</div>
	
	</c:if> 
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-info" onclick="location.href='/member/list'">리스트</button>
		<button class="btn btn-info" onclick="location.href='/member/edit/${member.user_id }'">수정</button>
		<button class="btn btn-info" onclick="location.href='/member/delete/${member.user_id }'">삭제</button>
	</div>
</div>
<!-- footer 영역 -->
<%@include file="/common/footer.jsp" %>
</body>
</html>