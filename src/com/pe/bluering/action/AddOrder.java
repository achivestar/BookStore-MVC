package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.service.MemberChoiceService;
import com.pe.bluering.service.OrderService;
import com.pe.bluering.service.ServiceCartAdd;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.MemberVO;
import com.pe.bluering.vo.OrderVo;

public class AddOrder implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("AddOrder");
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		System.out.println(cart_id);
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		
	
		
		OrderService orderService = new OrderService();
		CartVo cartOneList = orderService.getOneCartList(cart_id);
		MemberChoiceService memberService = new MemberChoiceService();
		MemberVO oneMember = memberService.getOneMember(memberId);
		
		HttpSession psession = request.getSession();
		psession.removeAttribute("cartAllList");
		psession.setAttribute("cartOneList", cartOneList);
		HttpSession msession = request.getSession();
		msession.setAttribute("oneMember", oneMember);

		
	}

}
