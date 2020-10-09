package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.pe.bluering.dao.OrderDAO;

public class bookOrderPeriodLoading implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		System.out.println(sdate+","+edate);
		
	    OrderDAO orderdao = new OrderDAO();
	    JSONArray arr = orderdao.getOrderBookLoading(sdate,edate);
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
