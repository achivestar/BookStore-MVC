package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.pe.bluering.dao.BookDAO;
import com.pe.bluering.dao.OrderDAO;

public class bookOrderLoading implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		System.out.println("dd");
		int cate = Integer.parseInt(request.getParameter("category"));
		System.out.println(cate);
	    OrderDAO orderdao = new OrderDAO();
	    JSONArray arr = orderdao.getOrderBookLoading(cate);
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
