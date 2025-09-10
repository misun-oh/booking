package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.Dto.CourseDto;
import com.booking.boot.Dto.SearchDto;

public interface EducationMapper {
	List<CourseDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	List<CategoryDto> getSubCategory(SearchDto searchDto);
}
