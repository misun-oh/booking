package com.booking.boot.Dto;

import java.io.ObjectInputFilter.Status;

import org.hibernate.annotations.CurrentTimestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnrollmentDto {

	private int enrollment_id;
	private int course_id;
	private int user_id;
	private EnrollmentStatus status;
	private CurrentTimestamp enrollment_at;
}
