package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	private int num            ;
    private String title       ;
    private String content     ;
    private String id          ;
    private String postdate    ;
    private int visitcount     ;
}