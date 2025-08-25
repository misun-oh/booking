<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	
	window.addEventListener('load', ()=>{
		
		let saveBtn = document.querySelector('#saveBtn');
		
		// 저장버튼을 클릭!
		saveBtn.addEventListener('click', (e)=>{
			// 폼 서브밋 이벤트 제거 - 전송 이벤트 제거 - 서버에 전송하지마 
			e.preventDefault();
			
			// 유효성검사
			// 1. 패턴등록
			// 2. 필드에 속성 data-field 추가
			// 3. <div class="invalid-feedback"></div> 를 요소 아래 추가
			console.log('저장버튼 클릭!!!!!');
			console.log('user_id', user_id.value.trim());
			
			// 유효성 검사(form의 name속성)
			let res = formCheck(registerForm);
			
			// 유효성 검사가 성공으로 끝난 경우에만 폼을 전송
			if(res){
				registerForm.submit();	
			}

		});
		
		
		// checkIdBtn을 클릭 하면 아이디 중복검사(/member/checkId)를 진행
		// 입력필드에 입력된 값을 서버에 전송
		checkIdBtn.addEventListener('click', function(){
			console.log('click');
			let user_id = document.querySelector('#user_id');
			
			// trim() : 공백제거
			if(!user_id.value.trim()){
				showToast('입력체크', '아이디를 입력해주세요.');
				
				user_id.classList.add('is-invalid'); // 빨강
		  		user_id.classList.remove('is-valid');// 초록
				
				return;
			}
			let url = '/member/checkId?user_id=' + user_id.value.trim();
			
			fetch(url) // 요청URL
			  .then(response => response.json())	// 요청결과를 object로 변환
			  .then(result => {
				  	// 서버의 통신결과
			    	console.log(result);
				  	if(!result.res) {
				  		// 중복된 아이디
				  		user_id.classList.add('is-invalid'); // 빨강
				  		user_id.classList.remove('is-valid');// 초록
				  		
				  		showToast('아이디 중복체크', result.msg)
				  	} else {
				  		user_id.classList.add('is-valid'); // 초록
				  		user_id.classList.remove('is-invalid');	// 빨강
				  	}
				  	
			  })
			  .catch(err=>{
				  	// 네트워크 장애, 매핑된 url이 없는경우
					console.log('err', err);  
			  });
		})
	})
</script>
</head>

<body>
<!-- header 영역 -->
<%@include file="/common/header.jsp" %>
<!-- main 영역 -->
<div id="wrap">
<h2>사용자 등록</h2>

<!-- 파일을 첨부하기 위해  enctype="multipart/form-data"을 지정 -->
<form action="/member/register_action" method="post" name="registerForm" id="rrrr" enctype="multipart/form-data">
		
	<div class="input-group mb-3 mt-4">
		<input type="text" class="form-control" placeholder="아이디" id="user_id" name="user_id"
		 data-field="user_id">
		<button class="btn btn-outline-secondary" type="button" id="checkIdBtn">중복체크</button>
	    <div class="valid-feedback"></div>
	    <div class="invalid-feedback"></div>
	</div>
	
	<div class="input-group mb-3">
		<input type="text" class="form-control is-invalied" placeholder="비밀번호" name="password" data-field="password">
		<div class="invalid-feedback"></div>
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="비밀번호 확인" aria-label="Recipient's username" aria-describedby="button-addon2" data-field="pwcheck">
		<div class="invalid-feedback"></div>
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="이름" aria-label="Recipient's username" aria-describedby="button-addon2" name="username">
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="email" aria-label="Recipient's username" aria-describedby="button-addon2" name="email">
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="전화번호" aria-label="Recipient's username" aria-describedby="button-addon2" name="phone_number">
	</div>
	<div class="input-group mb-3">
		<input type="file" class="form-control" id="inputGroupFile01" name="file">
	</div>
	
	<div class="input-group mb-3 justify-content-md-center">
		<!-- 저장버튼을 클릭 하면 /member/register_action -> 컨트롤러에서 데이터 수집 -->
		<button id="saveBtn" type="submit" class="btn btn-primary">저장</button>
        <button type="reset" class="btn btn-outline-secondary">초기화</button>
	</div>  
</form>
</div>
<!-- footer 영역 -->
<%@include file="/common/footer.jsp" %>
</body>
</html>