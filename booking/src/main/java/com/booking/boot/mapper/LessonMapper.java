package com.booking.boot.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.LessonDto;

public interface LessonMapper {

	List<LessonDto> getList();
	int getTotalCount();
	int insert(LessonDto lesson);
	LessonDto findById(@Param("lesson_id") int lesson_id);
}
