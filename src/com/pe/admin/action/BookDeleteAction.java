package com.pe.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pe.admin.service.BookDeleteService;

public class BookDeleteAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
		 String bookId = request.getParameter("myBookId");
		 
		 BookDeleteService  bookDelete= new BookDeleteService();
		
		  int isDeleteSuccess = bookDelete.bookDelete(bookId,request);
		
		  System.out.println("Delete Action"+isDeleteSuccess);
		  if(isDeleteSuccess>0) {
				 response.setContentType("text/html;charset=UTF-8");
				 PrintWriter out = response.getWriter();
				out.println("success");
				return;
		  }else{
				 response.setContentType("text/html;charset=UTF-8");
				 PrintWriter out = response.getWriter();
				out.println("fail");
				return;
		  }
	}

}
