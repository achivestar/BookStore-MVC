package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String searchKey = request.getParameter("searchKey");
		String type = request.getParameter("type");
		System.out.println(searchKey);
		System.out.println(type);
	}

}
