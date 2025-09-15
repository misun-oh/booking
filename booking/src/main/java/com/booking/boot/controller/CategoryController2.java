package com.booking.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.boot.Dto.CategoryDto2;
import com.booking.boot.mapper.Category2Mapper;

@Controller
public class CategoryController2 {

	@Autowired
	private Category2Mapper mapper;
	
	@GetMapping("/category/select")
	public String showCategory(Model model) {
		List<CategoryDto2> topCategory = mapper.selectCategory();
		model.addAttribute("categoryList", topCategory);
		return "/edu/categorySelect";
	}
	@GetMapping("/category/sub")
	@ResponseBody
	public List<CategoryDto2> getSubCategories(@RequestParam("parentId") int parentId) {
	    return mapper.findByParentId(parentId);
	}

}
