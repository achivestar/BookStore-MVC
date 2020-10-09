package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.FaqListService;
import com.pe.admin.service.FaqRegistService;
import com.pe.admin.vo.BookVo;
import com.pe.admin.vo.FaqVo;

public class FaqListAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		 FaqListService faqListService = new FaqListService();
		 ArrayList<FaqVo> faqOrderList = faqListService.getOrderFaqList();
		 request.setAttribute("faqOrderList", faqOrderList);
		 
		 ArrayList<FaqVo> faqDeliveryList = faqListService.getDeliveryFaqList();
		 request.setAttribute("faqDeliveryList", faqDeliveryList);
		 
		 ArrayList<FaqVo> faqMemberList = faqListService.getMemberFaqList();
		 request.setAttribute("faqMemberList", faqMemberList);
		 
		 String url = "./faq/faqList.jsp";
		  RequestDispatcher dispatcher = request.getRequestDispatcher(url);

		 try {
			dispatcher.forward(request, response);

		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 	

	}

}
