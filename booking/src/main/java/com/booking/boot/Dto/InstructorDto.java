package com.booking.boot.Dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InstructorDto {
	private Integer instructor_id;
	private String img;
	private String word;
	private String name;
	private int file_id;
	private int attach_idx   ;
	private int category_id;
	private BigDecimal price;
	private String categoryName;
	private CourseLevel level;
}
