package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pe.bluering.service.MemberIdCheckService;


public class IdCheck implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
		 String id = request.getParameter("id");
		 System.out.println(id);
		 MemberIdCheckService memberIdCheck = new MemberIdCheckService();
		 int res = memberIdCheck.MemberIdCheck(id);
		 
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = response.getWriter();
		 
		 out.print(res);

	}

}
