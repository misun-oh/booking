package com.booking.boot.Dto;

import java.util.Arrays;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
    
	/*
	 * 필드의 경우 타입의 초기값 (null, 0, 0.0, false)
	 */
	private String user_id             ;
	private String username            ;
	private String password            ;
	private String email               ;
	private String phone_number        ;
	private String profile_image_url   ;
	private String created_at          ;
	private String last_login_at       ;
	private int login_fail_count       ;
	private String account_locked      ;
	private String[] roles             ;
	
	// 권한이 있는지 확인하는 메서드
	public boolean hasRole(String role) {
		System.out.println("role : " + role); // 요청 권한
		System.out.println("roles : " + Arrays.toString(roles)); // 로그인한 사용자의 권한 목록
		// 리스트로 변환후 contains메서드를 이용해서 권한이 있는지 확인
		return Arrays.asList(roles).contains(role);
	}
 
}
