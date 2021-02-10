package org.zerock.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaVO;
import org.zerock.mapper.QnaMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private QnaService service;

	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		QnaVO qna = new QnaVO();
		qna.setQnaTitle("새로운 문의글");
		qna.setQnaContent("문의합니다.");
		qna.setId("newbie");
		service.register(qna);
		
		log.info("생성된 게시물 번호: "+qna.getQnaNo());
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2,10);
		List<QnaVO> list = service.getList(cri);
		
		assertNotNull(list);
		assertNotEquals(list.size(), 0);
		assertEquals(list.size(), 10);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(4));
	}
	
	@Test
	public void testDelete() {
		log.info("remove result: " + service.delete(4));
	}
	
	@Test
	public void testUpdate() {
		QnaVO qna = service.get(24);
		if (qna == null) {
			return;
		}
		qna.setQnaTitle("제목 수정");
		log.info("modify result: " + service.modify(qna));
	}

}
