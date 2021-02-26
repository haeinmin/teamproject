package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CouponVO;
import org.zerock.mapper.CouponMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CouponServiceImpl implements CouponService {
	
	@Setter(onMethod_ = @Autowired)
	private CouponMapper couponMapper;

	@Override
	public int register(CouponVO vo) {
		return couponMapper.insert(vo);
	}

	@Override
	public Integer duplicateCheck(CouponVO vo) {
		return couponMapper.check(vo);
	}
	
	@Override
	public List<CouponVO> getList(String id) {
		return couponMapper.getList(id);
	}
}

