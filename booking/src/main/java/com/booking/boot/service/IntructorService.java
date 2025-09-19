package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.CourseDto;
import com.booking.boot.Dto.InstructorDto;
import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.Dto.UploadDto;
import com.booking.boot.mapper.CourseMapper;
import com.booking.boot.mapper.IntructorMapper;
import com.booking.boot.mapper.UploadMapper;

@Service
public class IntructorService {

	@Autowired
	IntructorMapper intructorMapper;
	@Autowired
	UploadService uploadService;
	@Autowired
	CourseMapper courseMapper;
	
	public void getList(Model model, SearchDto searchDto) {
		List<InstructorDto> list = intructorMapper.getList(searchDto);
		System.out.println("list : " + list);
		int totalCnt = intructorMapper.getTotalCount(searchDto);
		
		PageDto pageDto = new PageDto(searchDto, totalCnt);
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
	}
	
	public boolean insertIntructor(InstructorDto instructorDto, MultipartFile file ) {
		int res = 0;
		
		try {
			if(!file.isEmpty()) {
				int file_id = uploadService.getSeq();
				int file_upload_res = uploadService.insertUpload(file, file_id);
				
				instructorDto.setImg(file_id+"");
				
			}
			res = intructorMapper.insert(instructorDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? true:false;
	}
	public List<InstructorDto> getListByMainCategory(int cateId) {
	    return intructorMapper.selectByMainCategory(cateId);
	}
	
	public boolean insertCourse(CourseDto courseDto, MultipartFile file) {
		int res = 0;
		
		try {
			if(!file.isEmpty()) {
				int course_id = uploadService.getSeq();
				int course_upload_res = uploadService.insertUpload(file, course_id);
				
				courseDto.setImg(course_id+"");
			}
			res = courseMapper.insertCourse(courseDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? true:false;
	}
	

}
