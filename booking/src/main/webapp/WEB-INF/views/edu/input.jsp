<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 등록(List registration)</title>
<<<<<<< HEAD
<link rel="stylesheet" href="/resources/css/input.css">
=======

  <style>
  
  	header {
	  position: relative;  /* 필요시 fixed도 가능 */
	  z-index: 1000;       /* 배너보다 높은 값 */
	}
	  
    body { font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial; background:#f6f7fb;}
    .container { width:1000px; max-width:100%; margin:0 auto; background:#fff; border-radius:12px; box-shadow:0 6px 18px rgba(20,20,40,0.06); padding:28px; }
    h1 { margin:0 0 18px; font-size:20px; }

    form { display:flex; gap:28px; align-items:flex-start; }
    .left, .right { flex:1; }

    .media-box { border:1px dashed #d0d6e0; border-radius:8px; padding:14px; display:flex; flex-direction:column; gap:12px; align-items:center; justify-content:center; }
    .media-preview { width:100%; max-width:420px; height:auto; border-radius:6px; background:#fafafa; }
    .hint { font-size:13px; color:#6b7280; }

    label { display:block; font-weight:600; margin-bottom:6px; }
    input[type="text"], textarea { width:100%; padding:10px 12px; border:1px solid #e6e9f2; border-radius:8px; font-size:14px; box-sizing:border-box; }
    textarea { min-height:140px; resize:vertical; }
    .counter { font-size:13px; color:#6b7280; }

    .btn { display:inline-block; padding:10px 14px; border-radius:8px; cursor:pointer; border:0; font-weight:600; }
    .btn-primary { background:#2563eb; color:#fff; }
    .btn-ghost { background:#f3f4f6; color:#111827; }

    .errors { color:#b91c1c; font-size:13px; margin-top:8px; }
    .success { color:#047857; font-size:14px; margin-top:8px; }

    @media (max-width:980px){ form{flex-direction:column;} }
  </style>
>>>>>>> branch 'main' of https://github.com/misun-oh/booking.git

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