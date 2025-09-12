package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.CategoryDto;

@Mapper
public interface CategoryMapper {

	
	
	@Select("SELECT * FROM category ORDER BY parent_id, id")
	List<CategoryDto> getCategoryList();
}
