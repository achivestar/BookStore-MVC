package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.bluering.service.MemberChoiceService;
import com.pe.bluering.service.OrderService;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.MemberVO;
import com.pe.bluering.vo.OrderVo;

public class OrderList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
	

		String url = "/member/orderList.jsp";
		
	
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);

	}

}
