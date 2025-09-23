package com.booking.boot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface NoticeMapper {

	@Insert("insert into notice(title, contant)values(#{title}, #{content})")
	int insert(@RequestParam String title, @RequestParam String content);
}
