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

@Controller
public class LessonController {
	
	@Autowired
	LessonMapper lm;
	
	LessonService ls;
	
	@Autowired
	UploadService uploadS;
	
	@PostMapping("/Lecturelist")
	private String register_action(Model model, MultipartFile file, LessonDto lessonD) {
		
		System.out.println("첨부파일 수집 확인 테스트");
		System.out.println(file.getOriginalFilename());
		int seq = uploadS.getSeq();
		System.out.println(file.getName());
		int res = uploadS.insertUpload(file, seq);
		lessonD.setFile_id(seq);
		System.out.println("lesson : " + lessonD);
		int res1 = lm.insert(lessonD);
		
		if(res1 > 0) {
			
			model.addAttribute("msg", "등록되었습니다.");
		
		} else {
			
			model.addAttribute("msg", "등록 실패");
		}
		
		return "/edu/Lecturelist";

	}
	
	@GetMapping("Lecturelist")
	public String msgList(Model model) {
		
		List<LessonDto> getll = lm.getList();
		model.addAttribute("getll", getll);
		model.addAttribute("msg", "리스트 조회");
		
		return "/edu/Lecturelist";

	}
	
}
