package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.PromotionsVO;

public interface PromotionsService {
	
	public int register(PromotionsVO vo);
	
	public PromotionsVO get(Long id);
	
	public int modify(PromotionsVO vo);
	
	public int remove(Long id);

	public List<PromotionsVO> getList(Criteria cri, Long id);
}
