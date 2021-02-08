package org.zerock.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.QnaVO;
import org.zerock.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private QnaMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(qna -> log.info(qna));
	}
	
	@Test
	public void testInsert() {
		QnaVO qna = new QnaVO();
		qna.setQnaTitle("새로운 문의글");
		qna.setQnaContent("문의합니다.");
		qna.setId("newbie");
		
		mapper.insert(qna);
		log.info(qna);
	}
	
	@Test
	public void testInsertSelectKey() {
		QnaVO qna = new QnaVO();
		qna.setQnaTitle("새로운 문의글 select key");
		qna.setQnaContent("문의합니다. select key");
		qna.setId("newbie");
		
		mapper.insert(qna);
		log.info(qna);
	}
	
	@Test
	public void testGet() {
		QnaVO qna = mapper.read(3);
		log.info(qna);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(3));
	}
	
	@Test
	public void testUpdate() {
		QnaVO qna = new QnaVO();
		qna.setQnaNo(4);
		qna.setQnaTitle("수정된 문의");
		qna.setQnaContent("수정된 내용");
		qna.setId("newbie");
		
		int count = mapper.update(qna);
		log.info("UPDATE COUNT: " +count);
	}

}