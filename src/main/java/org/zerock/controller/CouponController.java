package org.zerock.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.CouponVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.CouponService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/coupon")
@Log4j
@AllArgsConstructor
public class CouponController {

	private CouponService couponService;
	

	@PostMapping(value = "/new")
	public ResponseEntity<String> create(@RequestBody CouponVO vo, HttpSession session) {

		log.info("vo: " + vo);
		Integer checkCount = couponService.duplicateCheck(vo);
		log.info("count: " + checkCount);
		
		if (checkCount == null) {
			int insertCount = couponService.register(vo);
			
			log.info("count: " + insertCount);
			
			if (insertCount == 1) {
				// 잘 들어 갔을 때
				return new ResponseEntity<>("success", HttpStatus.OK);
			} else {
				// 안 들어 갔을 때
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@GetMapping("/myCouponList")
	public void myCouponList(@RequestBody CouponVO vo, HttpSession session) {
		/*
		 * MemberVO user = (memberVO) session.getAttribute(authUser); List<CouponVO>
		 * list = CouponService.myCouponList(vo);
		 */
	}

}
