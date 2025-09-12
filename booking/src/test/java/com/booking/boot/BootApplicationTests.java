package com.booking.boot;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.LessonDto;
import com.booking.boot.entity.User;
import com.booking.boot.mapper.CategoryMapper;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.mapper.UploadMapper;
import com.booking.boot.mapper.LessonMapper;
import com.booking.boot.repository.UserRepository;

@SpringBootTest
class BootApplicationTests {

	@Autowired
	UserRepository userRepository;
	@Autowired
	IntructorMapper mapper;
	@Autowired
	UploadMapper up2;
	@Autowired
	CategoryMapper cM;
	
	@Test
	public void test4() {
		up2.updateSeq();
		
		List<CategoryDto> res = cM.getCategoryList();
		System.out.println("****"+res);
	}
	
	@Test
	public void test3() {
		up2.updateSeq();
		
		int res = up2.selectSeq();
		System.out.println(res);
		
	}
	
	@Autowired
	LessonMapper lm;
	
	@Test
	public void test2() {
		LessonDto lesson = new LessonDto();
		lesson.setLesson_id(1);
		lesson.setLesson_title("title");
		lesson.setLesson_page("page");
		lesson.setLesson_order(4);
		lesson.setLesson_detail("detail");
		lesson.setVideo_url("url");
		
		int insert = lm.insert(lesson);
		System.out.println(insert);
		
	}
	
	@Test
	public void test() {
		IntructorDto intructorDto = new IntructorDto();
		intructorDto.setName("name");
		intructorDto.setWord("word");
		
		int insert = mapper.insert(intructorDto);
		System.out.println(insert);
	}
	@Test
	public void contextLoads() {
		User u = User.builder().setUsername("momo").setPassword("1234").build();
		userRepository.save(u);
	}

}
