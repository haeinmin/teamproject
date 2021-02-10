package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberListMapper {
	public List<MemberVO> getList();
	public List<MemberVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int delete(String id);
}
