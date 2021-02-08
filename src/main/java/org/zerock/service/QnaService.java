package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnaVO;

public interface QnaService {
	public void register(QnaVO qna);
	public QnaVO get(int qnaNo);
	public boolean modify(QnaVO qna);
	public boolean delete(int qnaNo);
	public List<QnaVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
