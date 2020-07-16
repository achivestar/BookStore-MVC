package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.bluering.action.Action;

public class ProductWriteAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String url = "./ProductWriteForm.jsp";
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
