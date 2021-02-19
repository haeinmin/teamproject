package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service //서비스 bean 객체 생성
@AllArgsConstructor	//생성자 생성
@Log4j
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	
	//##회원 등록
	@Override
	public void register(MemberVO member) {
		mapper.insert(member);
	}
	
	//회원 정보 읽기 - 아이디
	@Override
	public MemberVO getMemberId(String id) {
		return mapper.readMemberId(id);
	}
	
	//회원 정보 수정
	@Override
	public boolean modify(MemberVO member) {
		return mapper.update(member) == 1;
	}

	//회원 탈퇴(삭제)
	@Override
	public boolean remove(String id) {
		return mapper.delete(id) == 1;
	}
	
	
	//회원 정보 체크
	@Override
	public boolean checkMember(String memA, String memB) {
			return memA.equals(memB);
	}

	@Override
	public MemberVO getMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO get(Long no) {
		// TODO Auto-generated method stub
		return null;
	}

}