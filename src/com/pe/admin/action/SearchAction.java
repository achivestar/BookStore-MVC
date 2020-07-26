package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.pe.admin.service.BookSearchService;
import com.pe.admin.vo.BookVo;

public class SearchAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String url = "./product/bookSearch.jsp";
		
		String searchKey = request.getParameter("searchKey");
		System.out.println(searchKey);
		String type = request.getParameter("type");
		BookSearchService bookSearchService = new BookSearchService();
		ArrayList<BookVo> searchList = bookSearchService.getSearchBookList(searchKey,type);
		System.out.println("액션 : " +searchList);
         request.setAttribute("searchList",searchList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		/*
		 * for(int i=0; i<bookList.size();i++) {
		 * System.out.println(bookList.get(i).getBookName()); }
		 */
	}

}
