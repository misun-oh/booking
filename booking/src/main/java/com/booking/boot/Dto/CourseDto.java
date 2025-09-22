package com.booking.boot.Dto;

import java.math.BigDecimal;
import java.security.Timestamp;

import jakarta.websocket.Decoder.Text;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseDto {
	private int course_id;
	private int instructor_id;
	private String title ;
	private String description;
	private Timestamp created_at;
	private BigDecimal price;
	private CourseLevel level;
	private int category_id;
	private String img;
	private int file_id;
	private int attach_idx   ;
}
