package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.mapper.CategoryMapper;

@Controller
public class CategoryController {
	
	@Autowired
	public CategoryMapper cM;
	

	  
   @GetMapping("/header2")  // URL 매핑
   public String header(Model model) {
        List<CategoryDto> list = cM.getCategoryList();
        model.addAttribute("categoryList", list);  // ★ JSP에서 사용할 수 있도록 전달
        return "/edu/header2";  // /WEB-INF/views/header.jsp 로 이동
    }

}
