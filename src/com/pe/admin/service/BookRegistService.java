package com.pe.admin.service;

import java.sql.SQLException;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;


public class BookRegistService {

	public boolean bookRegist(BookVo bookvo) {
	
		boolean isRegistSuccess = false;

		BookDAO bookDao = new BookDAO();
		
		int insertCount = 0;
		try {
			insertCount = bookDao.insertBook(bookvo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(insertCount);
		if(insertCount>0) {
			isRegistSuccess = true;
		}else {
			isRegistSuccess = false;
		}

		
		return isRegistSuccess;

	}

}
