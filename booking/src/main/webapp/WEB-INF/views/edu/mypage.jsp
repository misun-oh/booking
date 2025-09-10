<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
	<%@include file="/edu/header.jsp"%>

	<style>
.qna-table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 16px;
	text-align: left;
	background: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.qna-table th, .qna-table td {
	border: 1px solid #ddd;
	padding: 12px 15px;
}

.qna-table th {
	background: #f2f2f2;
	font-weight: bold;
	text-align: center;
}

.qna-table tr:hover {
	background: #fafafa;
}

.btn {
	background: #c05010;
	color: #fff;
	border: none;
	padding: 8px 14px;
	border-radius: 8px;
	cursor: pointer;
}

.btn:hover {
	background: #a0400c;
}
</style>


	<div class="container">
		<table class="qna-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myPage}" var="qna">
					<tr>
						<td>${qna.qna_id}</td>
						<td>${qna.title}</td>
						<td
							style="max-width: 400px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
							${qna.content}</td>
						<td>${qna.created_at}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@include file="/common/search2.jsp"%>
	<%@include file="/common/pageing.jsp"%>
	<%@include file="/edu/footer.jsp"%>
</body>
</html>
