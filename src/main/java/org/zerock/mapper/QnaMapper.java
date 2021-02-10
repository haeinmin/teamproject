package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaVO;

public interface QnaMapper {
	
	public List<QnaVO> getList();
	
	public List<QnaVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(QnaVO qna);
	
	public void insertSelectKey(QnaVO qna);
	
	public QnaVO read(int qnaNo);
	
	public int delete(int qnaNo);
	
	public int update(QnaVO qna);
	
	public void updateReplyCnt(@Param("qnaNo") int qnaNo, @Param("amount") int amount);
}
