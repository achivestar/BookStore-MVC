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
		
		String fileDir = "bookUpload";
		String fileName =  bookImg;
		String filePath = request.getRealPath(fileDir) + "/";
		filePath += fileName;
		File f = new File(filePath);
		if(f.exists()){
			f.delete();
			System.out.println("파일삭제 ");
		}else {
			System.out.println("파일없음");
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
