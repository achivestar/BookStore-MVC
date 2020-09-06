package com.pe.bluering.service;

import java.util.ArrayList;

import com.pe.bluering.dao.CartDAO;
import com.pe.bluering.dao.OrderDAO;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.OrderVo;

public class OrderSucessService {

	public ArrayList<OrderVo> selectOrder(String memberId) {
		OrderDAO orderdao = new OrderDAO();
		ArrayList<OrderVo> orderList = orderdao.selectAllOrder(memberId);
		return orderList;
	}

}
