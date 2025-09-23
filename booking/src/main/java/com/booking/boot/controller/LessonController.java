package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.mapper.LessonMapper;
import com.booking.boot.service.LessonService;
import com.booking.boot.service.UploadService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LessonController {
	
	@Autowired
	LessonMapper lm;
	
	LessonService ls;
	
	@Autowired
	UploadService uploadS;
	
	@PostMapping("/Lecturelist")
	private String register_action(Model model, MultipartFile file, LessonDto lessonD, HttpSession session) {
	    
	    // 세션에서 instructor_id 가져오기
	    Integer instructorId = (Integer) session.getAttribute("instructor_id");

	    // 로그로 확인
	    System.out.println("세션에서 instructor_id: " + instructorId);

	    if(instructorId == null) {
	        model.addAttribute("msg", "강사 정보가 없습니다. 다시 로그인 해주세요.");
	        return "/common/msgbox2";
	    }

	    lessonD.setInstructor_id(instructorId); // 🔥 핵심
	    System.out.println("lesson : " + lessonD);

	    // 업로드 처리
	    int seq = uploadS.getSeq();
	    int res = uploadS.insertUpload(file, seq);
	    lessonD.setFile_id(seq);
	    
	    int res1 = lm.insert(lessonD);

	    if(res1 > 0) {
	        model.addAttribute("msg", "등록되었습니다.");
	    } else {
	        model.addAttribute("msg", "등록 실패");
	    }

	    return "/common/msgbox2"; // 성공/실패 메시지 페이지
	}

	
	@GetMapping("Lecturelist")
	public String msgList(Model model) {
		
		List<LessonDto> getll = lm.getList();
		model.addAttribute("getll", getll);
		model.addAttribute("msg", "리스트 조회");
		
		return "/edu/Lecturelist";

	}
	
}
