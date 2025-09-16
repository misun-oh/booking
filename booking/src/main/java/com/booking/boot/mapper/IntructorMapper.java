package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.Dto.UploadDto;


public interface IntructorMapper {
 
	List<IntructorDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	int insert(IntructorDto intructorDto); 
	IntructorDto findById(@Param("instructor_id") int instructor_id);
	List<IntructorDto> selectByMainCategory(@Param("cateId") int cateId);
}
