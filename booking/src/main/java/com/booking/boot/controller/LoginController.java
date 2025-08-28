package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.RoomDto;
import com.booking.boot.Dto.ReDataDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.BookingMapper;
import com.booking.boot.mapper.ViewMapper;


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
	
	@Autowired
	ViewMapper mapper;
	
	@GetMapping("/view")
	private String booking_view(Model model, Integer room_no) {
		if(room_no == null) {
			return "/booking/view";
		}
		System.out.println("room_no : "+room_no);
		model.addAttribute("viewDto", mapper.getView(room_no));
		return "/booking/view";
		
	}

	@GetMapping("/view2")
	private String booking_view2(Model model) {
		
		return "/booking/view2";
	}

	@GetMapping("/view3")
	private String booking_view3(Model model) {
		
		return "/booking/view3";
	}

	@GetMapping("/view4")
	private String booking_view4(Model model) {
		
		return "/booking/view4";
	}
		
	@GetMapping("/view5")
	private String booking_view5(Model model) {
		
		return "/booking/view5";
	}
		
	@GetMapping("/view6")
	private String booking_view6(Model model) {
		
		return "/booking/view6";
	}
	
	@GetMapping("/re_data")
	private String booking_re_data(Model model, ReDataDto redata) {
		System.out.println("redata: "+redata);
		return "/booking/re_data";
	}

	
	@GetMapping("/register")
	private String booking_register(Model model) {
		
		return "/booking/register";
	}
}
