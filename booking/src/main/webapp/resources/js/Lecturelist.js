document.addEventListener("DOMContentLoaded", function (){
	
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
});
