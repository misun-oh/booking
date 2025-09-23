package com.booking.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.booking.boot.Dto.MemberDto;
import com.booking.boot.Dto.PageDto;
import com.booking.boot.Dto.SearchDto;
import com.booking.boot.mapper.MemberMapper;



@Service
public class MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	UploadService uploadService;
	
	public boolean updateMember(Model model, MemberDto member) {
		int res = 0;
		// 쿼리 실행중 오류 발생시 예외처리 - 비정상적으로 종료되는것을 막기위해서... 
		try {
			// 1. 사용자 정보 업데이트
			res = memberMapper.updateMember(member);
			if(res > 0) {
				
				// 2. 권한 업데이트
				// 사용자의 권한을 모두 삭제
				memberMapper.deleteRoleAll(member);
				
				// 3. 사용자의 권한을 추가  
				// 권한 : 한명의 사용자가 여러개의 권한을 가질수 있으므로 배열
				for(String role : member.getRoles()) {
					memberMapper.addRole(member.getUser_id(), role);
				}
				
				// 메세지 출력후 상세화면으로 이동
				model.addAttribute("msg", "수정 되었습니다.");
				model.addAttribute("url", "/member/view/" + member.getUser_id());
			} else {
				model.addAttribute("msg", "수정 실패 - 관리자에게 문의해주세요");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "수정 중 예외가 발생 하였습니다.");
		}
		
		return res > 0 ? true : false;
	}
	
	/* 파일 업로드 추가 */
	public boolean insertMember(MemberDto member, MultipartFile file){
		int res = 0;
		
		try {
			// 첨부된 파일이 있으면 파일을 추가하고 memberDto에 file_id를 입력
			if(file != null && !file.isEmpty()) {
				// 파일업로드
				int file_id = uploadService.getSeq();
				int file_upload_res = uploadService.insertUpload(file, file_id);
	
				// 파일의 정보를 Member 테이블에 저장
				member.setProfile_image_url(file_id+"");
			}
			// 사용자 등록 입력
			res = memberMapper.insertMember(member);
			
			if(res > 0) {
				// 사용자 권한 등록
				res = memberMapper.insertRole(member);				
			}
						
		} catch (Exception e) {
			e.printStackTrace();	
		}
		
		return res > 0 ? true : false;
		
	}
	
	/*
	 * 등록가능한 아이디이면 true를 반환
	 */
	public boolean checkId(MemberDto member) {
		// 아이디가 member테이블에 등록되어 있는지 확인
		int res = memberMapper.checkId(member);
		
		// 등록 가능한 상태(res=0)이면 true, false
		return res > 0 ? false : true;
	}
	
	public boolean updateAccountLock(Model model, MemberDto member) {
		// 계정잠금/해제 처리
		int res = memberMapper.updateAccountLock(member);
		if(res > 0) {
			return true;
		} else {
			model.addAttribute("msg", "계정 잠금/해제 처리중 예외가 발생 하였습니다.");
			return false;
		}
		
	}
	
	// 수집된 파라메터를 이용하여 로그인 처리를 진행
	// model : 데이터 저장 - 화면에 전달
	// memberDto : 요청파라메터 
	public MemberDto login(MemberDto member){
		// 인증 : ID/PW가 일치하는 사용자가 있는지 조회
		// 사용자가 있으면 MemberDto객체를 반환, 없으면 null을 반환
		MemberDto loginMember = memberMapper.login(member);
		System.out.println("==================    " + loginMember);
		if(loginMember != null) {
			if("Y".equals(loginMember.getAccount_locked())) {
				// 로그인 실패로 계정이 잠긴 상태
				//model.addAttribute("msg", "계정이 잠긴 상태 입니다. 관리자에게 문의해주세요.");
				return null;
			}
			
			// ✨사용자의 권한✨을 조회 해서 MemberDto의 roles 필드에 추가 
			String[] roles = memberMapper.getRoles(member);
			loginMember.setRoles(roles);
			
			// 로그인 성공
			// 로그인 실패 카운트 초기화
			memberMapper.update_fail_count_reset(member);
			System.out.println("로그인 성공");
			//model.addAttribute("msg", "로그인 성공");
			// 로그인한 사용자의 정보
			//model.addAttribute("member", loginMember);
			return loginMember;
		} else {
			// 로그인 실패
			System.out.println("로그인 실패");
			// 로그인 실패 카운트 증가및 5회 이상시 계정 잠금
			memberMapper.update_fail_count(member);
			//model.addAttribute("msg", "아이디 비밀번호를 확인해주세요");
			return null;
		}
	}

	public void getList(Model model, SearchDto search) {
		List<MemberDto> list = memberMapper.getList(search);
		System.out.println("list=====================: " + list);
		int totalCnt = memberMapper.totalCnt(search);
		
		PageDto pageDto = new PageDto(search, totalCnt);
		// 화면에 전달
		// 리스트 출력
		model.addAttribute("list", list);
		// 페이지 블럭 출력
		model.addAttribute("pageDto", pageDto);
	}

	public boolean getMember(Model model, MemberDto member) {
		// 사용자 조회
		member = memberMapper.getMember(member);
		if(member != null) {
			// 권한 조회 - 배열
			String[] roles = memberMapper.getRoles(member);
			member.setRoles(roles);
			
			// 화면에 보여줄 데이터를 내장객체의 영역에 저장
			model.addAttribute("member", member);
			return true;
		} else {
			model.addAttribute("msg", "아이디를 확인해주세요.");
			return false;			
		}
	}
}
