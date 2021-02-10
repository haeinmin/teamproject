package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.service.QnaReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/qna/replies")
@AllArgsConstructor
public class QnaReplyController {
	private QnaReplyService service;
	
	@PostMapping(value="/new", consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody QnaReplyVO vo) {
		
		log.info("vo: " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("count: " + insertCount);
		
		if (insertCount==1) {
			return new ResponseEntity<>("success999", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@GetMapping(value="/pages/{qnaNo}/{page}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<QnaReplyVO>> getList(@PathVariable("page")int page, @PathVariable("qnaNo")int qnaNo) {
		Criteria cri = new Criteria(page, 10);
		List<QnaReplyVO> list = service.getList(cri, qnaNo);
		log.info(list);
		return new ResponseEntity<List<QnaReplyVO>> (list, HttpStatus.OK);
	}
	
	@GetMapping(value="/{replyNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<QnaReplyVO> get(@PathVariable("replyNo") int replyNo) {
		QnaReplyVO vo = service.get(replyNo);
		log.info(vo);
		return new ResponseEntity<QnaReplyVO>(vo, HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{replyNo}", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo) {
		int cnt = service.remove(replyNo);
		log.info(cnt);
		if (cnt == 1) {
			return new ResponseEntity<>("deleted successfully", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value="/{replyNo}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(
			@RequestBody QnaReplyVO vo,
			@PathVariable int replyNo) {
		
		vo.setReplyNo(replyNo);
		
		int cnt = service.modify(vo);
		
		log.info(cnt);
		
		if (cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
}
