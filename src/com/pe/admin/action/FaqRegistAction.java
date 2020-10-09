package com.pe.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.BookRegistService;
import com.pe.admin.service.FaqRegistService;
import com.pe.admin.vo.FaqVo;

public class FaqRegistAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		int category = Integer.parseInt(request.getParameter("faqCategory"));
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		FaqVo faqvo = new FaqVo();
		faqvo.setCategory(category);
		faqvo.setQuestion(question);
		faqvo.setAnswer(answer);
		
		  FaqRegistService  faqRes = new FaqRegistService();
		  boolean isRegitSuccess = faqRes.faqRegist(faqvo);
			
		  if(isRegitSuccess) {
				 response.setContentType("text/html;charset=UTF-8");
				 PrintWriter out = response.getWriter();
				 out.println("<script>");
				 out.println("alert('등록성공');");
				 out.println("location.href='./AdminController.do?command=FaqList'");
				 out.println("</script>");
		  }else {
				 response.setContentType("text/html;charset=UTF-8");
				 PrintWriter out = response.getWriter();
				 out.println("<script>");
				 out.println("alert('등록실패');");
				 out.println("location.href='./AdminController.do?command=FaqForm'");
				 out.println("</script>");
		  }

	}

}
