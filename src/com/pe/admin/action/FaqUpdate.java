package com.pe.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.ServiceFaqUpdate;
import com.pe.admin.vo.FaqVo;

public class FaqUpdate implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int num = Integer.parseInt(request.getParameter("num"));
		int faqCategory  = Integer.parseInt(request.getParameter("faqCategory"));
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		System.out.println(num+","+faqCategory+","+question+","+answer);
		
		FaqVo faqvo = new FaqVo();
		faqvo.setNum(num);
		faqvo.setCategory(faqCategory);
		faqvo.setQuestion(question);
		faqvo.setAnswer(answer);
		
		ServiceFaqUpdate servicefaqupdate = new ServiceFaqUpdate();
		int modifySuccess = servicefaqupdate.updateFaq(faqvo);
		
		PrintWriter out = response.getWriter();
		out.println(modifySuccess);
		
		

	}

}
