package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookOrder implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		System.out.println("주문페이지");
		String bookId = request.getParameter("bookId");
		System.out.println(bookId);
		int bookNum = Integer.parseInt(request.getParameter("bookNum"));
		System.out.println(bookNum);
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);

	}

}
