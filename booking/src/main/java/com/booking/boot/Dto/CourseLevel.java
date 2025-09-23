package com.booking.boot.Dto;

public enum CourseLevel {
	
	beginner("초급"), 
	intermediate("중급"), 
	advanced("고급");
	
	private final String label;
	
	CourseLevel(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
