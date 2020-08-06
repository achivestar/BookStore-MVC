package com.pe.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookListService {

	public int getListCount(String filter) {
		
		int listCount = 0;
		BookDAO bookDao = new BookDAO();
		listCount = bookDao.selectListCount(filter);
		
		return listCount;
		
	}

	public ArrayList<BookVo> getBookList(int page, int limit, String filter) {

		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectAllBook(page, limit, filter);
		
		return bookList;
	}
	
	public List<BookVo> BookList() {
		
		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectAllBook();
		
		return bookList;
	}

	public BookVo getOneBook(String bookId) {
		BookVo bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.selectOneBook(bookId);
		
		return bookList;
	}

	public ArrayList<BookVo> getBooksCount() {
		
		ArrayList<BookVo> booksCount = null;
		BookDAO bookDao = new BookDAO();
		booksCount = bookDao.selectAllCountBook();
		
		return booksCount;
	}


	public int totalBookCount() {
		
		int totalBookCount = 0;
		BookDAO bookDao = new BookDAO();
		totalBookCount = bookDao.totalBookCount();
		
		return totalBookCount;
	}

	



}
