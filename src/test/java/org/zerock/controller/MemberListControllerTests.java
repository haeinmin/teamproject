package org.zerock.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.mapper.MemberListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class MemberListControllerTests {
	
	@Setter(onMethod_=@Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Setter(onMethod_=@Autowired)
	private MemberListMapper mapper;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testExist() {
		assertNotNull(ctx);
		assertNotNull(mockMvc);
		assertNotNull(mapper);
	}
	
	@Test
	public void testList() throws Exception {
		Object o = mockMvc.perform(MockMvcRequestBuilders.get("/memberList/list")).andReturn().getModelAndView().getModel()
				.get("list");

		assertNotNull(o);
		assertTrue(o instanceof List);
		assertNotEquals(((List) o).size(), 0);
	}
	
	@Test
	public void testDelete() throws Exception {
		
		int before = mapper.getList().size();
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/memberList/delete")
				.param("id", "dummy"))
				.andReturn();
		
		int after = mapper.getList().size();
		
		assertEquals(before-1, after);
		
		String viewName = result.getModelAndView().getViewName();
		assertEquals("redirect:/memberList/list", viewName);
		
		assertEquals("success", result.getFlashMap().get("result"));
	}

}
