<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String msg = (String) request.getAttribute("msg");
    String url = (String) request.getAttribute("url"); // 성공 시 이동할 URL
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <meta charset="UTF-8">
    <title>알림 메시지</title>
    <% if (url != null) { %>
        <!-- 성공 시: 2초 뒤 지정된 URL로 이동 -->
        <meta http-equiv="refresh" content="2;url=<%= url %>">
    <% } %>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8fafc;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            background-color: white;
            padding: 24px 36px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            text-align: center;
        }
        .box h1 {
            font-size: 18px;
            color: #111827;
            margin: 0 0 12px;
        }
        .box p {
            color: #6b7280;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h1><%= msg %></h1>
        <% if (url != null) { %>
            <p>잠시 후 페이지로 이동합니다...</p>
        <% } else { %>
            <p>잠시 후 이전 페이지로 돌아갑니다...</p>
        <% } %>
    </div>

    <!-- 실패 시: JavaScript로 이전 페이지로 -->
    <% if (url == null) { %>
        <script>
            setTimeout(() => {
                history.back(); // 이전 페이지로 이동
            }, 2000); // 2초 후
        </script>
    <% } %>


</body>
</html>