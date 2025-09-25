package com.booking.boot.Dto;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonDto {
	
	private Integer lesson_id;
	private int course_id;
	private Integer instructor_id;
	private int file_id;
	private String lesson_name;
	private String lesson_order;
	private String lesson_explan;
	private String rel_path;
	private String stored_name; 
	private Date fix_time;
	private Date delete_time;
	private Date registration_time;

}
