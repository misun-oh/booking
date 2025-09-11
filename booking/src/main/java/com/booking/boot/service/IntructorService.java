package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.mapper.UploadMapper;

@Service
public class IntructorService {

	@Autowired
	IntructorMapper intructorMapper;
	@Autowired
	UploadService uploadService;
	
	public void getList(Model model, SearchDto searchDto) {
		List<IntructorDto> list = intructorMapper.getList(searchDto);
		System.out.println("list : " + list);
		int totalCnt = intructorMapper.getTotalCount(searchDto);
		
		PageDto pageDto = new PageDto(searchDto, totalCnt);
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
	}
}
