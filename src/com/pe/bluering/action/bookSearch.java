package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.service.BookSearchService;

public class bookSearch implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String url = "/sub/search.jsp";
		
		String searchKey = request.getParameter("searchKey");
		System.out.println(searchKey);
		BookSearchService bookSearchService = new BookSearchService();
		ArrayList<BookVo> searchList = bookSearchService.getSearchBookList(searchKey);
		System.out.println("액션 : " +searchList);
         request.setAttribute("searchList",searchList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
