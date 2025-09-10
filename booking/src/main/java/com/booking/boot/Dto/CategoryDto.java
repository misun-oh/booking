package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {

	private int category_id;
	private int course_id;
	private String name;
	private int parent_id;
	private String title;
}
