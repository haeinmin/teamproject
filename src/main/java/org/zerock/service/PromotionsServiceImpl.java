package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.PromotionsVO;
import org.zerock.mapper.PromotionsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PromotionsServiceImpl implements PromotionsService {
	
	private PromotionsMapper mapper;
	
	@Override
	public int register(PromotionsVO vo) {
		log.info("PromotionsServiceImpl register ...." + vo) ;
		return mapper.insertSelectKey(vo);
	}

	@Override
	public PromotionsVO get(Long id) {
		log.info("PromotionsServiceImpl get" + id);
		return mapper.get(id);
	}
	
	@Override
	public int modify(PromotionsVO vo) {
		log.info("PromotionsServiceImpl modify" + vo);
		return mapper.update(vo);
	}
	
	@Override
	public int remove(Long id) {
		log.info("PromotionsServiceImpl remove" + id);
		return mapper.remove(id);
	}
	
	@Override
	public List<PromotionsVO> getList(Criteria cri, Long id) {
		log.info("PromotionsServiceImple List" + id);
		return mapper.getListWithPaging(cri, id);
	}
	
}
