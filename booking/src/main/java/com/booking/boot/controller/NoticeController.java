package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.booking.boot.mapper.NoticeMapper;


@Controller

public class NoticeController {
	
	@Autowired
	NoticeMapper notice;
	
	@PostMapping("/notice")
	public String postMethodName(Model model, @RequestBody String entity, String title) {
		System.out.println("title .."+ title);
		// notice.insert();		
		model.addAttribute("msg", "등록되었습니다.");
		return "/common/msgbox";
	}

	@PostMapping("/edu/notice")
	public String postMethodName1(Model model, @RequestBody String entity, String title, String content) {
		System.out.println("title .."+ title);
		System.out.println("content .." + content);
		System.out.println("Notice");
		notice.insert(title, content);
		model.addAttribute("msg", "등록되었습니다.");
		return "/common/msgbox";
	}
	
	
}
