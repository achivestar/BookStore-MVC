package com.pe.bluering.service;

import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookSearchService {
	public ArrayList<BookVo> getSearchBookList(String searchKey) {
		
		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.searchBook(searchKey);
		
		System.out.println("서비스"+bookList);
		return bookList;
	}

}
