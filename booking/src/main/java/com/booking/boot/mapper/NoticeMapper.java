package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import com.booking.boot.Dto.NoticeDto;
import com.booking.boot.Dto.ReDataDto;

public interface NoticeMapper {

	@Insert("insert into notice(title, content, writer, created_at) values (#{title}, #{content}, 'admin', NOW())")
	int insert(@RequestParam String title, @RequestParam String content);
	
    // 전체 리스트 조회 (페이징 적용)
    @Select("SELECT * " +
            "FROM notice " +
            "ORDER BY notice_id DESC " +
            "LIMIT #{start}, #{end}")
    List<NoticeDto> getList(@Param("start") int start, @Param("end") int end);
    
    // 전체 데이터 개수
    @Select("SELECT COUNT(*) FROM notice")
    int getTotalCount();
	
}
