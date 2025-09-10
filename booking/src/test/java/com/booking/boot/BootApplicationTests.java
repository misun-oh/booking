package com.booking.boot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.entity.User;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.repository.UserRepository;

@SpringBootTest
class BootApplicationTests {

	@Autowired
	UserRepository userRepository;
	@Autowired
	IntructorMapper mapper;
	
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
