package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberListService {
	public boolean delete(String id);
	public List<MemberVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
