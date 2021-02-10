package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;

public interface QnaReplyService {
	public int register(QnaReplyVO vo);
	public QnaReplyVO get(int replyNo);
	public int modify(QnaReplyVO vo);
	public int remove(int replyNo);
	public List<QnaReplyVO> getList(Criteria cri, int qnaNo);
}
