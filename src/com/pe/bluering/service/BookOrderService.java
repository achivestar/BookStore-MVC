package com.pe.bluering.service;

import java.util.ArrayList;

import com.pe.bluering.dao.OrderDAO;
import com.pe.bluering.vo.OrderVo;

public class BookOrderService {
	
	public ArrayList<OrderVo> getOrder(String memberId) {
		System.out.println("getOrder");
		OrderDAO orderdao = new OrderDAO();
		ArrayList<OrderVo> orderList = orderdao.periodOrder(memberId);
		return orderList;
	}

}
