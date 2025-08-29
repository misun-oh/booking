package com.booking.boot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.booking.boot.Dto.ReDataDto;

public interface ReDataMapper {
	@Insert("INSERT INTO RE_DATA (RE_ID, RE_NAME, RE_PHONE, RE_CHECKIN, RE_CHECKOUT, RE_NIGHTS, RE_PRICE) "
			+ "VALUES (RE_SEQ.NEXTVAL, 'aa', 'sss',\r\n"
			+ "  TO_DATE('2025-09-05', 'YYYY-MM-DD'),\r\n"
			+ "  TO_DATE('2025-09-08', 'YYYY-MM-DD'),\r\n"
			+ "  3, 600000)")


	int getView(@Param("redata")ReDataDto redata);
}
