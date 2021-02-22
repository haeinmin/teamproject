package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaVO;
import org.zerock.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService{
	@Setter(onMethod_= @Autowired)
	private QnaMapper mapper;
	
	@Override
	public void register(QnaVO qna) {
		log.info("register......."+qna);
		mapper.insertSelectKey(qna);
		
	}

	@Override
	public QnaVO get(int qnaNo) {
		log.info("get........"+qnaNo);
		return mapper.read(qnaNo);
	}

	@Override
	public boolean modify(QnaVO qna) {
		log.info("modify....." + qna);
		return mapper.update(qna) == 1;
	}

	@Override
	public boolean delete(int qnaNo) {
		log.info("delete....." + qnaNo);
		return mapper.delete(qnaNo)==1;
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		log.info("getList.........");
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<QnaVO> getPinList() {
		return mapper.getPinList();
	}
}