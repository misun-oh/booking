package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.CourseDto;
import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.CourseMapper;

@Service
public class CourseService {

	@Autowired
	CourseMapper courseMapper;
	@Autowired
	UploadService uploadService;
	
	public void getList(Model model, SearchDto searchDto) {
		List<CourseDto> list = courseMapper.getList(searchDto);
		System.out.println("list : " + list);
		int totalCnt = courseMapper.getTotalCount(searchDto);
		
		PageDto pageDto = new PageDto(searchDto, totalCnt);
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
	}
	
	public boolean insertCourse(CourseDto courseDto, MultipartFile file) {
		int res = 0;
		try {
			if(!file.isEmpty()) {
				int file_id = uploadService.getSeq();
				int file_upload_res = uploadService.insertUpload(file, file_id);
						
				courseDto.setImg(file_id +"");
			}
			res = courseMapper.insertCourse(courseDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? true:false;
	}
}
