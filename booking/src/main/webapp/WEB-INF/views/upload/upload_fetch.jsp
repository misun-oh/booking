<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//버튼을 클릭하면 버튼이 클릭되엇다고 메세지 처리
	window.addEventListener('load', ()=>{
		// 리스트 조회
		getList();
		
		let upload_btn = document.querySelector('#upload_btn');
		upload_btn.addEventListener('click', (e)=>{
			e.preventDefault();
			console.log('파일 업로드 버튼 클릭');
			
			let url = "/upload/upload_fetch";
			let formdata = new FormData(uploadForm);
			
			fetch(url, {
				method : 'post',
				body : formdata
			}) // 요청URL
			  .then(response => response.json())	// 요청결과를 object로 변환
			  .then(result => {
				  	// 서버의 통신결과
			    	console.log('res', result.res);
				  	console.log('msg', result.msg);
				  	// msg가 falsy한 값이 아니라면 = 값이 있으면
				  	if(result.msg){
				  		alert(result.msg);
				  	}
				  	
			  })
			  .catch(err=>{
				  	// 네트워크 장애, 매핑된 url이 없는경우
					console.log('err', err);  
			  });
		});
		
		// 멀티 파일 업로드 버튼 클릭 이벤트 
		upload_multi_btn.addEventListener('click', (e)=>{
			e.preventDefault();
			console.log('멀티 파일 업로드 버튼 클릭!');
			
			let url = "/upload/upload_fetch_multi";
			let formData = new FormData(uploadMultiForm);
			
			fetch(url, {
				method : 'post'
				, body : formData
			}) // 요청URL
			.then(response => response.json())	// 요청결과를 object로 변환
			.then(result => {
				  	// 서버의 통신결과
			  	console.log(result);
			})
			.catch(err=>{
				  	// 네트워크 장애, 매핑된 url이 없는경우
					console.log('err', err);  
			});
			
		});
		
	})
	
	// 서버에 업로드리스트를 요청하고 결과를 받아서 화면에 출력
	function getList(page = 1){
		let url = '/upload/upload_list?pageNo=' + page;
		
		fetch(url) // 요청URL
		.then(response => response.json())	// 요청결과를 object로 변환
		.then(result => {
			// 서버의 통신결과 = map
			// list, pageDto
			
			// 리스트를 화면에 출력
			
			// 페이지블럭 출력
			renderPagination(result.pageDto);
		  	
		})
		.catch(err=>{
			  	// 네트워크 장애, 매핑된 url이 없는경우
				console.log('err', err);  
		});
	}


</script>
</head>
<body>
<!-- header 영역 -->
<%@include file="/common/header.jsp" %>
<!-- main 영역 -->
<div id="wrap">
	<h2>다중파일업로드</h2>
	한번에 여러개의 파일을 업로드 합니다.
	<form action="/upload/upload_fetch_multi" name="uploadMultiForm">
		<input type="file" name="files" multiple="multiple">
		<button id="upload_multi_btn">다중 파일 업로드</button>
	</form>
	<hr>


	<h1>fetch를 이용한 파일 업로드</h1>
	<form action="/upload/upload_fetch" name="uploadForm">
		<input type="file" name="file">
		<button id="upload_btn">파일 업로드</button>
	</form>
	<hr>
	
	<h3>파일 목록</h3>
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">First</th>
	      <th scope="col">Last</th>
	      <th scope="col">Handle</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	    </tr>
	  </tbody>
	</table>
	
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