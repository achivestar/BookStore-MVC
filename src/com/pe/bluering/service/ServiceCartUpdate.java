package com.pe.bluering.service;

import com.pe.bluering.dao.CartDAO;

public class ServiceCartUpdate {


	public int updateCart(int cart_id, int amount) {
		int successCount = 0;
		CartDAO cartDao = new CartDAO();
		successCount = cartDao.updateCart(cart_id,amount);
		
		return successCount;
	}

}
