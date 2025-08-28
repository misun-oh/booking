package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.RoomDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.BookingMapper;


@Controller
public class LoginController {
	
	@Autowired
	BookingMapper bookingMapper;
	
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
		
		List<RoomDto> list = bookingMapper.list();
		model.addAttribute("list", list);
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
