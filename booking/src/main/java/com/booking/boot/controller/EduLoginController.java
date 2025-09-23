package com.booking.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.booking.boot.Dto.MemberDto;
import com.booking.boot.mapper.MemberMapper;

import jakarta.servlet.http.HttpSession;



@Controller
public class EduLoginController {

	@Autowired
	MemberMapper memberMapper;
	
	@PostMapping("/eduLogin")
	private String edulogin(Model model, MemberDto member, HttpSession session) {
		// 로그인 버튼 클릭시 서버에 요청
		System.out.println("==" + member);
		/* DB 조회
		 1. 테이블 확인
		 2. 매퍼 생성
		 3. 로그인 정보 조회
		*/
	
		MemberDto loginMember =  memberMapper.getMember(member);
		System.out.println("==" + loginMember);

		String[] r = memberMapper.getRoles(loginMember);
		
		loginMember.setRoles(r);
		
		
		// 로그인이 성공되면 main 이동, 실패하면 back(다시 로그인 화면)
		if(loginMember != null
				 && loginMember.getPassword().equals(member.getPassword())) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/main";
			
		} else {
			model.addAttribute("msg", "로그인 실패");
			return "/common/msgbox";
		}
	}
	
	@GetMapping("/edulogout")
	private String edulogout(HttpSession session) {
		// 세션 무효화 처리
		session.invalidate();
		System.out.println("로그아웃");
		
		return "redirect:/login1"; // 클라이언트(웹브라우저)에게 /member/login 요청을 다시 하라고 전달 
	}
}
