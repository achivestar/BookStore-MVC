package com.pe.bluering.service;

import com.pe.bluering.dao.CartDAO;

public class ServiceCartCount {

	public int getCount(String id) {
		
		int count = 0;
		CartDAO cartDao = new CartDAO();
		count = cartDao.getCount(id);
		
		return count;
	}
}
