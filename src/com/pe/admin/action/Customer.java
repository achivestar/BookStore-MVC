package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Customer implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String url = "./customer.jsp";
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
