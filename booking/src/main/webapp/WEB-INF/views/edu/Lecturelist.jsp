<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="/res/css/Lecturelist.css">
    <link rel="stylesheet" href="/res/js/Lecturelist.js">
    <title>강의 페이지</title>
</head>
<body>

    <%@include file="/edu/header.jsp" %>

    <div class="container">
        <div class="button_box">
            <button class="download_btn">교안 다운로드</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th>순서</th>
                    <th>강의명</th>
                    <th>교재</th>
                    <th>교안</th>
                    <th class="Attend_class">수강하기</th>
                    <th class="Attend_number">수강횟수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1강</td>
                    <td>
                        공부하지마<br>
                        <span>00:00</span> / 45:10 <br>
                    </td>
                    <td>-</td>
                    <td>-</td>
                    <td>
                        <button class="play_btn">재생</button><br>
                        <small>최근 수강 : 2025-08-01 17:21</small>
                    </td>
                    <td>0</td>
                </tr>  
            </tbody>
        </table>
        <div class="buttons_box1">
            <button>등록</button>
            <button>수정</button>
            <button>삭제</button>
            <button>목록</button>
        </div>
    </div>
    <%@include file="/edu/footer.jsp" %>
</body>
</html>