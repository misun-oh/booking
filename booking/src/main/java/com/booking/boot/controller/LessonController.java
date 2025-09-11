package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.service.LessonService;

@Controller
public class LessonController {

	@Autowired
	LessonService ls;
	
	@PostMapping("/register_action")
	private String register_action(Model model, LessonDto lesson) {
		System.out.println("첨부파일이 수집 확인");
		
		lesson.setVideo_url("url");
		System.out.println("lesson : " + lesson);
		int res = ls.insert(lesson);
		
		System.out.println("res : " + res);
		return "/common/msgbox";
	}
	
	
}
