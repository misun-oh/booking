package com.booking.boot.controller;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.mapper.LessonMapper;
import com.booking.boot.service.LessonService;
import com.booking.boot.service.UploadService;

@Controller
public class LessonController {
	
	@Autowired
	LessonMapper lm;
	
	LessonService ls;
	
	@Autowired
	UploadService uploadS;
	
	
	@PostMapping("/Lecturelist")
	private String register_action(Model model, MultipartFile file, LessonDto lessonD, RedirectAttributes redirectAttributes) {
		
		System.out.println("첨부파일 수집 확인 테스트");
		System.out.println(file.getOriginalFilename());
		
		int seq = -1;
		if(!file.isEmpty()) {
			seq = uploadS.getSeq();
			System.out.println(file.getName());
			uploadS.insertUpload(file, seq);
			lessonD.setFile_id(seq);
		}
		
		if(lessonD.getLesson_id() > 0) {
			//수정
			if(seq == -1) {
				// 기존 file_id 유지(DB에서 조회해서 설정하거나 클라이언트에서 보내기)
				LessonDto existing = lm.findById(lessonD.getLesson_id());
				lessonD.setFile_id(existing.getFile_id());
			}
			lessonD.setFix_time(new Date());
			lm.updateLesson(lessonD);
			model.addAttribute("msg", "수정되었습니다.");
		} else {
			//새 등록
			lessonD.setRegistration_time(new Date()); //등록 시간 설정 코드
			lm.insert(lessonD);
			model.addAttribute("msg", "등록되었습니다.");
		}
		
		
		/*
		int res1 = lm.insert(lessonD);
		
		if(res1 > 0) {
			
			model.addAttribute("msg", "등록되었습니다.");
		
		} else {
			
			model.addAttribute("msg", "등록 실패");
		}
		*/
		
		//게시글을 등록했을때 예전에 작성된 게시글불러와주는 코드
		List<LessonDto> list = lm.getList();
		model.addAttribute("list", list);
		
		return "/edu/Lecturelist";

	}
	
	@PostMapping("/deleteLesson")
	public String deleteLesson(@RequestParam("lessonIds") List<Integer> lessonIds, Model model) {
		LocalDateTime deleteTime = LocalDateTime.now();
		
		for(int lessonId : lessonIds) {
			lm.deleteLesson(lessonId, deleteTime);
		}
		
		model.addAttribute("msg", "선택한 강의가 삭제되었습니다.");
		return "redirect:/Lecturelist";

	}
	/*
	@GetMapping("Lecturelist")
	public String msgList(Model model) {
		
		List<LessonDto> list = lm.getList();
		model.addAttribute("list", list);
		model.addAttribute("msg", "리스트 조회");
		
		return "/edu/Lecturelist";

	}
	*/
	@GetMapping("/input")
	public String editLesson(@RequestParam(value = "lesson_id", required = false) Integer lessonId, Model model) {
		if (lessonId != null) {
			LessonDto lesson = lm.findById(lessonId);
			model.addAttribute("lesson", lesson);
		}
		return "/edu/input";
	}
	
	@GetMapping("/Lecturelist")
	public String lectureList(@RequestParam(name="instructor_id", required=false) Integer instructorId, Model model) {
	    List<LessonDto> list;
	    if (instructorId != null) {
	        list = lm.getLessonsByInstructorId(instructorId);
	    } else {
	        list = lm.getList();
	    }
	    model.addAttribute("list", list);
	    model.addAttribute("msg", "리스트 조회");
	    return "/edu/Lecturelist";
	}
	
	@GetMapping("/Media_Small")
	private String edu_Media_Small() {
		return "/edu/Media_Small";
	}
	
	
	
}
