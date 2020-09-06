package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.bluering.service.OrderSucessService;
import com.pe.bluering.vo.OrderVo;

public class OrderSucess implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		String memberId =  (String) session.getAttribute("memberId");
		System.out.println("세션:"+memberId);
		int limitPoint = (int) session.getAttribute("limitPoint");
		System.out.println("limitPoint" + limitPoint);
		OrderSucessService ordersuccess = new OrderSucessService();
		ArrayList<OrderVo> orderList = ordersuccess.selectOrder(memberId);
		request.setAttribute("orderList", orderList);
		String url = "/member/orderSuccess.jsp?memberId="+memberId+"&limitPoint="+limitPoint;
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
