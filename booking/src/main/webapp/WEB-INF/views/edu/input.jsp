<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 등록(List registration)</title>
<link rel="stylesheet" href="/resources/css/input.css">

</head>
<body>
<%@include file="/edu/header.jsp" %>
  <div class="input_container">
    <h1>강의 등록 폼 (컨테이너 가로 1000px)</h1>

<form id="productForm" action="/Lecturelist" method="post" enctype="multipart/form-data">

        <div class="media-box">
          <video id="preview" class="media-preview" controls>
            
            브라우저가 video 태그를 지원하지 않습니다.
          </video>

            <div class = "video_box">
              <input id="mediaInput" name="file" date-field = "file_id" type="file" accept="video/*" />
				<select name="lesson_order" id="lesson_order">
					<option value="1강">1 강</option>
					<option value="2강">2 강</option>
					<option value="3강">3 강</option>
					<option value="4강">4 강</option>
					<option value="5강">5 강</option>
					<option value="6강">6 강</option>
					<option value="7강">7 강</option>
					<option value="8강">8 강</option>
					<option value="9강">9 강</option>
					<option value="10강">10 강</option>
					<option value="11강">11 강</option>
					<option value="12강">12 강</option>
				</select>
              <label for="mediaInput">강의 영상 (MP4, 최대 20MB)<span class = "recom_size"> 권장 가로 ≤ 1000px</span></label>
            </div>
          <div class="errors" id="mediaError" aria-live="polite"></div>
        </div>
      
	  <div class="text_box">
	      <div class="title_bigbox">
	        <div class = "title_box">
	          <label for="title">강의명</label><br>
	          <input id="title" name="lesson_name" date-field = "lesson_name" type="text" maxlength="100" placeholder="강의 명을 최대 100자까지 입력하세요" required />
	          <div class="title_error">
	            <div class="errors" id="titleError"></div>
	            <div class="counter" id="titleCounter">0 / 100</div>
	          </div>
	        </div>
	      </div>
			
	      <div class="explan_box">
	        <label for="desc">영상 설명</label><br>
	        <textarea id="desc" name="lesson_explan" date-field = "lesson_explan" maxlength="200" placeholder="영상에 대한 설명을 최대 200자까지 입력하세요 "></textarea>
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

<script src="/resources/js/input.js"></script>
<%@include file="/edu/footer.jsp" %>
</body>
</html>