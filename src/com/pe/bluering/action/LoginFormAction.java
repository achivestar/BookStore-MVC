package com.pe.bluering.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	String site = request.getParameter("site");
   String url = "/member/login.jsp";
		
		if(site != null) {
			if(site.equals("cart")) {
				 url = "/member/login.jsp?site=cart";
			}else if(site.equals("mypage")) {
				 url = "/member/login.jsp?site=mypage";
			}

		}
	
		System.out.println(site);
		
		RequestDispatcher rd =request.getRequestDispatcher(url);    
		rd.forward(request, response); 

	}

}
