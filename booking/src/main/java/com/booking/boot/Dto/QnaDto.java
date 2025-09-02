package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {

	private int qna_id        ;
	private String title      ;
	private String content    ;
	private String writer     ;
	private String email      ;
	private String password   ;
	private String created_at ;
    
}