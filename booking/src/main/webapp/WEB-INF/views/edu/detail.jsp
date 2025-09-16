<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${intructor.name} | 강사 상세보기</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f9fafb;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        padding: 32px;
        display: flex;
        flex-direction: row;
        gap: 40px;
        align-items: flex-start;
    }

    .image-box img {
        width: 100%;
        max-width: 360px;
        border-radius: 12px;
        object-fit: cover;
        background-color: #f3f4f6;
    }

    .info {
        flex: 1;
    }

    .info h2 {
        margin-top: 0;
        font-size: 26px;
        font-weight: 700;
        color: #111827;
    }

    .info p {
        font-size: 16px;
        color: #374151;
        line-height: 1.6;
    }

    .info .category {
        margin-top: 20px;
        font-size: 14px;
        color: #6b7280;
        background: #f3f4f6;
        padding: 6px 12px;
        display: inline-block;
        border-radius: 8px;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
            padding: 24px;
        }

        .image-box img {
            max-width: 100%;
        }
    }
</style>
</head>
<body>

<%@ include file="/edu/header.jsp" %>

<div class="container">
    <div class="image-box">
        <img src="/download/${intructor.file_id}/${intructor.attach_idx}" alt="${intructor.name} 강사 이미지">
    </div>
    <div class="info">
        <h2>${intructor.name} 강사</h2>
        <p>${intructor.word}</p>

        <c:if test="${not empty intructor.category_name}">
            <div class="category">카테고리: ${intructor.category_name}</div>
        </c:if>
        <c:if test="${empty intructor.category_name}">
            <div class="category">카테고리 ID: ${intructor.category_id}</div>
        </c:if>
    </div>
</div>

<%@ include file="/edu/footer.jsp" %>

</body>
</html>