package com.pe.bluering.service;

import com.pe.bluering.dao.CartDAO;

public class ServiceCartDelete {

	public int deleteCart(int cart_id) {
		
		int successCount = 0;
		CartDAO cartDao = new CartDAO();
		successCount = cartDao.deleteCart(cart_id);
		
		return successCount;
	}

}
