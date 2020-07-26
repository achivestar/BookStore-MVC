package com.pe.admin.service;
import java.util.ArrayList;
import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookSearchService {

	public ArrayList<BookVo> getSearchBookList(String searchKey, String type) {

		ArrayList<BookVo> bookList = null;
		BookDAO bookDao = new BookDAO();
		bookList = bookDao.searchBook(searchKey,type);
		
		System.out.println("서비스"+bookList);
		return bookList;
	}

}
