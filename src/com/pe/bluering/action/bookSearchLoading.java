package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.pe.bluering.dao.BookDAO;

public class bookSearchLoading implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String searchKey = request.getParameter("searchKey");
		BookDAO bookdao = new BookDAO();
		System.out.println("BookSearchLoading"+searchKey);
		JSONArray arr = bookdao.getSearchBookLoading(searchKey);
		System.out.println("Loading :"+arr);
		if(arr != null) {
			PrintWriter out ;
			try {
				out = response.getWriter();
				out.print(arr);
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
