package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.Dto.SearchDto;

public interface LessonMapper {

	List<LessonDto> getList(SearchDto search);
	int getTotalCount(SearchDto search);
	int insert(LessonDto lesson);
}
