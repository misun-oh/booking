package com.booking.boot.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.mapper.LessonMapper;

@Service
public class LessonService {

	@Autowired
	LessonMapper lessonM;
	
	public int insert(LessonDto lesson) {
		
		return lessonM.insert(lesson);
	}

}
