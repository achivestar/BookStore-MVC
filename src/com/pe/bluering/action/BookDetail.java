package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pe.admin.service.BookListService;
import com.pe.admin.vo.BookVo;


public class BookDetail implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String url = "/sub/bookDetail.jsp";
		String bookId = request.getParameter("bookId");
		
		BookListService oneSelectBook = new BookListService();
		BookVo oneBook = oneSelectBook.getOneBook(bookId);
		Cookie bookIdCookie = new Cookie("bookId"+bookId, oneBook.getBookId());
		bookIdCookie.setMaxAge(60*60*24);
		response.addCookie(bookIdCookie);

		
		request.setAttribute("oneBook", oneBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}

}
