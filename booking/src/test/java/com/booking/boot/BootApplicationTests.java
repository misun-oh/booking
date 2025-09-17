package com.booking.boot;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.booking.boot.Dto.CategoryDto;
<<<<<<< HEAD
import com.booking.boot.Dto.IntructorDto;
=======
import com.booking.boot.Dto.CategoryDto2;
import com.booking.boot.Dto.InstructorDto;
import com.booking.boot.Dto.LessonDto;
import com.booking.boot.Dto.UploadDto;
>>>>>>> branch 'main' of https://github.com/misun-oh/booking.git
import com.booking.boot.entity.User;
import com.booking.boot.mapper.Category2Mapper;
import com.booking.boot.mapper.CategoryMapper;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.mapper.UploadMapper;
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
	@Autowired
	Category2Mapper cat2;
	
	
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

	@Test
	public void test() {
		InstructorDto intructorDto = new InstructorDto();
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