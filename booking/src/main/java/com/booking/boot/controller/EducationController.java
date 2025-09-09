package com.booking.boot.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booking.boot.Dto.SearchDto;
import com.booking.boot.service.EducationService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/course")
@AllArgsConstructor
public class EducationController {
	private final EducationService educationService;
	
	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> getList(SearchDto searchDto){
			System.out.println("리스트 조회 컨트롤러 호출");
			System.out.println("pageNo=" + searchDto.getPageNo());
			System.out.println("amount=" + searchDto.getAmount());
			System.out.println("categoryId=" + searchDto.getCategoryId());
		try {
			Map<String, Object> map = educationService.getlist(searchDto);
			System.out.println(map);
			return ResponseEntity.ok(map);
		} catch (Exception e) {
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}	
	}
}
