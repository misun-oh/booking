package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {

	private int notice_id   ;
	private String title       ;
	private String content     ;
	private String writer      ;
	private String created_at  ;
	private int view_count  ;
	
	
	
}
