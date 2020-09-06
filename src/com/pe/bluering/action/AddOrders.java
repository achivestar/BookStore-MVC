package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.bluering.service.MemberChoiceService;
import com.pe.bluering.service.OrderService;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.MemberVO;

public class AddOrders implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
			System.out.println("다중 orders");
			//String [] select =request.getParameterValues("orders");
			String memberId = request.getParameter("memberId");
			int point = Integer.parseInt(request.getParameter("point"));
			System.out.println(memberId);
			System.out.println("카트로 부터 넘어온 point " + point);
			
			//int [] choice = new int[select.length];
			//for(int i=0; i<6;i++) {
			//	choice[i] = Integer.parseInt(select[i]);
			//}
			
			OrderService orderService = new OrderService();
			ArrayList<CartVo> cartAllList = orderService.getAllCartList(memberId);
			MemberChoiceService memberService = new MemberChoiceService();
			MemberVO oneMember = memberService.getOneMember(memberId);
			
		
			HttpSession psession = request.getSession();
			psession.removeAttribute("cartOneList");
			psession.setAttribute("cartAllList", cartAllList);
			psession.setAttribute("point", point);
			HttpSession msession = request.getSession();
			msession.setAttribute("oneMember", oneMember);


	}

}
