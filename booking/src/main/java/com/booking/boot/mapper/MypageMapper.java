package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.QnaDto;
import com.booking.boot.Dto.SearchDto;

public interface MypageMapper {
	
	@Select("""
			select * from qna
			ORDER BY created_at DESC 
			OFFSET (#{pageNo} - 1) * #{amount} ROWS FETCH NEXT #{amount} ROWS ONLY
			""")
	List<QnaDto>  myPage(SearchDto searchDto);
	
	@Select("select count(*) from qna")
	int  myPage2();
}
