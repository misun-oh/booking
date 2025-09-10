package com.booking.boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	    public String getList(SearchDto searchDto, Model model) {
	        System.out.println("리스트 조회 컨트롤러 호출");
	        System.out.println("pageNo=" + searchDto.getPageNo());
	        System.out.println("amount=" + searchDto.getAmount());
	        System.out.println("categoryId=" + searchDto.getCategoryId());

	        try {
	            // 서비스에서 Map<String, Object>로 courseList, category, subCategoryList, pageDto 등을 리턴한다고 가정
	            Map<String, Object> map = educationService.getlist(searchDto);
	            System.out.println(map);

	            // JSP에 넘길 데이터 모델에 담기
	            model.addAttribute("courseList", map.get("courseList"));
	            model.addAttribute("category", map.get("category"));
	            model.addAttribute("subCategoryList", map.get("subCategoryList"));
	            model.addAttribute("pageDto", map.get("pageDto"));

	            // 뷰 이름 (JSP 경로)
	            return "course/list";  // /WEB-INF/views/course/list.jsp 로 forward
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("errorMessage", "코스 목록을 불러오는 데 실패했습니다.");
	            return "error"; // 에러 페이지 JSP
	        }
	    }
}
