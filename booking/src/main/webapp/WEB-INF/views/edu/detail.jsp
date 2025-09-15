<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lecture Details</title>

</head>
<body>
<%@include file="/edu/header.jsp" %>





<div style="padding: 30px; max-width: 600px; margin: auto;">
    <h2>${intructor.name} 강사 상세보기</h2>
    <img src="/download/${intructor.file_id}/${intructor.attach_idx}" style="width: 100%; max-width: 400px; border-radius: 10px;">

    <p><strong>소개:</strong> ${intructor.word}</p>
    <p><strong>카테고리 ID:</strong> ${intructor.category_id}</p>
</div>


    


<%@include file="/edu/footer.jsp" %>
</body>
</html>