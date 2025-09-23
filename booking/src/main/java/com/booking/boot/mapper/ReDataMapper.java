package com.booking.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.booking.boot.Dto.ReDataDto;

public interface ReDataMapper {
	
    // 예약 정보 등록
    @Insert("INSERT INTO RE_DATA (RE_ID, RE_NAME, RE_PHONE, RE_CHECKIN, RE_CHECKOUT, RE_NIGHTS, RE_PRICE) "
          + "VALUES (RE_SEQ.NEXTVAL, #{name,jdbcType=VARCHAR}, #{phone,jdbcType=VARCHAR}, "
          + "TO_DATE(#{checkin,jdbcType=VARCHAR}, 'YYYY-MM-DD'), "
          + "TO_DATE(#{checkout,jdbcType=VARCHAR}, 'YYYY-MM-DD'), "
          + "#{nights,jdbcType=INTEGER}, #{price,jdbcType=INTEGER})")
    @Options(useGeneratedKeys = true, keyProperty = "reid", keyColumn = "RE_ID")
    int insertReData(ReDataDto redata);

    // 예약 번호로 조회
    @Select("SELECT RE_ID as reid, RE_NAME as name, RE_PHONE as phone, "
    	      + "DATE_FORMAT(RE_CHECKIN, '%Y-%m-%d') as checkin, "
    	      + "DATE_FORMAT(RE_CHECKOUT, '%Y-%m-%d') as checkout, "
    	      + "RE_NIGHTS as nights, RE_PRICE as price "
    	      + "FROM RE_DATA WHERE RE_ID = #{reid}")
    ReDataDto findViewById(ReDataDto redata);

	
    // 전체 리스트 조회 (페이징 적용)
    @Select("SELECT * " +
            "FROM RE_DATA " +
            "ORDER BY RE_ID DESC " +
            "LIMIT #{start}, #{end}")
    List<ReDataDto> getList(@Param("start") int start, @Param("end") int end);

    // 전체 데이터 개수
    @Select("SELECT COUNT(*) FROM RE_DATA")
    int getTotalCount();
	
	
	
	

}
