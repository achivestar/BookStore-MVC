package com.pe.admin.service;

import java.io.File;
import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookDeleteService {

	public int bookDelete(String bookId) {
		int isDeleteSuccess = 0;

		BookDAO bookDao = new BookDAO();
		ArrayList<BookVo> bookVo = new ArrayList<BookVo>();
		
		bookVo = bookDao.selectOneBook(bookId);
		String bookImg  = null;
		for(int i=0; i<bookVo.size(); i++) {
			bookImg = bookVo.get(i).getBookImage();
			System.out.println(bookImg);
		}
		File f = new File("./bookUpload/" + bookImg);
		if(f.exists()){
			f.delete();
			System.out.println("파일 삭제됨");
		}else{
			System.out.println("파일 없음");
		}
		isDeleteSuccess = bookDao.bookDelete(bookId);
		System.out.println(isDeleteSuccess);
		
		if(isDeleteSuccess>0) {
			isDeleteSuccess = 1;
		}

		
		return isDeleteSuccess;
	}

}
