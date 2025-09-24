<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 등록(List registration)</title>
<link rel="stylesheet" href="/resources/css/input.css">
<script src="/resources/js/input.js"></script>
</head>
<body>
<%@include file="/edu/header.jsp" %>
  <div class="input_container">
    <h1>강의 등록 폼 (컨테이너 가로 1000px)</h1>

<form id="productForm" action="/Lecturelist" method="post" enctype="multipart/form-data">
	<!-- 강사 ID -->
	<input type="hidden" name="instructor_id" value="${instructor_id != null ? instructor_id : ''}" />
	
	<!-- 수정일 경우 lesson_id 전달 -->
	<input type="hidden" name="lesson_id" value="${lesson.lesson_id}" />
	
        <div class="media-box">
          <video id="preview" class="media-preview" controls>
            <c:if test="not empty lesson.stored_name}">
            	<source src="/upload/${lesson.stored_name}" type="video/mp4" />
            </c:if>
            브라우저가 video 태그를 지원하지 않습니다.
          </video>

            <div class = "video_box">
              <input id="mediaInput" name="file" data-field="file_id" type="file" accept="video/*" />
				<select name="lesson_order" id="lesson_order">
					<c:forEach begin="1" end="12" var="i">
						<c:set var="label" value="${i}강" />
						<option value="${label}" <c:if test="${lesson.lesson_order == label}">selected</c:if>>${label}</option>
					</c:forEach>
				</select>
              <label for="mediaInput">강의 영상 (MP4, 최대 20MB)<span class = "recom_size"> 권장 가로 ≤ 1000px</span></label>
            </div>
          <div class="errors" id="mediaError" aria-live="polite"></div>
        </div>
      
	  <div class="text_box">
	      <div class="title_bigbox">
	        <div class = "title_box">
	          <label for="title">강의명</label><br>
	          <input id="title" name="lesson_name" data-field="lesson_name" type="text" maxlength="100" 
	          		  placeholder="강의 명을 최대 100자까지 입력하세요" required 
	          		  value="${lesson.lesson_name != null ? lesson.lesson_name : ''}" />
	          <div class="title_error">
	            <div class="errors" id="titleError"></div>
	            <div class="counter" id="titleCounter">0 / 100</div>
	          </div>
	        </div>
	      </div>
			
	      <div class="explan_box">
	        <label for="desc">영상 설명</label><br>
	        <textarea id="desc" name="lesson_explan" data-field="lesson_explan" maxlength="200" 
	        		  placeholder="영상에 대한 설명을 최대 200자까지 입력하세요 ">${lesson.lesson_explan}</textarea>
	        <div class="explan_error">
	          <div class="errors" id="descError"></div>
	          <div class="counter" id="descCounter">0 / 200</div>
	        </div>
	      </div>
	
	      <div class="button_box">
	        <button type="submit" class="save_btn">저장</button><br>
	        <button type="button" id="resetBtn" class="btn btn-ghost">초기화</button>
	      </div>
		
	      <div id="formMsg" aria-live="polite"></div>
	  </div>
    </form>
  </div>

<%@include file="/edu/footer.jsp" %>
</body>
</html>