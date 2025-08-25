package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.SearchDto;
import com.booking.boot.Dto.UploadDto;


public interface UploadMapper {
	
	int insertUpload(UploadDto dto);
	
	// 매개변수가 2개 이상인경우 @param 속성을 지정 해야함!
	List<UploadDto> selectList(SearchDto search);

	int getTotalCnt(SearchDto search);

	UploadDto getFile(UploadDto dto);
	
	int getSeq();
}
