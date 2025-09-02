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
    private String re_name;
    private String phone = "";
    private String re_phone;
    private String checkin = "";
    private String re_checkin;
    private String checkout = "";
    private String re_checkout;
    private Integer nights = 0;
    private Integer re_nights;
    private Integer price = 0;
    private Integer re_price;
}
