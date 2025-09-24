package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.IntructorMapper;

@Controller
public class HelloController {
	
	@Autowired
	IntructorMapper ml;
	
	@GetMapping("/")
	private String hello(Model model) {
		
		model.addAttribute("list", ml.getList(new SearchDto()));
		return "/edu/main";

	}
	@GetMapping("/main")
	private String main(Model model) {
		
		model.addAttribute("list", ml.getList(new SearchDto()));
		return "/edu/main";
		
	}
}
