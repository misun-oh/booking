<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns */
            gap: 20px;
            padding: 20px;
        }

        .item {
            border: 1px solid #ccc;
            padding: 15px;
            text-align: center;
            border-radius: 8px;
            transition: box-shadow 0.3s;
        }

        .item:hover {
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        .item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
        }

        .item h3 {
            margin: 10px 0 5px;
        }

        .item p {
            font-size: 14px;
            color: #555;
        }
        
    </style>
<body>
<%@ include file="/edu/header.jsp"%>
<c:if test="${empty list}">
    <p>등록된 강사가 없습니다.</p>
</c:if>
<div class="grid-container">
    <c:forEach var="instructor" items="${list}">
    <a href="/intructor/detail?id=${instructor.instructor_id }" style="text-decoration: none; color: inherit;">
        <div class="item">
            <img src="/download/${instructor.file_id}/${instructor.attach_idx}" alt="${instructor.name} 이미지">
            <h3>${instructor.name}</h3>
            <p>${instructor.word}</p>
            <p>${instructor.price} 원</p>
        </div>
        </a>
    </c:forEach>
</div>




<%@ include file="/edu/footer.jsp"%>
</body>
</html>