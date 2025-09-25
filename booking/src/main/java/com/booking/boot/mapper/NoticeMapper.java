package com.booking.boot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface NoticeMapper {

	@Insert("INSERT INTO notice (title, content) VALUES (#{title}, #{content})")
	int insert(@RequestParam String title, @RequestParam String content);
}
