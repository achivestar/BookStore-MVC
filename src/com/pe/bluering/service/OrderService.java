package com.pe.bluering.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;
import com.pe.bluering.dao.CartDAO;
import com.pe.bluering.dao.OrderDAO;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.MemberVO;
import com.pe.bluering.vo.OrderVo;

public class OrderService {

	public CartVo getOneCartList(int cart_id) {
		CartVo cartList = null;
		CartDAO cartDao = new CartDAO();
		cartList = cartDao.selectOneCart(cart_id);
		return cartList;
	}




	public ArrayList<OrderVo> selectOrderList(String memberId) {
		OrderDAO orderDao = new OrderDAO();
		ArrayList<OrderVo> orderList = orderDao.selectAllOrder(memberId);
		return orderList;
	}



	public ArrayList<CartVo> getAllCartList(String memberId) {
		
		CartDAO cartDao = new CartDAO();
		ArrayList<CartVo> cartList = cartDao.selectCart(memberId);
		return cartList;
	}



	public int insertOneOrder(String memberId, ArrayList<OrderVo> orderList,int availPoint, int point) throws SQLException {
		int successCount = 0;
		OrderDAO orderDao = new OrderDAO();
		successCount = orderDao.addOrder(memberId,orderList,availPoint,point);
		
		return successCount;
	}




	public void modifyCart(int[] cart_id) throws SQLException {
		OrderDAO orderDao = new OrderDAO();
		orderDao.modifyOrder(cart_id);
	}

}
