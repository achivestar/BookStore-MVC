package com.pe.admin.service;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;

public class BookDeleteService {

	public int bookDelete(String bookId, HttpServletRequest request) throws SQLException {
		int isDeleteSuccess = 0;

		BookDAO bookDao = new BookDAO();
		BookVo bookVo = new BookVo();
		
		bookVo = bookDao.selectOneBook(bookId);
		String bookImg  = bookVo.getBookImage();
		System.out.println(bookImg);
		

		ServletContext context = request.getServletContext();
		String realFolder = context.getRealPath("bookUpload");
		System.out.println(realFolder+"\\"+bookImg);

		File f = new File(realFolder+"\\"+bookImg);
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

		System.out.println("Delete Service " +isDeleteSuccess);
		return isDeleteSuccess;
	}

}
