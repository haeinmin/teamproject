package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.SearchVO;

public interface SearchMapper {
	public List<SearchVO> searchList(String keyword);

}
