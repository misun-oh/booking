package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IntructorDto {
	private int instructor_id;
	private String img;
	private String word;
	private String name;
	private Integer file_id;
}
