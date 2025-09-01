package com.booking.boot.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReDataDto {

    private Integer reid;           // null 가능
    private Integer re_id;           // null 가능
    private String name = "";       // 기본값 설정
    private String phone = "";
    private String checkin = "";
    private String checkout = "";
    private Integer nights = 0;
    private Integer price = 0;
}
