package com.booking.boot.Dto;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class lessonDto {

	private int lesson_id;
	private String lesson_name;
	private int lesson_No;
	private String video_url;
}