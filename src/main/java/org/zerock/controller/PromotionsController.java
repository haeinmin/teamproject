package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CategoriesVO;
import org.zerock.domain.CountryVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PromotionsVO;
import org.zerock.service.CategoriesService;
import org.zerock.service.CountryService;
import org.zerock.service.FileUpService;
import org.zerock.service.PromotionsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/write")
@Log4j
@AllArgsConstructor
public class PromotionsController {
	
	private PromotionsService Proservice;
	private FileUpService fileSvc;
	private CategoriesService Catservice;
	private CountryService Couservice;
	
//	@GetMapping("/")
//	public void list(Model model) {
//		List<CategoriesVO> list = Catservice.getList();
//		model.addAttribute("list", list);
//	}
	
	@GetMapping("/write")
	public void write(Model model) {
		
		List<CategoriesVO> list1 = Catservice.getList();
		model.addAttribute("list1", list1);
		
		List<CountryVO> list2 = Couservice.getList();
		model.addAttribute("list2", list2);
	
		log.info(list1);
		log.info(list2);
	}
	
	//추가
//	@PostMapping(value ="/register",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
//	public ResponseEntity<String> create(@RequestBody PromotionsVO vo, MultipartFile file, Model model){
//		log.info("vo : "+ vo);
//		
//		List<CategoriesVO> list1 = Catservice.getList();
//		model.addAttribute("list1", list1);
//		
//		List<CountryVO> list2 = Couservice.getList();
//		model.addAttribute("list2", list2);
//		
//		vo.setPhotourl("");
//		int insertCount = Proservice.register(vo);
//		
//		if (file != null) {
//			vo.setPhotourl(vo.getId() + "_" + file.getOriginalFilename());
//			Proservice.modify(vo);
////			fileUpSvc.write(file, board.getFilename());
//			try {
//				fileSvc.transfer(file, vo.getPhotourl());
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//		}
//		
//		log.info("PromotionsController count : " + insertCount);
//		
//		if(insertCount == 1) {
//			return new ResponseEntity<>("success",HttpStatus.OK);
//		}else {
//			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//	}
//	
	@PostMapping("/register")
	public String register(PromotionsVO vo, MultipartFile file, Model model , RedirectAttributes rttr) {
		log.info("register");
		log.info(vo);
		log.info(file);
		
		vo.setPhotourl("");
		Proservice.register(vo);
		
		if (file != null && file.getSize() > 0) {
			vo.setPhotourl(vo.getId() + "_" + file.getOriginalFilename());
			Proservice.modify(vo);
			log.info(file.getOriginalFilename());
			
			try {
				fileSvc.transfer(file, vo.getPhotourl());
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		rttr.addAttribute("result", vo.getId());
		rttr.addFlashAttribute("message", vo.getId() + "번이 등록되었습니다.");
		
		return "redirect:/home";
	}
	
	//하나만 읽을때
	@GetMapping(value="/{id}",produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<PromotionsVO> get(@PathVariable("id") Long id){
		PromotionsVO vo = Proservice.get(id);
		
		log.info("PromotionsController id : " + id);
		
		return new ResponseEntity<PromotionsVO>(vo, HttpStatus.OK);
	}
	
	//여러개 읽을때
	@GetMapping(value="/pages/{id}/{page}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<PromotionsVO>> getList(@PathVariable("page") int page, @PathVariable("id") Long id){
		
		Criteria cri = new Criteria(page, 5);
		List<PromotionsVO> list = Proservice.getList(cri, id);
		
		log.info("PromotionsController list" + list);
		
		return new ResponseEntity<List<PromotionsVO>>(list, HttpStatus.OK);
	}
	
	
	//수정
	@RequestMapping(value = "/{id}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = MediaType.APPLICATION_JSON_VALUE, 
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody PromotionsVO vo,  @PathVariable Long id){
		vo.setId(id);
		
		log.info("PromotionsController modify vo" + vo);
		
		int cnt = Proservice.modify(vo);
		
		if(cnt == 1) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	//삭제
	@DeleteMapping(value="/{id}", produces = MediaType.TEXT_PLAIN_VALUE )
	public ResponseEntity<String> remove(@PathVariable("id") Long id){
		
		int cnt = Proservice.remove(id);
		
		log.info("PromotionsController remove" + cnt);
		
		if(cnt == 1) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
