package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.service.ServiceCartAdd;
import com.pe.bluering.vo.CartVo;

public class addCartModify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		System.out.println("cart modify");
		String bookId = request.getParameter("bookId");
		System.out.println(bookId);
		int bookNum = Integer.parseInt(request.getParameter("bookNum"));
		System.out.println(bookNum);
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		ServiceCartAdd serviceCartAdd = new ServiceCartAdd();
		BookVo bookList = serviceCartAdd.getBookList(bookId); //도서의 정보 하나를 얻어옴
		
		int success = serviceCartAdd.modifyCart(memberId,bookNum,bookId);
		System.out.println(success);

		if(success>0) {
			ArrayList<CartVo> cartList = serviceCartAdd.selectCart(memberId);
			request.setAttribute("cartList", cartList);
			String url = "/member/cart.jsp";	
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		    dispatcher.forward(request, response);
		   
		}

	}

}
