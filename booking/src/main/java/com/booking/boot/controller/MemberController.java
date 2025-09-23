package com.booking.boot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booking.boot.Dto.MemberDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.service.MemberService;

import jakarta.servlet.http.HttpSession;

/**
 * 1. 요청을 받는다
 * 		- 컨트롤러에 여러개의 요청 주소를 매핑 할수 있다
 * 2. 요청정보를 수집한다
 * 		- 매개변수에 객체를 받으면 자동으로 수집
 * 3. 화면에 전달할 데이터를 저장한다 
 * 		- Modle (내장객체-request의 영역에 데이터를 저장)
 * 4. redirect/forward를 간편하게 사용
 */
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	

	
	
	
	
	
	
	
	
	@PostMapping("/member/edit")
	private String edit(Model model, MemberDto member) {
		System.out.println("=========== member : " + member);
		
		// 사용자 정보 수정
		boolean res = memberService.updateMember(model, member);
		
		return "/common/msgbox";
	}
	@GetMapping("/member/edit/{user_id}")
	private String getEdit(Model model, MemberDto member) {
		System.out.println("=========== member : " + member);
		boolean res = memberService.getMember(model, member);
		if(res) {
			return "/member/edit";			
		} else {
			return "/common/msgbox";
		}
	}
	
	@GetMapping("/member/view/{user_id}")
	private String getView(Model model, MemberDto member) {
		System.out.println(member);
		// member객체를 조회 해서 내장객체의 영역에 담기!
		// 만약 사용자 정보가 조회가 안된다면 존재하지 않는 사용자입니다. 메세지 처리후 뒤로가기
		boolean res = memberService.getMember(model, member);
		if(res) {
			return "/member/view";			
		} else {
			return "/common/msgbox";
		}
	}
	
	
	@GetMapping("/member/checkId")
	@ResponseBody
	private Map<String, Object> checkId(MemberDto member) {
		Map<String, Object> map;
		System.out.println("member : " + member);
		boolean res = memberService.checkId(member);
		
		if(res) {
			map = Map.of("res", res);
		} else {
			map = Map.of("res", res, "msg", "사용중인 아이디 입니다."); 
		}
		
		return map;
	}
	
	// 등록 화면 이동
	@GetMapping("/member/register")
	private void register() {
		
	}

	// 등록 처리
	// 첨부파일 등록 / 다운로드 
	@PostMapping("/member/register_action")
	private String register_action(Model model, MemberDto member,  MultipartFile file) {
		System.out.println("첨부파일이 잘 수집 되었는지 확인");
		
		System.out.println("member : " + member);
		if(file != null && !file.isEmpty()) {
			System.out.println("file : " + file.getOriginalFilename());
			
		}else {
			System.out.println("첨부파일이 없습니다");
		}
		// 파라메터 수집 확인
		// null : 필드와 일치하는 name속성이 없는경우
		// '' : 입력을 안한것
		
		// 데이터베이스에 등록
		boolean res = memberService.insertMember(member, file);
		if(res) {
			// void : /member/register_action.jsp
			// String : 보여주고 싶은 화면의 경로
			// 등록성공 - 메세지 처리후 리스트로 이동
			model.addAttribute("msg", "등록 되었습니다.");
			model.addAttribute("url", "/member/list");

		} else {
			// 등록실패 - 메세지 처리후 이전페이지
			model.addAttribute("msg", "등록중 예외가 발생하였습니다.");
			
			
		}
		return "/common/msgbox";
		
	}
	
	@PostMapping("/member/logout")
	private String logout(HttpSession session) {
		// 세션 무효화 처리
		session.invalidate();
		System.out.println("로그아웃");
		
		return "redirect:/member/login"; // 클라이언트(웹브라우저)에게 /member/login 요청을 다시 하라고 전달 
	}
	
	// SearchDto : 페이징및 검색 파라메터 수집
	@GetMapping("/member/list")
	private void getList(Model model, SearchDto search){
		// 리스트 조회 화면에 전달
		memberService.getList(model, search);
	}
	
	
	//값이 하나인 경우 value= 생략가능 (기본값)
	@GetMapping("/member/login")
	private void login() {
		// 반환값이 없는경우 요청 경로에 해당하는 jsp를 반환
	}
	
	// 요청경로와 페이지경로가 다른경우
	// 반환타입을 String으로 하고, jsp파일의 경로를 반환
	@PostMapping(value="/login/loginAction")
	private String loginAction(HttpSession session, String user_id, String user_pw) {
		System.out.println("user_id : " + user_id);
		System.out.println("user_pw : " + user_pw);
		session.setAttribute("user_id", user_id);

		return "member/main";
	}
	
	// 요청경로와 페이지경로가 다른경우
	// 반환타입을 String으로 하고, jsp파일의 경로를 반환
	// Model : 화면에 데이터를 전달!!
	@PostMapping(value="/login/loginAction_dto")
	private String loginAction_dto(Model model, HttpSession session, MemberDto member, RedirectAttributes rttr) {
		System.out.println("memberdto =========================== " + member);
		// 로그인 처리
		// 화면전환
		MemberDto loginMember = memberService.login(member);
		
		if(loginMember != null) {
			
			//MemberDto loginMember = memberService.login(member);
			session.setAttribute("user_id", loginMember.getUser_id());
			// 세션에 멤버 객체 저장
			session.setAttribute("member", loginMember);
			System.out.println("로그인된 사용자: " + session.getAttribute("member"));
			// 로그인 성공
			// 세션에 저장 -> main으로 이동
			//return "redirect:member/main";
			
			// /로 시작 하지 않으면 기존 요청 경로를 포함 ✨주의✨가 필요
			// member/main -> /login/member/main 
			// /member/main -> /member/main
			return "/main";
		} else {
			// 로그인 실패
			// 메세지 처리 -> 로그인 페이지로 이동
			// ✨ forward시 요청메서드가 달라지므로 오류가 발생 -> 요청메서드가 달라지는 경우 redirect처리
			
			// session영역에 임시로 데이터를 보관
			// 오류 메세지를 화면에 출력 하기 위해 저장
			rttr.addFlashAttribute("msg", model.getAttribute("msg"));
			// 사용자가 입력한 아이디를 화면에 출력하기 위해 저장
			rttr.addFlashAttribute("user_id", member.getUser_id());
			rttr.addAttribute("msg", model.getAttribute("msg"));
			return "redirect:/member/login";
		}
		
	}
	
	//  PathVariable : 요청경로로부터 파라메터를 수집
	// 변수이름과 파라메터 이름이 같은경우 @PathVariable
	// 변수이름과 파라메터 이름이 다른경우 @PathVariable("id")
	@GetMapping("/member/get/{id}")
	private String getUserId(@PathVariable("id") String user_id ) {
		System.out.println("id : " + user_id);
		// TODO Auto-generated method stub
		return "member/main";
	}
	
	@GetMapping("/member/ge/{id}")
	private String getUser111(@PathVariable("id") String user_id ) {
		System.out.println("id : " + user_id);
		// TODO Auto-generated method stub
		return "member/main";
	}
	
	// 계정잠금/해제 처리
	//@GetMapping("/member/accountlock/{user_id}/{account_locked}")
	public String accountlock(Model model, MemberDto member){
		// 파라메터 수집 확인
		System.out.println("member : " + member);
		boolean res = memberService.updateAccountLock(model, member);
		
		if(res) {
			// 성공
			return "redirect:/member/list";
			
		} else {
			// 실패 -> msgbox : msg를 모달로 띄워주고 뒤로가기또는 url로 이동
			// 메세지 처리후 뒤로가기
			return "/common/msgbox";
		}
		// 리스트를 다시 조회 해서 화면에 데이터를 전달할 수 있도록 처리
	}
	
	// 계정 잠금/해제 처리를 fetch를 이용해서 처리
	@GetMapping("/member/accountlock/{user_id}/{account_locked}")
	@ResponseBody
	public Map<String, Object> accountlock_fetch(Model model, HttpSession session, MemberDto member){
		Map<String, Object> map;
		// 로그인한 사용자의 어드민 권한이 있는경우에만 호출 할 수 있도록
		if(session.getAttribute("member")!=null) {	// 로그인 체크
			MemberDto loginMember = (MemberDto)session.getAttribute("member");
			if(loginMember.hasRole("ADMIN")) {		// ADMIN 권한체크
				boolean res = memberService.updateAccountLock(model, member);
				if(res) {							// 서비스 실행 결과 체크
					// 계정잠금의 결과를 map에 담아서 화면에 전달
					map = Map.of("res", res);					
				} else {
					map = Map.of("res", res, 
								"msg", "계정 잠금/해제중 예외 사항이 발생 하였습니다.",
								"title", "계정 잠금/해제");
				}
				return map;
			} 
		}
		
		// 권한이 없거나 계정잠금에 실패한 경우
		map = Map.of("res", false, 
					"msg", "계정 잠금/해제 실패 - 권한 없음",
					"title", "계정 잠금/해제");
		return map;
		
	}
	
	
	
	@GetMapping("/fetch")
	@ResponseBody // 화면이 아닌 객체를 Json형식 파일(문자열)로 전달 
	private Map<String, String> fetch() {
		//return new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "오미자");
		map.put("age", "20");
		
		// 맵을 간단하게 생성하는 방법 - 불변, 10개까지
		Map<String, String> mapOf = Map.of("name", "오미자"
											, "age", "25");
		
		return mapOf;
	}
	
	
}
