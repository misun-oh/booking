package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.mapper.LessonMapper;

@Controller
public class HelloController {
	
	@Autowired
	IntructorMapper ml;
	
	@Autowired
	LessonMapper ll;
	
	@GetMapping("/")
	private String hello(Model model) {
		
		model.addAttribute("list", ml.getList(new SearchDto()));
		model.addAttribute("list2", ll.getList());
		return "/edu/main";

	}
	@GetMapping("/main")
	private String main(Model model) {
		
		model.addAttribute("list", ml.getList(new SearchDto()));
		model.addAttribute("list2", ll.getList());
		return "/edu/main";

	}
	
	@GetMapping("/ex")
	private String cate() {
		return "/edu/ex/cate";
	}
	
	@GetMapping("/videoplay")
	private String edu_VideoPlay(Model model) {
		
		return "/edu/videoplay";
	}
}
