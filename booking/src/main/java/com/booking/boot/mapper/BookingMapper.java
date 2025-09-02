package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.QnaDto;
import com.booking.boot.Dto.RoomDto;
import com.booking.boot.Dto.SearchDto;

public interface BookingMapper {
	
	
	@Select("""
			select * from room
			ORDER BY room_no DESC 
			OFFSET (#{pageNo} - 1) * #{amount} ROWS FETCH NEXT #{amount} ROWS ONLY
			""")
	List<RoomDto>  list(SearchDto searchDto);
	
	@Select("select count(*) from room")
	int listCount();
	
	@Insert("INSERT INTO qna (TITLE, CONTENT, WRITER, EMAIL, PASSWORD ) "
			+ "VALUES (#{title }, #{content }, #{writer }, #{email }, #{password})")
	int qnaIns(QnaDto qna);
	

}


 