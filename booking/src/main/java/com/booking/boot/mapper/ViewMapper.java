package com.booking.boot.mapper;

import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.ViewDto;

public interface ViewMapper {
	
	@Select("SELECT * FROM ROOM WHERE room_no=#{roomId}")
	ViewDto getView(int roomId);
}
