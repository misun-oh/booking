<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/common/header.jsp" %>

<script>
	// 모달창에 메세지를 출력후 다른페이지로 이동
	// - 메세지가 없으면 메세지창 띄우지 않기
	// - url 이 없으면 뒤로가기
	let msg = '${requestScope.msg}';
	let url = '${requestScope.url}';
	
	//alert('등록 되었습니다.');
	window.addEventListener('load', function(){
		modalCloseBtn.addEventListener('click', function(){
			//location.href="/member/list";
			if(url){				
				location.href = url;				
			} else {
				// url 없으면 원래 있던 곳으로
				history.back();
			}
			
		});
		
		if(msg != '')
			showModal('메세지 박스', msg);
		
	})
</script>
<%@include file="/common/footer.jsp" %>

</body>
</html>