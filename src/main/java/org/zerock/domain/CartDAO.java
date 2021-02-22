package org.zerock.domain;

import java.util.List;

public interface CartDAO {
    List<CartVO> cartMoney();
    void insert(CartVO vo); //장바구니 추가
    List<CartVO> listCart(String userid); //장바구니 목록
    void delete(int cart_id); //장바구니 개별 삭제
    void deleteAll(String userid); //장바구니 비우기
    void update(int cart_id); 
    int sumMoney(String userid); //장바구니 금액 합계
    int countCart(String userid, int product_id); //장바구니 상품 갯수
    void updateCart(CartVO vo); //장바구니 수정 
    void modifyCart(CartVO vo);
}
