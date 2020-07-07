package com.pe.bluering.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class memberModifyForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/memberModify.jsp";
		
		RequestDispatcher rd =request.getRequestDispatcher(url);    
		rd.forward(request, response); 
	}

}
