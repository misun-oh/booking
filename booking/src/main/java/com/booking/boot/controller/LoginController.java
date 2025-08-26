package com.booking.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;


@Controller
public class LoginController {
	@GetMapping("/login")
	private String booking_login() {
		return "/booking/login";
	}
	
	@PostMapping("/main")
	private String booking_main() {
		return "/booking/main";
	}
	@GetMapping("/main")
	private String booking_mainget() {
		return "/booking/main";
	}
	
	@GetMapping("/list")
	private String booking_list(Model model, SearchDto searchDto) {
		model.addAttribute("pageDto", new PageDto(searchDto, 100));
		return "/booking/list";
	}
	
	@GetMapping("/view")
	private String booking_view(Model model) {
		
		return "/booking/view";
	}
	@GetMapping("/register")
	private String booking_register(Model model) {
		
		return "/booking/register";
	}
}
