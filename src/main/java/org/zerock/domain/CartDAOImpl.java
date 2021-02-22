package org.zerock.domain;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
    
    //MyBatis를 호출하므로 sqlsession에 의존성을 주입해야한다.

    @Inject
    SqlSession sqlSession;
    
    @Override
    public List<CartVO> cartMoney() {
        // TODO Auto-generated method stub
        return null;
    }
    //장바구니에 담기
    @Override
    public void insert(CartVO vo) {
    //dto에 저장된 값을 받아서 sql세션에 저장하고 cart.insert로 넘어감 mapper로.
        sqlSession.insert("cart.insert", vo); 
    }
 
    @Override
    public List<CartVO> listCart(String userid) {
        return sqlSession.selectList("cart.listCart", userid);
    }
 
    @Override
    public void delete(int cart_id) {
        sqlSession.delete("cart.delete", cart_id);
    }
 
    @Override
    public void deleteAll(String userid) {
        sqlSession.delete("cart.deleteAll", userid);
    }
 
    @Override
    public void update(int cart_id) {
        // TODO Auto-generated method stub
 
    }
 
    @Override
    public int sumMoney(String userid) {
        return sqlSession.selectOne("cart.sumMoney", userid); 
    }
 
    @Override
    public int countCart(String userid, int product_id) {
        // TODO Auto-generated method stub
        return 0;
    }
 
    @Override
    public void updateCart(CartVO vo) {
        // TODO Auto-generated method stub
 
    }
 
    @Override
    public void modifyCart(CartVO vo) {
        sqlSession.update("cart.modify", vo);
    }
 
}