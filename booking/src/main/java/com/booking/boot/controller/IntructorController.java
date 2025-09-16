package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.service.IntructorService;
import com.booking.boot.service.UploadService;

@Controller
public class IntructorController {
	@Autowired
	IntructorMapper intructorMapper;
	@Autowired
	IntructorService intructorService;
	@Autowired
	UploadService uploadService;
	@GetMapping("/intructor/register")
	private void register() {
		
	}
	@PostMapping("/intructor/register_action")
	private String register_action(Model model,  MultipartFile file, IntructorDto intructorDto) {
		System.out.println("첨부파일이 잘 수집 되었는지 확인");
		System.out.println(file.getOriginalFilename());
		int seq = uploadService.getSeq();
		System.out.println(file.getName());
		int res = uploadService.insertUpload(file, seq);
		intructorDto.setFile_id(seq);
		System.out.println("intructor : " + intructorDto);
		int res1 = intructorMapper.insert(intructorDto);
		
		if(res1>0) {
			
			model.addAttribute("msg", "등록되었습니다");
			
		}else {
			model.addAttribute("msg", "등록 실패했습니다");
			
		}
		return "/common/msgbox2";
	}
	@GetMapping("/intructorlist")
	public String intructorList(@RequestParam("cateId") int cateId, Model model) {
		List<IntructorDto> list = intructorMapper.getInstructorsByMainCategory(cateId);
	    model.addAttribute("list", list);
	    model.addAttribute("cateId", cateId);
	    return "/edu/intructorlist";
	}

	@GetMapping("/intructor/detail")
	public String detail(@RequestParam("id") int id, Model model) {
	    IntructorDto dto = intructorMapper.findById(id);

	    if (dto == null) {
	        model.addAttribute("msg", "해당 강사를 찾을 수 없습니다.");
	        return "/common/msgbox";
	    }

	    model.addAttribute("intructor", dto);
	    return "/edu/detail";
	}

}
