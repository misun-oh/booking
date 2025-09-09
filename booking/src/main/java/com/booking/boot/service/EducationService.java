package com.booking.boot.service;

import java.util.HashMap;
import java.util.Map;

import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.EducationMapper;

import lombok.AllArgsConstructor;
@AllArgsConstructor
public class EducationService {
	
	public final EducationMapper mapper;
	
	public Map<String, Object> getlist(SearchDto searchDto){
		System.out.println(searchDto);
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.getList(searchDto));
		int totalItems = mapper.getTotalCount(searchDto);
		System.out.println(totalItems);
		map.put("pageDto", new PageDto(searchDto, totalItems));
		
		return map;
	}
}
