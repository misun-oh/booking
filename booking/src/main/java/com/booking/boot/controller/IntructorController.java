package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.service.IntructorService;

@Controller
public class IntructorController {
	@Autowired
	IntructorMapper intructorMapper;
	@Autowired
	IntructorService intructorService;
	@GetMapping("/intructor/register")
	private void register() {
		
	}
	@PostMapping("/intructor/register_action")
	private String register_action(Model model, IntructorDto intructor) {
		System.out.println("첨부파일이 잘 수집 되었는지 확인");
		
		System.out.println("intructor : " + intructor);
		int res = intructorMapper.insert(intructor);
		
		if(res>0) {
			
			model.addAttribute("msg", "등록되었습니다");
			
		}else {
			model.addAttribute("msg", "등록 실패했습니다");
			
		}
		return "/common/msgbox";
	}
	@GetMapping("/intructorlist")
	public String getList(Model model, SearchDto search) {
		intructorService.getList(model, search);
		return  "/edu/intructorlist";
	}
}
