package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.bluering.service.ServiceCartAdd;
import com.pe.bluering.service.ServiceCartDelete;
import com.pe.bluering.service.ServiceCartUpdate;
import com.pe.bluering.vo.CartVo;

public class CartDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("utf-8");
		ServiceCartAdd serviceCartAdd = new ServiceCartAdd();
	
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		System.out.println(cart_id);
		String memberId = request.getParameter("memberId");
		System.out.println(request.getParameter("memberId"));
		
		ServiceCartDelete serviceCartDelete =new ServiceCartDelete();
		int success = serviceCartDelete.deleteCart(cart_id);
		

		String url = "./Controller.do?command=cart&memberId="+memberId;
		
		if(success>0) {
			System.out.println("Cart Delete Success");
			ArrayList<CartVo> cartList = serviceCartAdd.selectCart(memberId);
			request.setAttribute("cartList", cartList);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}

	}

}
