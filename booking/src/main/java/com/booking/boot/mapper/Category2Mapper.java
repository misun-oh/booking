package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.Dto.CategoryDto2;
import com.booking.boot.Dto.SearchDto;

public interface Category2Mapper {

	List<CategoryDto2> selectCategory(SearchDto searchDto);
	List<CategoryDto2> findByParentId(@Param("parent_id") int parent_id);
	
}
