<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="/res/css/Lecturelist.css">
    <title>강의 페이지</title>
</head>
<body>
    <div class="Lecturelist_container">
        
    <form action="/deleteLesson" method="post" id="deleteForm" enctype="multipart/form-data">
        <table class="toplist_table">
            <thead>
                <tr class="top_list">
                	<th><input type="checkbox" name="selectAll" /></th><!-- 전체 선택 체크박스 -->
                    <th>순서</th>
                    <th>강의명</th>
                    <th class="Attend_class">수강하기</th>
                    <th class="Attend_number">수강횟수</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty list}">
            		<tr>
            			<td colspan="6" class="NoLecturelist_box">등록된 강의가 없습니다.</td>
            		</tr>
            	</c:if>
            	<c:forEach var="lesson" items="${list}">
                <tr class="registration_box">
                	<td id="LAllckeck"><input type="checkbox" name="lessonIds" value="${lesson.lesson_id}"></td>
                    <td id="Lnumber">${lesson.lesson_order}</td>
                    <td>${lesson.lesson_name}</td>
                    <td id="play-close">
                        <button type="button" class="play_btn" data-video-src="/download/${lesson.file_id }/0">재생</button>
                        <button type="button" class="close_btn">종료</button>
                    </td>

                    <td id="Lcount">0</td>
                    <td class="Ldate"><fmt:formatDate value="${lesson.registration_time}" pattern="yyyy-MM-dd"/></td>
                </tr> 
                <tr>
                	<td colspan="6">
                		<div class="video-area hidden">
							<video class="lessonVideo" controls>
								<source class="videoSource" src="" type="video/mp4">
								브라우저가 video 태그를 지원하지 않습니다.
							</video>
							<h5>${lesson.lesson_explan}</h5>
						</div>
                	</td>
                </tr>
                </c:forEach> 
            </tbody>
        </table>
        
        <div class="bottombtn_box">
            <c:if test='${loginMember.hasRole("ADMIN") || loginMember.hasRole("PARTNER")}'><button id="reg" type="button" onclick="location.href='input?instructor_id=${instructor.instructor_id}'">등록</button>
            <button id="fix" type="button">수정</button>
            <button id="delete" type="submit">삭제</button></c:if>
        </div>
      </form>
    </div>
    
    <div id="registerToast" class="toast align-items-center text-bg-success border-0 position-fixed top-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true" style="z-index: 9999;">
	  <div class="d-flex">
	    <div class="toast-body">
	      등록되었습니다.
	    </div>
	    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	  </div>
	</div>
	
	<div id="registerToastFail" class="toast align-items-center text-bg-danger border-0 position-fixed top-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true" style="z-index: 9999;">
	  <div class="d-flex">
	    <div class="toast-body">
	      등록 실패
	    </div>
	    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	  </div>
	</div>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/Lecturelist.js"></script>
    
	<script>
		window.addEventListener('DOMContentLoaded', () => {
		  const msg = '<c:out value="${msg}" />' // JSP EL 사용, 문자열로 자동 변환
		  if (msg === "등록되었습니다.") {
		    const toastEl = document.getElementById('registerToast');
		    const toast = new bootstrap.Toast(toastEl, { delay: 2000 });
		    toast.show();
		  } else if(msg === "등록 실패") {
		  	const toastEl = document.getElementById('registerToastFail');
		    const toast = new bootstrap.Toast(toastEl, { delay: 2000 });
		    toast.show();
		  }
		});
	</script>
	
</body>
</html>