package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.RoomDto;

public interface BookingMapper {
	
	@Select("select * from room")
	List<RoomDto> list();
}
