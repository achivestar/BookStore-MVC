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

public class BookModifyAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String bookId = request.getParameter("myBookId");
		System.out.println(bookId);
		System.out.println("Modify넘어옴?");
		String url = "./product/bookModify.jsp";
	    //DB에서 bookId 의 값을 가지고 와서 vo에 담아서  bookDetail.jsp로 넘긴다
  		//request.setAttribute("bookId", bookId);

		BookListService oneSelectBook = new BookListService();
		ArrayList<BookVo> oneBook = oneSelectBook.getOneBook(bookId);
		
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
