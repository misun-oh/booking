package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.CategoryDto;
import com.booking.boot.Dto.CategoryDto2;

public interface Category2Mapper {

	List<CategoryDto2> selectCategory();
	List<CategoryDto2> findByParentId(@Param("parentId") int parentId);
}
