package org.zerock.controller;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.QnaVO;
import org.zerock.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class QnaControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Setter(onMethod_= @Autowired)
	private QnaMapper mapper;
	
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
		Object o = mockMvc.perform(MockMvcRequestBuilders.get("/qna/list")).andReturn().getModelAndView().getModel()
				.get("list");

		assertNotNull(o);
		assertTrue(o instanceof List);
		assertNotEquals(((List) o).size(), 0);
	}
	
	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/register")
				.param("qnaTitle", "테스트 새글 제목")
				.param("qnaContent", "테스트 새글 내용")
				.param("id", "newbie"))
				.andReturn().getModelAndView().getViewName();
				
		log.info(resultPage);
	}
	
	@Test
	public void testGet() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/qna/get").param("qnaNo", "42")).andReturn();
		String viewName = result.getModelAndView().getViewName();
		Map<String, Object> modelMap = result.getModelAndView().getModel();

		assertEquals("qna/get", viewName);
		assertNotNull(modelMap.get("qna"));
		assertEquals(42, ((QnaVO) modelMap.get("qna")).getQnaNo());
	}
	
	@Test
	public void testModify() throws Exception {
		QnaVO qna = new QnaVO();
		qna.setQnaContent("new content");
		qna.setQnaTitle("new title");
		qna.setId("newbie");

		mapper.insertSelectKey(qna);

		int key = qna.getQnaNo();

		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/qna/modify")
				.param("qnaNo", key + "")
				.param("qnaTitle", "수정된 제목")
				.param("qnaContent", "수정된 내용")
				.param("id", "newbie"))
				.andReturn();

		FlashMap map = result.getFlashMap();
		String viewName = result.getModelAndView().getViewName();
		QnaVO mod = mapper.read(key);

		assertEquals("수정된 제목", mod.getQnaTitle());
		assertEquals("수정된 내용", mod.getQnaContent());
		assertEquals(map.get("result"), "success");
		assertEquals("redirect:/qna/list", viewName);
	}
	
	@Test
	public void testDelete() throws Exception {
		QnaVO qna = new QnaVO();
		qna.setQnaContent("new content");
		qna.setQnaTitle("new title");
		qna.setId("newbie");

		mapper.insertSelectKey(qna);
		
		int key = qna.getQnaNo();
		
		int before = mapper.getList().size();
		log.info("before......" + before);
		
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/qna/delete")
				.param("qnaNo", key + ""))
				.andReturn();
		
		int after = mapper.getList().size();
		log.info("after......" +after);
		
//		assertEquals(before-1, after);
		
		String viewName = result.getModelAndView().getViewName();
		assertEquals("redirect:/qna/list", viewName);
		
		assertEquals("success", result.getFlashMap().get("result"));
	}
}
