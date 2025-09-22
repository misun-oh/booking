package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.CourseDto;
import com.booking.boot.Dto.CourseLevel;
import com.booking.boot.Dto.InstructorDto;
import com.booking.boot.mapper.CourseMapper;
import com.booking.boot.service.UploadService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CourseController {

	@Autowired
	CourseMapper mapper;
	@Autowired
	UploadService uploadService;
	@GetMapping("/course/register")
	private void register() {
		
	}
	@PostMapping("/course/register_action")
	private String register_action(Model model, CourseDto courseDto, MultipartFile file) {
		System.out.println("첨부파일이 잘 수집 되었는지 확인");
		System.out.println(file.getOriginalFilename());
		int seq = uploadService.getSeq();
		System.out.println(file.getName());
		int res1 = uploadService.insertUpload(file, seq);
		courseDto.setInstructor_id(seq);
		int res = mapper.insertCourse(courseDto);
		if(res>0) {
			
			model.addAttribute("msg", "등록되었습니다");
			
		}else {
			model.addAttribute("msg", "등록 실패했습니다");
			
		}
		return "/common/msgbox";
	}
	@GetMapping("/insertcourse")
	private String course_input(Model model) {
		
		return "/edu/insertcourse";
	}
	
}
