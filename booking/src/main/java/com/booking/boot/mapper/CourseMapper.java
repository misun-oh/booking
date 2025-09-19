package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.CourseDto;
import com.booking.boot.Dto.SearchDto;

public interface CourseMapper {

	List<CourseDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	int insertCourse(CourseDto courseDto);
}
