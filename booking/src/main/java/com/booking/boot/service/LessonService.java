package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.LessonDto;
import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.LessonMapper;

@Service
public class LessonService {

	@Autowired
	LessonMapper lessonM;
	
	@Autowired
	UploadService uploadS;
	/*
	public void getList(Model model, SearchDto search) {
		
		List<LessonDto> list = lessonM.getList(search);
		System.out.println("list : " + list);
		int totalCount = lessonM.getTotalCount(search);
		
		PageDto page = new PageDto(search, totalCount);
		model.addAttribute("list", list);
		model.addAttribute("page", page);

	}
	
	public boolean insertLesson(LessonDto lessonD, MultipartFile file) {
		
		int res = 0;
		
		try {
			if(!file.isEmpty()) {
				int file_id = uploadS.getSeq();
				int file_upload_res = uploadS.insertUpload(file, file_id);
				
				lessonD.setFile_id(file_id);
			}
			res = lessonM.insert(lessonD);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? true : false;
	}
	*/
}


