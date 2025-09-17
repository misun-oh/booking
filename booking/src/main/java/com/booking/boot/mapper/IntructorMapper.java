package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.InstructorDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.Dto.UploadDto;


public interface IntructorMapper {
 
	List<InstructorDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	int insert(InstructorDto intructorDto); 
	InstructorDto findById(@Param("instructor_id") int instructor_id);
	List<InstructorDto> selectByMainCategory(@Param("cateId") int cateId);
	List<InstructorDto> getInstructorsByMainCategory(int categoryId);
}
