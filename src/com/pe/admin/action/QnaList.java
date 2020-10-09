package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.FaqListService;
import com.pe.admin.vo.FaqVo;
import com.pe.admin.vo.QnaVo;

public class QnaList implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		 FaqListService  qnaListService = new FaqListService();
		 ArrayList<QnaVo> qnaList = qnaListService.getQnaList();
		 request.setAttribute("qnaList", qnaList);
		
		 String url = "./faq/qnaList.jsp";
		  RequestDispatcher dispatcher = request.getRequestDispatcher(url);

		 try {
			dispatcher.forward(request, response);

		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
