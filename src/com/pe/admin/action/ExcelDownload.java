package com.pe.admin.action;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.BookListService;
import com.pe.admin.vo.BookVo;

public class ExcelDownload implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		
		// DB에서 모든 도서의 목록 조회
		BookListService bookService = new BookListService();
		List<BookVo> list = bookService.BookList();
		
		request.setAttribute("list", list);

		String url = "./product/excel.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
