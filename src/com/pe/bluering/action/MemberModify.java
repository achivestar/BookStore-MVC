package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.bluering.service.ServiceMemberModify;
import com.pe.bluering.vo.MemberVO;

public class MemberModify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberVO mvo = new MemberVO();
		//System.out.println(id);
		ServiceMemberModify memberModify = new ServiceMemberModify();
		
		mvo = memberModify.getMember(id);
		
		request.setAttribute("mvo", mvo);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("./Board.do?command=memberModifyForm");
		dispatcher.forward(request, response);
		
	}

}
