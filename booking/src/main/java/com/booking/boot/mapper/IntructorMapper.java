package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.Dto.UploadDto;


public interface IntructorMapper {
 
	List<IntructorDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	int insert(IntructorDto intructorDto); 
}
