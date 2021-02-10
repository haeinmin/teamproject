package org.zerock.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberListTests {
	
	@Setter(onMethod_= @Autowired)
	private MemberListMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(member -> log.info(member));
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("dummy"));
		
	}

}
