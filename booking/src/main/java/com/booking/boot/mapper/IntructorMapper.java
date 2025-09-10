package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.IntructorDto;
import com.booking.boot.Dto.SearchDto;


public interface IntructorMapper {
 
	List<IntructorDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto searchDto);
	int insert(IntructorDto instructorDto); 
}
