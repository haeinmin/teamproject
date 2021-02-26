package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CategoriesVO;
import org.zerock.mapper.CategoriesMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class CategoriesServiceImpl implements CategoriesService{
	
	@Setter(onMethod_ = @Autowired)
	public CategoriesMapper mapper;
	
	@Override
	public List<CategoriesVO> getList() {
		return mapper.getList();
	}
	
	
}
