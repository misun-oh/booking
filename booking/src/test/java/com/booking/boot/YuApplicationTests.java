package com.booking.boot;

import java.time.LocalDateTime;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.mapper.LessonMapper;

@SpringBootTest
public class YuApplicationTests {

	@Autowired
	LessonMapper lm;
	
	@Test
	public void test() {
		
		LessonDto lessonD = new LessonDto();
		
		lessonD.setLesson_id(1);
		lessonD.setCourse_id(2);
		lessonD.setLesson_name("title");
		lessonD.setLesson_order("number");
		lessonD.setLesson_explan("explan");
		lessonD.setFile_id(3);
		lessonD.setFix_time(new Date());
		lessonD.setDelete_time(new Date());
		
	}
}
