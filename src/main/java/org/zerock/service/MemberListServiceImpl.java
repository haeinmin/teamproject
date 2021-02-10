package org.zerock.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberListMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberListServiceImpl implements MemberListService {
	@Setter(onMethod_=@Autowired)
	private MemberListMapper mapper;
	
	@Override
	public boolean delete(String id) {
		return mapper.delete(id) == 1;
	}

	@Override
	public List<MemberVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
