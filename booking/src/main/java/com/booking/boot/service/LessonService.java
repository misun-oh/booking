package com.booking.boot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.boot.mapper.LessonMapper;

@Service
public class LessonService {

	@Autowired
	LessonMapper lessonM;
	
	@Autowired
	UploadService uploadS;
	
	
}


