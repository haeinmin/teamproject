package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.SearchVO;
import org.zerock.mapper.SearchMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService{
	
	@Setter(onMethod_= @Autowired )
	public SearchMapper mapper;
	
	@Override
	public List<SearchVO> searchList(String keyword) {
		return mapper.searchList(keyword);
	}

}
