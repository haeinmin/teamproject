package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.QnaVO;
import org.zerock.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {
	private QnaService service;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List<QnaVO> list = service.getList(cri);
		int total = service.getTotal(cri);
		PageDTO dto = new PageDTO(cri, total);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri) {
		
	}
	
	@PostMapping("/register")
	public String register(QnaVO qna,String pin, RedirectAttributes rttr) {
		log.info("register: " + qna);
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getQnaNo());
		return "redirect:/qna/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(int qnaNo, @ModelAttribute("cri") Criteria cri, Model model) {
		QnaVO vo = service.get(qnaNo);
		model.addAttribute("qna", vo);
	}
	
	@PostMapping("/modify")
	public String modify(QnaVO qna, Criteria cri, RedirectAttributes rttr) {
		if (service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", qna.getQnaNo() + "번 글이 수정되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/qna/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("qnaNo") int qnaNo, Criteria cri, RedirectAttributes rttr) {
		log.info("delete...... " + qnaNo);
		if (service.delete(qnaNo)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", qnaNo + "번 글이 삭제되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/qna/list";
	}
	
}
