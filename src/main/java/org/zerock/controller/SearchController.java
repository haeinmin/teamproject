package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.CategoriesVO;
import org.zerock.domain.SearchVO;
import org.zerock.service.CategoriesService;
import org.zerock.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/search/*")
public class SearchController {
	private CategoriesService CateService;
	private SearchService SeaService;
	
	@GetMapping("/")
	public void list(Model model, String keyword) {
		List<CategoriesVO> list = CateService.getList();
		model.addAttribute("list", list);
		
		List<SearchVO> seaList = SeaService.searchList(keyword);
		model.addAttribute("seaList", seaList);
	
	}
}
