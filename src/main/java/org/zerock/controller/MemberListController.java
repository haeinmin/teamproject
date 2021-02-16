package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MemberListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/memberList/*")
@AllArgsConstructor
public class MemberListController {
	private MemberListService service;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List<MemberVO> list = service.getList(cri);
		int total = service.getTotal(cri);
		PageDTO dto = new PageDTO(cri, total);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("id") String[] ids) {
		log.info("delete...... " + ids);
		
		for (String id : ids) {
			service.delete(id);
		}
		
		return "success123";
		/*
		if (service.delete(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/memberList/list";
		*/
	}
	/*
	@PostMapping() 
	public void login(String id, String pw, HttpSession session) {
		//login....
		// get user by id -> service.getUser(id)
		// if pw.equals(user.pw)
		//    then sucess
		//    else fail
		
		// sql - select * from member where id = #{id}
		
		session.setattribute('authUser', user);
		
		else 
			
			
	}
	
	@GetMapping()
	public void onlyAuth(HttpSession session) {
		Object o = session.getAttribute("authUser");
		if (o == nul) {
			
		} else {
			
		}
	}
	*/
}
