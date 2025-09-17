<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="/res/css/Lecturelist.css">
    <link rel="stylesheet" href="/res/js/Lecturelist.js">
    <title>강의 페이지</title>
</head>
<body>
	<!--${msg}
	${getll}-->
    <%@include file="/edu/header.jsp" %>
	
    <div class="Lecturelist_container">
        <div class="button_box">
        	<button class="book_registration">교안 등록</button>
            <button class="download_btn">교안 다운로드</button>
        </div>

        <table class="toplist_table">
            <thead>
                <tr class="top_list">
                	<th></th>
                    <th>순서</th>
                    <th>강의명</th>
                    <th class="Attend_class">수강하기</th>
                    <th class="Attend_number">수강횟수</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty getll}">
            		<tr>
            			<td class="NoLecturelist_box">등록된 강의가 없습니다.</td>
            		<tr>
            	</c:if>
            	<c:forEach var="lesson" items="${getll}">
                <tr class="registration_box">
                	<td><input type="checkbox" name="" id="" value="h1"></td>
                    <td>${lesson.lesson_order}</td>
                    <td>
                        ${lesson.lesson_name}<br>
                        <span>00:00</span> / 00:00 <br>
                    </td>
                    <td>
                        <button class="play_btn">재생</button><br>
                        <small>최근 수강 : </small>
                    </td>
                    <td>0</td>
                    <td>${lesson.registration_time}</td>
                </tr> 
                </c:forEach> 
            </tbody>
        </table>
        <div class="bottombtn_box">
            <button onclick="location.href='input'">등록</button>
            <button>수정</button>
            <button>삭제</button>
            <button>목록</button>
        </div>
    </div>
    <%@include file="/edu/footer.jsp" %>
</body>
</html>