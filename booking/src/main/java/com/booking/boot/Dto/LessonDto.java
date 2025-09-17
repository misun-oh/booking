package com.booking.boot.Dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonDto {
	
	private int lesson_id;
	private int course_id;
	private int file_id;
	private String lesson_name;
	private String lesson_order;
	private String lesson_explan;
	private LocalDateTime fix_time;
	private LocalDateTime delete_time;
	private LocalDateTime registration_time;

}
