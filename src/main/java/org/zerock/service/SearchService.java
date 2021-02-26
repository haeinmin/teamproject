package org.zerock.service;

import java.util.List;

import org.zerock.domain.SearchVO;

public interface SearchService {
	List<SearchVO> searchList(String keyword);

}
