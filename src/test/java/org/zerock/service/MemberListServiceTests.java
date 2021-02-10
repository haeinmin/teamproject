package org.zerock.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberListServiceTests {

	@Setter(onMethod_=@Autowired)
	private MemberListService service;
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2,10);
		List<MemberVO> list = service.getList(cri);
		
		assertNotNull(list);
		assertNotEquals(list.size(), 0);
		assertEquals(list.size(), 10);
	}
	
	@Test
	public void testDelete() {
		log.info("remove result: " + service.delete("dummy"));
	}

}
