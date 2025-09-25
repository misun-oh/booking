const mediaInput = document.getElementById('mediaInput');
const preview = document.getElementById('preview');
const mediaError = document.getElementById('mediaError');
const lesson_order = document.getElementById('lesson_order');
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
  preview.src = url; 
  preview.load();
});

function validate(){
  let ok = true;
  titleError.textContent = '';
  descError.textContent = '';
  mediaError.textContent = '';
  formMsg.textContent = '';

  if(title.value.trim().length === 0){
    titleError.textContent = '강의명을 입력하세요.'; ok = false;
  }
  if(title.value.length > 100){
    titleError.textContent = '강의명은 100자 이내여야 합니다.'; ok = false;
  }
  if(desc.value.length > 200){
    descError.textContent = '설명은 200자 이내여야 합니다.'; ok = false;
  }
  const f = mediaInput.files && mediaInput.files[0];
  if(!f){
    mediaError.textContent = '강의 영상을 선택해주세요.'; ok = false;
  }
  return ok;
}

form.addEventListener('submit', (e) => {
  e.preventDefault();
  if(!validate()) return;

  const fd = new FormData();
  fd.append('lesson_order', lesson_order.value.trim());
  fd.append('lesson_name', title.value.trim()); // ✅ 정확한 name
  fd.append('lesson_explan', desc.value.trim());
  fd.append('file', mediaInput.files[0]); // ✅ file로 수정

  console.log('=== 전송할 FormData ===');
  for(const pair of fd.entries()){ console.log(pair[0], pair[1]); }

  formMsg.className = 'success';
  formMsg.textContent = '폼이 유효합니다. (실제 전송은 예시이므로 서버 요청 코드를 추가하세요.)';
  
  form.submit();
});

resetBtn.addEventListener('click', () => {
  form.reset();
  preview.querySelector('Source').src = "";
  preview.load();
  updateCounters();
  mediaError.textContent = '';
  titleError.textContent = '';
  descError.textContent = '';
  formMsg.textContent = '';
});