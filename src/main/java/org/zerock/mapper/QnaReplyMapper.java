package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;

public interface QnaReplyMapper {
	public int insert(QnaReplyVO vo);
	public QnaReplyVO read(int replyNo);
	public int delete(int replyNo);
	public int update(QnaReplyVO reply);
	public List<QnaReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("qnaNo") int qnaNo);
}
