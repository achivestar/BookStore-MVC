package com.pe.admin.service;

import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookListService {

	public int getListCount() {
		
		int listCount = 0;
		BookDAO bookDao = new BookDAO();
		listCount = bookDao.selectListCount();
		
		return listCount;
		
	}

	public ArrayList<BookVo> getBookList(int page, int limit) {

		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectAllBook(page, limit);
		
		return bookList;
	}

	public ArrayList<BookVo> getOneBook(String bookId) {
		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectOneBook(bookId);
		
		return bookList;
	}

}
