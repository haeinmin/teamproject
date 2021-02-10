package org.zerock.mapper;

import static org.junit.Assert.*;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.QnaReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaReplyMapperTests {
	
	private int[] qnaNoArr = {53, 47, 82, 88, 24};
	
	@Setter(onMethod_=@Autowired)
	private QnaReplyMapper mapper;

	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			log.info(i+","+(i%5));
			
			QnaReplyVO vo = new QnaReplyVO();
			vo.setQnaNo(qnaNoArr[i%5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplier("replier" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testList() {
		List<QnaReplyVO> list = mapper.getListWithPaging(null, 53);
		assertNotEquals(0, list.size());
	}
	
	@Test
	public void testRead() {
		int replyNo = 1;
		QnaReplyVO vo = mapper.read(replyNo);
		assertEquals("댓글 테스트1", vo.getReply());
	}
	
	@Test
	public void testUpdate() {
		QnaReplyVO vo = new QnaReplyVO();
		vo.setReplyNo(2);
		vo.setReply("수정된 댓글");
		mapper.update(vo);
		
		vo = mapper.read(2);
		assertEquals("수정된 댓글", vo.getReply());
	}
	
	@Test
	public void testDelete() {
		int replyNo = 1;
		mapper.delete(replyNo);
	}

}
