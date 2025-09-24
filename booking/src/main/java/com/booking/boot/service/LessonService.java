package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.mapper.LessonMapper;

@Service
public class LessonService {

	@Autowired
	LessonMapper lessonM;
	
	public List<LessonDto> getLessonsByInstructorId(int instructorId) {
	    return lessonM.getLessonsByInstructorId(instructorId);
	}
}


