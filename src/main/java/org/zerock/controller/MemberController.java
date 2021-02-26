package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CouponVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.CouponService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	private MemberService service;
	private CouponService couponService;

	@GetMapping("/myPage")
	public void myPage(Model model, HttpSession session) {
		Object o = session.getAttribute("authUser");

		if (o != null) {
			List<CouponVO> couponList = couponService.getList(((MemberVO) o).getId());
			model.addAttribute("list", couponList);
		}
	}

	@PostMapping("/modify")
	public String myModify(MemberVO member, HttpSession session) {

		if (session.getAttribute("authUser") != null) {
			MemberVO user = (MemberVO) session.getAttribute("authUser");
			log.info(user);

			service.modify(member);

			session.setAttribute("authUser", member);

			return "/member/myPage";
		}
		return "/member/myPage";
	}

	// ##회원 삭제
	@DeleteMapping("/delete")
	@ResponseBody
	public void delete(String userId, HttpSession session) {

		log.info(userId);

		service.remove(userId);
		log.info("회원탈퇴 성공");

		if (session != null) {
			session.invalidate();

		}

	}

	@GetMapping("/home")
	public String home() {
		return "redirect:/";
	}

	// ##회원가입 - GET
	@GetMapping("/join")
	public void register() {
	}

	// ##회원가입 - POST
	@PostMapping("/join")
	public String register(MemberVO member, Model model, RedirectAttributes rttr) {

		Map<String, Boolean> errors = new HashMap<>();
		log.info(member);
		validate(errors, member);// 에러 체크
		log.info("errors: " + errors);

		if (errors.isEmpty()) {
			service.register(member);
			rttr.addFlashAttribute("message", "회원가입에 성공하였습니다. 로그인 후 사용하여 주세요.");
			return "redirect:/member/login";

		}

		if (errors.containsKey("idDuplicated")) {
			// 아이디 중복
			model.addAttribute("message", "이미 해당 아이디가 존재합니다.");
			return "/member/join";
		}
		if (errors.containsKey("pwNotMatch")) {
			// 비밀번호 불일치
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "/member/join";
		}
		model.addAttribute("message", "아이디와 비밀번호 패턴을 확인해주세요.");
		return "/member/join";

	}

	// ##회원가입 - 아이디 중복 체크
	@GetMapping("/idDupCheck")
	@ResponseBody
	public String idDupCheck(String inputId) {

		// 아이디 값이 있으면
		log.info(inputId);

		// 패턴 검사
		String pattern = "[a-z0-9]{0,20}"; // 영문 소문자, 숫자 0~20글자 가능
		boolean idRegex = Pattern.matches(pattern, inputId);

		if (inputId.equals("")) {
			return "-2"; // null 값 입력 -2 리턴
		} else if (idRegex) {
			// null값 아니고, 정규식이 맞을 때
			MemberVO member = service.getMemberId(inputId);

			if (member == null) {
				return "0"; // 회원이 없으면 0 리턴 -> 가입 가능
			} else {
				return "-1"; // 회원있으면 -1 리턴 -> 에러 코드
			}
		} else {
			// 정규식에 맞지 않을때
			return "-3";
		}
	}

	/*
	 * // 회원가입 성공
	 * 
	 * @GetMapping("/joinSuccess") public void joinSuccess() { }
	 */
	// 로그인 - GET방식
	// ##로그인 - GET
	@GetMapping("/login")
	public String login(HttpSession session) {
		if (session.getAttribute("authUser") != null) {
			// 로그인 된 상태
//				rttr.addFlashAttribute("login", true);
			return "redirect:/member/home";
		} else {
			// 로그인 안된 상태
			return "member/login";
		}
	}

	// ##로그인 - POST방식
	@PostMapping("/login")
	public String login(String inputId, String inputPw, HttpSession session, RedirectAttributes rttr, Model model) {

		log.info(inputId);
		log.info(inputPw);

		MemberVO user = service.getMemberId(inputId);

		// 아이디 일치 회원
		if (user != null && inputPw != null) {
			// member.getPassword(); 사용자 패스워드
			// loginMember.getPassword(); 아이디로 검색한 회원의 패스워드

			boolean checkMemberPw = service.checkMember(inputPw, user.getPassword());
			// 패스워드 확인

			if (checkMemberPw) {
				session.setAttribute("authUser", user);
				rttr.addFlashAttribute("message", user.getNickname() + "님 환영합니다.");
				// 세션에 정보 담기

				// RedirectAttributes rttr;
				// rttr.addAttribute("authUser", user);

				// HttpServletRequest req
				// req.getSession().setAttribute("authUser", user);

			} else {
				model.addAttribute("message", "아이디가 없거나 패스워드가 일치하지 않습니다.");
				return "member/login";
			}
		} else {
			model.addAttribute("message", "아이디가 없거나 패스워드가 일치하지 않습니다.");
			return "member/login";
		}
		return "redirect:/member/home";
	}

	// ##joinErrors
	public void validate(Map<String, Boolean> errors, MemberVO member) {
		/*
		 * // null 체크 checkEmpty1(errors, member.getId(), "memberId");
		 * checkEmpty1(errors, member.getPassword(), "memberPw"); checkEmpty1(errors,
		 * member.getPwConfirm(), "memberPwConfirm"); checkEmpty1(errors,
		 * member.getEmail(), "memberEmail"); checkEmpty1(errors, member.getName(),
		 * "memberName"); checkEmpty1(errors, member.getNickname(), "memberNickname");
		 */
		boolean checkMemberPw = service.checkMember(member.getPassword(), member.getPwConfirm());
		// 비밀번호가 동일한 지 확인

		if (!checkMemberPw) {
			errors.put("pwNotMatch", true);
		}

		// 비밀번호 패턴 일치 확인
		String pattern = "([a-zA-Z]+\\d{1}\\w*)|(\\d+[a-zA-Z]{1}\\w*)\""; // 영문, 숫자 조합 2글자 이상
		boolean pwRegex = Pattern.matches(pattern, member.getPassword());

		if (!pwRegex) {
			errors.put("pwPatternError", true);
		}

		// 아이디 패턴 일치 확인
		pattern = "[a-z0-9]{0,20}"; // 영문 소문자, 숫자 0~20글자 가능
		boolean idRegex = Pattern.matches(pattern, member.getId());
		if (!idRegex) {
			errors.put("idPatternError", true);
		}

		// 아이디 중복
		MemberVO vo = service.getMemberId(member.getId());
		if (vo != null) {
			errors.put("idDuplicated", true);
		}

	}

	public void checkEmpty1(Map<String, Boolean> errors, String value, String id) {

		if (value == null || value.isEmpty()) {
			errors.put(id, true);
		}
	}

	// ##로그아웃
	@GetMapping("/logout")
	public String logout(MemberVO member, HttpSession session) {

		if (session != null) {
			session.invalidate();
		}

		return "redirect:/member/home";
	}

	public void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {

		if (value == null || value.isEmpty()) {
			errors.put(fieldName, true);
		}
	}

	/*
	 * // ##내 정보 보기
	 * 
	 * @GetMapping("/myHome") public String myHome() { return "/member/myHome";
	 * 
	 * }
	 * 
	 * // 내 정보 수정 - GET, void(경로로 바로 이동)
	 * 
	 * @GetMapping("/myModify") public void myModifyPage() {
	 * 
	 * }
	 * 
	 * // ##내 정보 수정 - POST
	 * 
	 * @PostMapping("/myModify") public String myModify(MemberVO member, HttpSession
	 * session) {
	 * 
	 * MemberVO user = (MemberVO) session.getAttribute("authUser"); log.info(user);
	 * log.info(service); log.info(member); MemberVO userMember =
	 * service.getMemberId(user.getId());
	 * 
	 * boolean checkMember = service.checkMember(userMember.getId(),
	 * member.getId()); //같은 아이디인지 확인
	 * 
	 * if(checkMember) { service.modify(member);
	 * 
	 * log.info(member);
	 * 
	 * session.setAttribute("authUser", member); //수정된 멤버 정보를 세션에 저장
	 * 
	 * return "/member/myHome";
	 * 
	 * }
	 * 
	 * return "/member/myHome";
	 * 
	 * }
	 * 
	 * // ##이메일 부분 나누기 public void emailDivide(String email) {
	 * 
	 * String emailDiv[] = email.split("@"); String emailFront = null; String
	 * emailSelect = null;
	 * 
	 * if(emailDiv != null && emailDiv.length >= 2) { emailFront = emailDiv[0];
	 * emailSelect = emailDiv[1]; }
	 * 
	 * log.info(emailFront); log.info(emailSelect);
	 * 
	 * }
	 * 
	 * // ##회원 삭제
	 * 
	 * @DeleteMapping("/delete")
	 * 
	 * @ResponseBody public ResponseEntity<String> delete(String userId, String
	 * pwConfirm, HttpSession session) { log.info(userId); log.info(pwConfirm);
	 * log.info("회원탈퇴 모달");
	 * 
	 * MemberVO userMember = service.getMemberId(userId);
	 * 
	 * if(userMember.getPassword().equals(pwConfirm)) { service.remove(userId);
	 * log.info("회원탈퇴 성공!");
	 * 
	 * if(session != null) { session.invalidate(); }
	 * 
	 * return new ResponseEntity<> ("success", HttpStatus.OK); } else { return new
	 * ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR); } }
	 */

}