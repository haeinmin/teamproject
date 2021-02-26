package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CountryVO;
import org.zerock.mapper.CountryMapper;

import lombok.Setter;

@Service
public class CountryServiceImpl implements CountryService {
	
	@Setter(onMethod_ = @Autowired)
	public CountryMapper mapper;
	
	@Override
	public List<CountryVO> getList() {
		return mapper.getList();
	}

}
