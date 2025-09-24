package com.booking.boot.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.CourseDto;

//import com.booking.boot.Dto.CourseLevel;

import com.booking.boot.Dto.CourseLevel;
import com.booking.boot.Dto.EnrollmentDto;
import com.booking.boot.Dto.EnrollmentStatus;

import com.booking.boot.Dto.InstructorDto;
import com.booking.boot.Dto.MemberDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.EnrollmentMapper;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.service.IntructorService;
import com.booking.boot.service.UploadService;

import jakarta.servlet.http.HttpSession;

@Controller
public class IntructorController {
	@Autowired
	IntructorMapper intructorMapper;
	@Autowired
	IntructorService intructorService;
	@Autowired
	UploadService uploadService;
	@Autowired
	EnrollmentMapper enrollmentMapper;
	@GetMapping("/intructor/register")
	private void register() {
		
	}
	@PostMapping("/intructor/register_action")
	private String register_action(Model model,  MultipartFile file, InstructorDto instructorDto, HttpSession session) {
		System.out.println("첨부파일이 잘 수집 되었는지 확인");
		System.out.println(file.getOriginalFilename());
		int seq = uploadService.getSeq();
		System.out.println(file.getName());
		uploadService.insertUpload(file, seq);
		instructorDto.setFile_id(seq);
		System.out.println("intructor : " + instructorDto);
		int res1 = intructorMapper.insert(instructorDto);
		
		if(res1>0) {
			session.setAttribute("instructor_id", instructorDto.getInstructor_id());

			int instructorId = instructorDto.getInstructor_id();
			model.addAttribute("msg", "등록되었습니다");
			model.addAttribute("redirect", "/input?instructor_id=" + instructorId); // ✅ 리디렉트 경로 전달
		}else {
			model.addAttribute("msg", "등록 실패했습니다");
			model.addAttribute("redirect", "/intructor/register");
		}
		return "/common/msgbox2";
	}
	@GetMapping("/intructorlist")
	public String intructorList(@RequestParam("cateId") int cateId, Model model) {
		List<InstructorDto> list = intructorMapper.getInstructorsByMainCategory(cateId);
	    model.addAttribute("list", list);
	    model.addAttribute("cateId", cateId);
	    return "/edu/intructorlist";
	}

	@GetMapping("/intructor/detail")
	public String detail(@RequestParam("id") int id, Model model, HttpSession session) {
	    InstructorDto dto = intructorMapper.findById(id);
	    System.out.println("dto : " +dto);
	    if (dto == null) {
	        model.addAttribute("msg", "해당 강사를 찾을 수 없습니다.");
	        return "/common/msgbox";
	    }

	    model.addAttribute("instructor", dto);
	    boolean isLogein = session.getAttribute("loginMember") != null;
	    System.out.println("detail 컨트롤러: isLogein = " + isLogein);
	    model.addAttribute("isLogein", isLogein);
	    return "/edu/detail";
	}
	@PostMapping("/subscribe")
	@ResponseBody
	public Map<String, Object> subscribe(@RequestParam("instructor_id") int instructor_id, HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
		System.out.println("loginMember : " + loginMember);
		if(loginMember == null) {
			result.put("success", false);
			result.put("msg", "로그인이 필요합니다");
			result.put("redirect", "/login1");
			
			return result;
		}
		 InstructorDto instructor = intructorService.getInstructorById(instructor_id);
		    if(instructor == null) {
		        result.put("success", false);
		        result.put("msg", "존재하지 않는 강사입니다.");
		        return result;
		    }
		EnrollmentDto dto = new EnrollmentDto();
		dto.setUser_id(loginMember.getUser_id());
		dto.setInstructor_id(instructor_id);
		dto.setStatus(EnrollmentStatus.ONGOING);
		dto.setEnrolled_at(LocalDateTime.now().withNano(0));
		
		
		
		dto.setLevel(instructor.getLevel());
	    dto.setPrice(instructor.getPrice());
		
		enrollmentMapper.insertEnrollment(dto);
		
		result.put("success", true);
		result.put("msg", "구독이 완료되었습니다");
		result.put("redirect", "/intructor/detail?id=" + instructor_id);
		
		return result;
	}
	

}
