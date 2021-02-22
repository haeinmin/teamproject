package org.zerock.service;

import java.util.List;

import org.zerock.domain.CouponVO;

public interface CouponService {
	
	public int register(CouponVO vo);
	
	public Integer duplicateCheck(CouponVO vo);
	
	public List<CouponVO> myCouponList(CouponVO vo);
}
