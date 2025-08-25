<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1. 태그라이브러리 추가
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	window.addEventListener('load', function(){
		let searchField = document.querySelector('[name=searchField]');
		
	    let optionList = [{value:"orig_name", text:"파일명"}
	    					, {value:"user_id", text:"등록ID"}];
	    
	    // selectbox, optionList, selectedItem
	    // 셀렉트박스, 옵션목록, 선택할아이템
	    settingSelect(searchField, optionList, '${param.searchField}');
	    
	});
</script>

</head>
<body>
<%@include file="/common/header.jsp" %>
<!-- 

	1. 페이지 잘 띄우기 - 경로
	2. 데이터 수집 

-->
<h1>파일 업로드</h1>

<!-- ❗파일을 전송 하기 위해서 enctype을 multipart/form-data로 지정 합니다!

<form> 태그의 enctype 속성
폼 데이터(form data)가 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시


 -->
<h3>첨부파일 등록</h3>
<hr>
<form action="/upload/upload" method="post" enctype="multipart/form-data">
	user_id <input type="text" name="user_id" value="100"><br>
	<!-- 다중 파일을 첨부할 경우, multiple="multiple" 옵션을 줄수 있다! -->
	첨부파일 <input type="file" name="file"><br>
	<button type="submit">업로드</button>
</form>


<h3>첨부파일 목록</h3>
<%@include file="/common/search.jsp" %>
<hr>
<!-- 
내장객체의 영역에 저장된 데이터를 화면에 출력
태그라이브러리를 이용한 데이터 출력 -->
<c:if test="${empty list}">
	<tr><td colspan="4" class="text-center">게시글이 존재하지 않습니다.</td></tr>
</c:if>
<c:if test="${not empty list}">
	<!-- 리스트 출력 -->
	리스트 출력
	<table border=1>
		<tr>
			<th>
				파일id
			</th> 
			<th>
				파일index
			</th>
			<th>  
				파일명<br>  
				저장명
			</th>
			<th>
				등록ID
			</th>  
			<th>
				등록일
			</th>		
		</tr>
		<!-- 리스트로 부터 uploadDto를 하나씩 꺼내서 tr을 만들어 준다 -->
		<c:forEach items="${list }" var="file">
			<tr>
				<td>
					${file.file_id }
				</td> 
				<td>
					${file.attach_idx }
				</td>
				<td>  
					${file.orig_name }<br>
					${file.stored_name }
					<!--
					<a href="/upload/download?orig_name=${file.orig_name }&stored_name=${file.stored_name }">다운로드</a>
					-->
					<!-- 쿼리스트링을 이용하여 파라메터를 전달 -->
					<a href="/upload/download?file_id=${file.file_id }&attach_idx=${file.attach_idx }">다운로드</a>
					<!-- 경로를 이용하여 파라메터를 전달 -->
					<a href="/upload/download/${file.file_id }/${file.attach_idx }">다운로드</a>
				</td>   
				<td>
					${file.user_id }
				</td>  
				<td>
					${file.created_at }
				</td>		
			</tr>
		</c:forEach>
	</table>
	
</c:if>


<div id="pageingDiv"></div>





<!-- 
1. pageing.jsp include 
2. controller에서 searchDto 파라메터 수집 => pageDto만들때 필요
3. 총건수 조회 하기 => pageDto를 만들때 필요
4. service에서 pageDto를 model에 저장
5. 헤더, search, footer 불러오기
------------------------------------
1. 리스트 조회 쿼리수정
------------------------------------
1. 검색처리
	검색, 총건수 조회 시 searchDto를 파라메터로 전달
-->

<%@include file="/common/pageing.jsp" %>

<%@include file="/common/footer.jsp" %>

<script type="text/javascript">
function getList(){
	let url = '/upload/upload_list?pageNo=2';
	
	fetch(url) // 요청URL
	.then(response => response.json())	// 요청결과를 object로 변환
	.then(result => {
		// 서버의 통신결과 = map
		// list, pageDto
		// 리스트를 화면에 출력
		printList(result);
	  	
	})
	.catch(err=>{
		  	// 네트워크 장애, 매핑된 url이 없는경우
			console.log('err', err);  
	});
}

function printList(result){
	// 리스트 출력
	console.log("list", result.list);
	let content="";
	// 페이지 블럭
	
  	console.log("pageDto", result.pageDto);
  	let pageDto = result.pageDto;
  	console.log(pageDto.startNo);
  	console.log(pageDto.endNo);

  	if(pageDto.isPrev){
  		content += "<";
  		console.log("<");
  	}
  	
  	for(let i=pageDto.startNo;i<=pageDto.endNo;i++){
  		content += i + " ";
  		console.log("페이지"+i);
  	}
  	
  	if(pageDto.isNext){
  		content += ">";
  		console.log(">");
  	}
  	
  	
  	pageingDiv.innerHTML=content;
 }
 
getList()
</script>
</body>
</html>