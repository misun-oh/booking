package com.booking.boot.Dto;

import java.io.ObjectInputFilter.Status;
import java.math.BigDecimal;
import java.time.LocalDateTime;

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
	private int instructor_id;
	private EnrollmentStatus status;
	private LocalDateTime enrolled_at;
	private CourseLevel level;
	private BigDecimal price;
}
