package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.BookListService;
import com.pe.admin.vo.BookVo;
import com.pe.bluering.action.Action;

public class ProductWriteAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		
		
		String url = "./product/ProductWriteForm.jsp";
		
		BookListService bookListService = new BookListService();
		ArrayList<BookVo> bookCount = bookListService.getBooksCount();
		request.setAttribute("bookCount", bookCount);
		
		int totalBookCount = bookListService.totalBookCount();
		request.setAttribute("totalBookCount", totalBookCount);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
