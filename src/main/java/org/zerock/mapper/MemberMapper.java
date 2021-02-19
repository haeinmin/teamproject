package org.zerock.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	//@Select("select * from Member")
	
	//회원 가입
	public void insertSelectKey(MemberVO member); 
	
	// 전체 회원 리스트
	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
			
	public MemberVO read(String id);
	
	public int delete(String id);
	
	public int update(MemberVO member);

	public MemberVO readMemberId(String id);
	
	
	
}






