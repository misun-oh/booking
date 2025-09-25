document.addEventListener("DOMContentLoaded", function (){
	//전체 선택 체크박스
	const selectAllCheckbox = document.querySelector("input[name='selectAll']");
	const lessonCheckboxes = document.querySelectorAll("input[name='lessonIds']");
	
	// 전체 선택 체크박스를 클릭할때
	selectAllCheckbox.addEventListener("change", function () {
		lessonCheckboxes.forEach(function (checkbox) {
			checkbox.checked = selectAllCheckbox.checked; //전체 선택 상태에 맞춰 체크박스 선택
		});
	});
	
	// 개별 체크박스를 클릭할 때
	lessonCheckboxes.forEach(function (checkbox){
		checkbox.addEventListener("change", function(){
			//전체 선택 체크박스 상태 갱신
			const allChecked = Array.from(lessonCheckboxes).every(function (checkbox){
				return checkbox.checked;
			});
			selectAllCheckbox.checked = allChecked; //개별 체크박스들이 모두 선택되었으면 전체 체크박스를 선택
		});
	});
	
	//삭제 폼 체크
	const deleteForm = document.getElementById("deleteForm");
	if (deleteForm) {
		deleteForm.addEventListener("submit", function (e) {
			const checkboxes = document.querySelectorAll("input[name='lessonIds']:checked");
			if(checkboxes.length === 0) {
				e.preventDefault();
				alert("삭제할 강의를 선택해주세요.")
			}
		});
	}
	// x 버튼 처리
	const closeButtons = document.querySelectorAll(".close_btn");
	
	closeButtons.forEach(function (btn) {
		btn.addEventListener("click", function() {
			// 이 버튼이 속한 강의 영역 내의 video 태그를 찾습니다.
			const tr = btn.closest("tr"); //현재 강의 row
			const nextTr = tr.nextElementSibling; // 다음 tr에 video가 있습니다.
			const videoArea = nextTr.querySelector(".video-area"); // video와 설명 포함 전체 div
			const videoPlayer = videoArea.querySelector(".lessonVideo");
			
			if(videoPlayer) {
				videoPlayer.pause();
				videoPlayer.currentTime = 0;
				
			}
			
			if (videoArea) {
				videoArea.classList.add("hidden");
			}
		});
	});
	
	
	//비디오 모달 재생 설정
	const playButtons = document.querySelectorAll(".play_btn");
	
	playButtons.forEach(function (btn) {
		btn.addEventListener("click", function () {
			const tr = btn.closest("tr");
			const nextTr = tr.nextElementSibling;
			const videoArea = nextTr.querySelector(".video-area");
			const videoPlayer = videoArea.querySelector(".lessonVideo");
			const videoSource = videoArea.querySelector(".videoSource");
			
			const videoSrc = btn.getAttribute('data-video-src');
			
			videoSource.src = videoSrc;
			videoPlayer.load();
			
			videoArea.classList.remove("hidden");
			
			//자동 재생 추가
			videoPlayer.play().catch(function (error) {
				console.error("자동 재생 실패:", error);
			});
		});
	});
	
	document.getElementById("fix").addEventListener("click", function () {
		const selected = document.querySelector("input[name='lessonIds']:checked");
		if (!selected) {
			alert("수정할 강의를 선택해주세요");
			return;
		}
		
		const lessonId = selected.value;
		window.location.href = `/intructor/input?lesson_id=${lessonId}`;
	});
});
