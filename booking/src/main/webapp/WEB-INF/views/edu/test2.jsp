<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f3f4f6;
    }

    .container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        padding: 40px;
    }
    .card {
        background-color: white;
        border-radius: 10px;
        padding: 24px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        text-align: center;
        transition: transform 0.2s;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .card h2 {
        font-size: 18px;
        margin-bottom: 12px;
        color: #111827;
    }
    .card p {
        font-size: 14px;
        color: #6b7280;
        margin-bottom: 16px;
    }
    .btn {
        display: inline-block;
        padding: 10px 18px;
        background-color: #2563eb;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 14px;
        transition: background-color 0.2s;
    }
    .btn:hover {
        background-color: #1e40af;
    }
</style>

</head>
<body>
<%@include file="/edu/header.jsp" %>

    <header>관리자 Home</header>
    <div class="container">
        <div class="card">
            <h2>QNA 게시판</h2>
            <p>신규 문의 내용을 확인합니다.</p>
            <a href="/admin/qna" class="btn">바로가기</a>
        </div>
        <div class="card">
            <h2>회원가입 리스트</h2>
            <p>전체 회원 가입 정보를 확인합니다.</p>
            <a href="/admin/members" class="btn">바로가기</a>
        </div>
        <div class="card">
            <h2>구독회원 리스트</h2>
            <p>구독 회원 현황을 관리합니다.</p>
            <a href="/admin/subscribers" class="btn">바로가기</a>
        </div>
        <div class="card">
            <h2>강사 가입 리스트</h2>
            <p>강사 신청 및 가입 정보를 확인합니다.</p>
            <a href="/admin/instructors" class="btn">바로가기</a>
        </div>
    </div>

<%@include file="/edu/footer.jsp" %>
</body>
</html>