package com.pe.bluering.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;
import com.pe.bluering.dao.CartDAO;
import com.pe.bluering.vo.CartVo;

public class ServiceCartAdd {

	public BookVo getBookList(String bookId) {
		
		BookVo bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectOneBook(bookId);
		
		return bookList;
	}

	public int insertCart(String memberId, int bookNum, BookVo bookList) throws SQLException {
		
		int successCount = 0;
		CartDAO cartDao = new CartDAO();
		successCount = cartDao.addCart(memberId,bookNum,bookList);
		
		return successCount;
	}

	public ArrayList<CartVo> selectCart(String memberId) {
		CartDAO cartDao = new CartDAO();
		ArrayList<CartVo> cartList = cartDao.selectCart(memberId);
		return cartList;
	}

	public int getCount(String memberId, String bookNum) {
		CartDAO cartDao = new CartDAO();
		int count = cartDao.getCartCount(memberId,bookNum);
		return count;
	}

	public int modifyCart(String memberId, int bookNum, String bookId) {
		int successCount = 0;
		CartDAO cartDao = new CartDAO();
		successCount = cartDao.modifyCart(memberId,bookNum,bookId);
		
		return successCount;
	}

}
