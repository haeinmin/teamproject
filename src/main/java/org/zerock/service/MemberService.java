package org.zerock.service;

import javax.servlet.http.HttpServletResponse;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	//회원 등록
	public void register(MemberVO member);
	
	//회원 정보 읽기 - 아이디
	public MemberVO getMember(String id);
	
	//회원 정보 읽기 - no
	public MemberVO get(Long no);
	
	//회원 정보 수정
	public boolean modify(MemberVO member);
	
	//회원 탈퇴(삭제)
	public boolean remove(String id); 
	
	//회원 정보 체크
	public boolean checkMember(String memA, String memB);

	MemberVO getMemberId(String id);
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	
	
}
