package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.bluering.service.ServiceQna;

public class QnaRegistAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
			String question = request.getParameter("question");
			String content = request.getParameter("content");
			String member = request.getParameter("member");
			
			ServiceQna serviceqnaregist = new ServiceQna();
			int success = serviceqnaregist.registQna(question,content,member);
			
			PrintWriter out = response.getWriter();
			out.println(success);

	}

}
