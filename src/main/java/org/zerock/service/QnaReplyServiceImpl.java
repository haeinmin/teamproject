package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.mapper.QnaMapper;
import org.zerock.mapper.QnaReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class QnaReplyServiceImpl implements QnaReplyService{
	@Setter(onMethod_=@Autowired)
	private QnaReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private QnaMapper qnaMapper;
	
	@Override
	public QnaReplyVO get(int replyNo) {
		return mapper.read(replyNo);
	}

	@Override
	@Transactional
	public int register(QnaReplyVO vo) {
		qnaMapper.updateReplyCnt(vo.getQnaNo(), 1);
		return mapper.insert(vo);
	}

	@Override
	public int modify(QnaReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(int replyNo) {
		QnaReplyVO vo = mapper.read(replyNo);
		qnaMapper.updateReplyCnt(vo.getQnaNo(), -1);
		return mapper.delete(replyNo);
	}

	@Override
	public List<QnaReplyVO> getList(Criteria cri, int qnaNo) {
		return mapper.getListWithPaging(cri, qnaNo);
	}
	
	
	
}
