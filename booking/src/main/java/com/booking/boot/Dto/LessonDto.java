package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonDto {
	
	private int lesson_id;
	private String lesson_title;
	private String video_url;
	private int lesson_order;
	private String lesson_detail;
	private String lesson_page;
	
}
