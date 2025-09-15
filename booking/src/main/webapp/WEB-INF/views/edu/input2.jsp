<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록(Course Registration)</title>

<style>
/* 컨테이너 고정 가로 1000px (반응형을 위해 max-width 포함) */
body { font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial; background:#f6f7fb; padding:30px; }
.container { width:1000px; max-width:100%; margin:0 auto; background:#fff; border-radius:12px; box-shadow:0 6px 18px rgba(20,20,40,0.06); padding:28px; }
h1 { margin:0 0 18px; font-size:20px; }


form { display:flex; gap:28px; align-items:flex-start; }
.left, .right { flex:1; }


/* 이미지 박스 */
.image-box { border:1px dashed #d0d6e0; border-radius:8px; padding:14px; display:flex; flex-direction:column; gap:12px; align-items:center; justify-content:center; }
.image-preview { width:100%; max-width:420px; height:auto; object-fit:contain; border-radius:6px; background:#fafafa; }
.meta { width:100%; display:flex; gap:8px; align-items:center; justify-content:space-between; }
.hint { font-size:13px; color:#6b7280; }


/* 입력 필드 */
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
    <h1>강의 등록(Course Registration)</h1>

    <form id="productForm" novalidate  method ="post" action = "/intructor/register_action" enctype="multipart/form-data">
      <div class="left">
        <div class="image-box">
          <img id="preview" class="image-preview" alt="이미지 미리보기" src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='420' height='280'><rect width='100%' height='100%' fill='%23f3f4f6'/><text x='50%' y='50%' dominant-baseline='middle' text-anchor='middle' fill='%239ca3af' font-family='Arial' font-size='18'>이미지를 여기에 업로드하세요</text></svg>">

          <div style="width:100%; display:flex; gap:8px; align-items:center; justify-content:space-between;">
            <div style="flex:1">
              <label for="imageInput">상품 이미지 (JPG/PNG, 최대 5MB)</label>
              <input id="imageInput" name="file" data-field="img" type="file" accept="image/*" />
            </div>
            <div style="width:130px; text-align:right;">
              <div class="hint">권장 사이즈 500x500px(정사각 이미지)</div>
            </div>
          </div>

          <div class="errors" id="imgError" aria-live="polite"></div>
        </div>
      </div>

      <div class="right">
        <div style="margin-bottom:14px;">
          <label for="title">강사명 <span style="font-weight:400;color:#6b7280">(최대 100자)</span></label>
          <input id="title" name="name" data-field="name" type="text" maxlength="100" placeholder="이름을 입력하세요" required />
          <div style="display:flex; justify-content:space-between; align-items:center; margin-top:6px;">
            <div class="errors" id="titleError"></div>
            <div class="counter" id="titleCounter">0 / 100</div>
          </div>
        </div>
		
		<select class="form-select form-select-lg mb-3" aria-label="Large select example" id="parentCategory" name="category_id">
		    <option selected disabled>카테고리를 선택하세요</option>
		    <c:forEach var="cat" items="${categoryList}">
		        <option value="${cat.id}">${cat.name}</option>
		    </c:forEach>
		</select>

		<!-- 하위 카테고리 -->
		<select id="childCategory" class="form-select form-select-lg mb-3" name="sub_category_id">
		    <option selected disabled>하위 카테고리를 선택하세요</option>
		</select>
		
        <div style="margin-bottom:14px;">
          <label for="desc">자기소개 <span style="font-weight:400;color:#6b7280">(최대 200자)</span></label>
          <textarea id="desc" name="word" data-field="word" maxlength="200" placeholder="자기소개를 입력하세요"></textarea>
          
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
    const imageInput = document.getElementById('imageInput');
    const preview = document.getElementById('preview');
    const imgError = document.getElementById('imgError');
    const title = document.getElementById('title');
    const desc = document.getElementById('desc');
    const titleCounter = document.getElementById('titleCounter');
    const descCounter = document.getElementById('descCounter');
    const titleError = document.getElementById('titleError');
    const descError = document.getElementById('descError');
    const form = document.getElementById('productForm');
    const formMsg = document.getElementById('formMsg');
    const resetBtn = document.getElementById('resetBtn');

    const MAX_IMG_BYTES = 5 * 1024 * 1024; // 5MB

    // 문자 카운터 업데이트
    function updateCounters(){
      titleCounter.textContent = `${title.value.length} / 100`;
      descCounter.textContent = `${desc.value.length} / 200`;
    }
    title.addEventListener('input', updateCounters);
    desc.addEventListener('input', updateCounters);
    updateCounters();

    // 이미지 선택 핸들러
    imageInput.addEventListener('change', (e) => {
      const file = e.target.files && e.target.files[0];
      imgError.textContent = '';
      if(!file) return;

      if(!file.type.startsWith('image/')){
        imgError.textContent = '이미지 파일(JPG/PNG 등)만 업로드 가능합니다.';
        imageInput.value = '';
        return;
      }
      if(file.size > MAX_IMG_BYTES){
        imgError.textContent = '파일 크기는 최대 5MB 까지 허용됩니다.';
        imageInput.value = '';
        return;
      }

      // 미리보기 생성
      const reader = new FileReader();
      reader.onload = (ev) => {
        preview.src = ev.target.result;
      };
      reader.readAsDataURL(file);
    });

    // 폼 검증
    function validate(){
      let ok = true;
      titleError.textContent = '';
      descError.textContent = '';
      imgError.textContent = '';
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
      const f = imageInput.files && imageInput.files[0];
      if(!f){
        imgError.textContent = '상품 이미지를 선택해주세요.'; ok = false;
      }
      return ok;
    }

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      if(!validate()) return;

      // 실제로는 여기서 FormData를 서버로 보냅니다.
      const fd = new FormData();
      fd.append('image', imageInput.files[0]);
      fd.append('title', title.value.trim());
      fd.append('desc', desc.value.trim());

      // 예시: 서버로 전송하는 대신 콘솔에 출력하고 성공 메시지 표시
      console.log('=== 전송할 FormData ===');
      for(const pair of fd.entries()){ console.log(pair[0], pair[1]); }

      formMsg.className = 'success';
      formMsg.textContent = '폼이 유효합니다. (실제 전송은 예시이므로 서버 요청 코드를 추가하세요.)';

      // 필요하면 실제 전송 예시 (주석 해제 후 사용)
      // fetch('/upload', { method: 'POST', body: fd }).then(r => r.json()).then(res => { ... })
      form.submit();
    });

    resetBtn.addEventListener('click', () => {
      form.reset();
      preview.src = "data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='420' height='280'><rect width='100%' height='100%' fill='%23f3f4f6'/><text x='50%' y='50%' dominant-baseline='middle' text-anchor='middle' fill='%239ca3af' font-family='Arial' font-size='18'>이미지를 여기에 업로드하세요</text></svg>";
      updateCounters();
      imgError.textContent = '';
      titleError.textContent = '';
      descError.textContent = '';
      formMsg.textContent = '';
    });
  </script>
    


<%@include file="/edu/footer.jsp" %>
</body>
</html>