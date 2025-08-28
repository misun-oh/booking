package com.booking.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
	
	@GetMapping("/")
	private String hello() {
		return "/booking/main";
		
	

	}
}
