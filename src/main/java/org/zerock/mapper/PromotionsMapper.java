package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.PromotionsVO;

public interface PromotionsMapper {
	
	public int insert(PromotionsVO pro); //추가
	
	public int insertSelectKey(PromotionsVO pro);

	public PromotionsVO get(Long id); //일기
	
	public int update(PromotionsVO vo); //수정
	
	public int remove(Long id); //삭제
	
	public List<PromotionsVO> getListWithPaging(@Param("cri")Criteria cri, @Param("id")Long id);

}
