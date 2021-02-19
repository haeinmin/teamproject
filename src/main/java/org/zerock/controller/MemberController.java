package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	private MemberService service;

	@GetMapping("/home")
	public void home() {
	}
	
	// ##회원가입 - GET
	@GetMapping("/join")
	public void register() {
	}

	// ##회원가입 - POST
	@PostMapping("/join")
	public String register(MemberVO member, RedirectAttributes rttr) {
		
		Map<String, Boolean> errors = new HashMap<>();
		
		
		if (errors.isEmpty()) {
			service.register(member);
			return "redirect:/member/joinSuccess";
			

		} else {
			return "redirect:/member/join";
		}
		
	}
	// ##회원가입 - 아이디 중복 체크
	@GetMapping("/join/idDupCheck")
	@ResponseBody
	public String idDupCheck(String inputId) {
		
		//아이디 값 존재시
		log.info(inputId);
		
		if(inputId.equals("")) {
			return "-2";
		} else {
			MemberVO member = service.getMemberId(inputId);
			
			if(member == null) {
				return "0"; //회원 존재시 0
			} else {
				return "-1"; //회원 없다면 -1
			}
		}
	}
	
	
	
	// 회원가입 성공
	@GetMapping("/joinSuccess")
	public void joinSuccess() {
	}

	// 로그인 - GET방식
	@GetMapping("/login")
	public void login() {
	}

	// ##로그인 - POST방식
	@PostMapping("/login")	
	public String  login(String inputId, String inputPw, HttpSession session) {
		
		log.info(inputId);
		log.info(inputPw);
		
		MemberVO user = service.getMemberId(inputId);
		
		//아이디 일치 회원
		if(user != null && inputPw != null) {
			// member.getPassword(); 사용자 패스워드
			// loginMember.getPassword(); 아이디로 검색한 회원의 패스워드
			
			boolean checkMemberPw = service.checkMember(inputPw, user.getPassword());
			//패스워드 확인
			
			if(checkMemberPw) {
				session.setAttribute("authUser", user);
				//세션에 정보 담기
				
				//RedirectAttributes rttr;
				//		rttr.addAttribute("authUser", user);
				
				//		HttpServletRequest req
				//	req.getSession().setAttribute("authUser", user);
		
				
				
			}
		}	
		return"redirect:/member/home";
	}
	// ##로그아웃 
	@GetMapping("/logout")
	public String logout(MemberVO member, HttpSession session) {
		
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/join";
	}	
	
	public void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		
		if(value == null || value.isEmpty()) {
			errors.put(fieldName, true);
		}
	}
	
/*	
	// ##내 정보 보기
	@GetMapping("/myHome")
	public String myHome() {
		return "/member/myHome";
		
	}
	
	// 내 정보 수정 - GET, void(경로로 바로 이동)
	@GetMapping("/myModify")
	public void myModifyPage() {
	
	}
	
	// ##내 정보 수정 - POST
	@PostMapping("/myModify")
	public String myModify(MemberVO member, HttpSession session) {
		
		MemberVO user = (MemberVO) session.getAttribute("authUser");
		log.info(user);
		log.info(service);
		log.info(member);
		MemberVO userMember = service.getMemberId(user.getId());
		
		boolean checkMember = service.checkMember(userMember.getId(), member.getId());
		//같은 아이디인지 확인
		
		if(checkMember) {
			service.modify(member); 
			
			log.info(member);
			
			session.setAttribute("authUser", member);
			//수정된 멤버 정보를 세션에 저장
			
			return "/member/myHome";
		
		}
	
		return "/member/myHome";
		
	}
	
	// ##이메일 부분 나누기
	public void emailDivide(String email) {
		
		String emailDiv[] = email.split("@");
		String emailFront = null;
		String emailSelect = null;
		
		if(emailDiv != null && emailDiv.length >= 2) {
			emailFront = emailDiv[0];
			emailSelect = emailDiv[1];
		}
		
		log.info(emailFront);
		log.info(emailSelect);
		
	}
	
	// ##회원 삭제
	@DeleteMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> delete(String userId, String pwConfirm, HttpSession session) {
		log.info(userId);
		log.info(pwConfirm);
		log.info("회원탈퇴 모달");
		
		MemberVO userMember = service.getMemberId(userId);
		
		if(userMember.getPassword().equals(pwConfirm)) {
			service.remove(userId);
			log.info("회원탈퇴 성공!");
			
			if(session != null) {
				session.invalidate();
			}
			
			return new ResponseEntity<> ("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);		
		}
	}
*/
	
}