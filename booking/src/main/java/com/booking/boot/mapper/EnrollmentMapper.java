package com.booking.boot.mapper;

import java.util.List;

import com.booking.boot.Dto.EnrollmentDto;
import com.booking.boot.Dto.SearchDto;

public interface EnrollmentMapper {
	int insertEnrollment(EnrollmentDto enrollmentDto);
	List<EnrollmentDto> getList(SearchDto searchDto);
	int getTotalCount(SearchDto search);
}
