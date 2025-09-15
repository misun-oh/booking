<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 등록(List registration)</title>

  <style>
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

</head>
<body>
<%@include file="/edu/header.jsp" %>
  <div class="container">
    <h1>상품 등록 폼 (컨테이너 가로 1000px)</h1>

  <form action="${pageContext.request.contextPath}/register_action" method="post" enctype="multipart/form-data">

      <div class="left">
        <div class="media-box">
          <video id="preview" class="media-preview" controls>
            <source src="" type="video/mp4">
            브라우저가 video 태그를 지원하지 않습니다.
          </video>

          <div style="width:100%; display:flex; gap:8px; align-items:center; justify-content:space-between;">
            <div style="flex:1">
              <label for="mediaInput">상품 영상 (MP4, 최대 20MB)</label>
              <input id="mediaInput" type="file" accept="video/*" />
            </div>
            <div style="width:130px; text-align:right;">
              <div class="hint">권장 가로 ≤ 1000px</div>
            </div>
          </div>

          <div class="errors" id="mediaError" aria-live="polite"></div>
        </div>
      </div>

      <div class="right">
        <div style="margin-bottom:14px;">
          <label for="title">이름 <span style="font-weight:400;color:#6b7280">(최대 100자)</span></label>
          <input id="name" name="name" type="text" maxlength="100" placeholder="이름을 입력하세요" required />
          <div style="display:flex; justify-content:space-between; align-items:center; margin-top:6px;">
            <div class="errors" id="titleError"></div>
            <div class="counter" id="titleCounter">0 / 100</div>
          </div>
        </div>

        <div style="margin-bottom:14px;">
          <label for="desc">상품 설명 <span style="font-weight:400;color:#6b7280">(최대 200자)</span></label>
          <textarea id="desc" maxlength="200" placeholder="상품 설명을 입력하세요"></textarea>
          <div style="display:flex; justify-content:space-between; align-items:center; margin-top:6px;">
            <div class="errors" id="descError"></div>
            <div class="counter" id="descCounter">0 / 200</div>
          </div>
        </div>

        <div style="display:flex; gap:8px; margin-top:10px;">
          <button type="submit" class="btn btn-primary">저장</button>
          <button type="button" id="resetBtn" class="btn btn-ghost">초기화</button>
        </div>

        <div id="formMsg" aria-live="polite"></div>
      </div>
    </form>
  </div>

  <script>
    const mediaInput = document.getElementById('mediaInput');
    const preview = document.getElementById('preview');
    const mediaError = document.getElementById('mediaError');
    const title = document.getElementById('title');
    const desc = document.getElementById('desc');
    const titleCounter = document.getElementById('titleCounter');
    const descCounter = document.getElementById('descCounter');
    const titleError = document.getElementById('titleError');
    const descError = document.getElementById('descError');
    const form = document.getElementById('productForm');
    const formMsg = document.getElementById('formMsg');
    const resetBtn = document.getElementById('resetBtn');

    const MAX_VIDEO_BYTES = 20 * 1024 * 1024; // 20MB

    function updateCounters(){
      titleCounter.textContent = `${title.value.length} / 100`;
      descCounter.textContent = `${desc.value.length} / 200`;
    }
    title.addEventListener('input', updateCounters);
    desc.addEventListener('input', updateCounters);
    updateCounters();

    mediaInput.addEventListener('change', (e) => {
      const file = e.target.files && e.target.files[0];
      mediaError.textContent = '';
      if(!file) return;

      if(!file.type.startsWith('video/')){
        mediaError.textContent = '영상 파일(MP4 등)만 업로드 가능합니다.';
        mediaInput.value = '';
        return;
      }
      if(file.size > MAX_VIDEO_BYTES){
        mediaError.textContent = '파일 크기는 최대 20MB 까지 허용됩니다.';
        mediaInput.value = '';
        return;
      }

      const url = URL.createObjectURL(file);
      preview.querySelector('source').src = url;
      preview.load();
    });

    function validate(){
      let ok = true;
      titleError.textContent = '';
      descError.textContent = '';
      mediaError.textContent = '';
      formMsg.textContent = '';

      if(title.value.trim().length === 0){
        titleError.textContent = '상품명을 입력하세요.'; ok = false;
      }
      if(title.value.length > 100){
        titleError.textContent = '상품명은 100자 이내여야 합니다.'; ok = false;
      }
      if(desc.value.length > 200){
        descError.textContent = '설명은 200자 이내여야 합니다.'; ok = false;
      }
      const f = mediaInput.files && mediaInput.files[0];
      if(!f){
        mediaError.textContent = '상품 영상을 선택해주세요.'; ok = false;
      }
      return ok;
    }

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      if(!validate()) return;

      const fd = new FormData();
      fd.append('video', mediaInput.files[0]);
      fd.append('title', title.value.trim());
      fd.append('desc', desc.value.trim());

      console.log('=== 전송할 FormData ===');
      for(const pair of fd.entries()){ console.log(pair[0], pair[1]); }

      formMsg.className = 'success';
      formMsg.textContent = '폼이 유효합니다. (실제 전송은 예시이므로 서버 요청 코드를 추가하세요.)';
    });

    resetBtn.addEventListener('click', () => {
      form.reset();
      preview.querySelector('source').src = "";
      preview.load();
      updateCounters();
      mediaError.textContent = '';
      titleError.textContent = '';
      descError.textContent = '';
      formMsg.textContent = '';
    });
  </script>

    


<%@include file="/edu/footer.jsp" %>
</body>
</html>