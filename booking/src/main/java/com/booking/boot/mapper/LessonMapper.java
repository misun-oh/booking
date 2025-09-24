package com.booking.boot.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.LessonDto;

public interface LessonMapper {
	
	List<LessonDto> getList();
	List<LessonDto> getLessonsByInstructorId(int instructorId);
	int getTotalCount();
	int insert(LessonDto lesson);
	LessonDto findById(@Param("lesson_id") int lesson_id);
	int updateLesson(LessonDto lesson);
	int deleteLesson(@Param("lesson_id") int lesson_id, @Param("delete_time") LocalDateTime delete_time);
}
