package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.service.LoginProService;
import com.pe.bluering.vo.MemberVO;

public class LoginProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
		 MemberDAO mdao = new MemberDAO();
		 String url = "";
		 String id = request.getParameter("userID");
	    String pass = request.getParameter("userPassword");
	    String site = request.getParameter("site");
		System.out.println(id+" "+pass);
		 LoginProService loginservice = new LoginProService();
		 int isLoginSuccess = loginservice.loginService(id,pass);
		 
		 if(isLoginSuccess == 1) {
			MemberVO mvo = mdao.getMember(id);  //ȸ�������� ���������Ƿ� ȸ�������� ���´�.
			 HttpSession session = request.getSession();
		     session.setAttribute("loginUser",mvo);
			 session.setAttribute("id",id);
			 System.out.println("�α��� ����");
			 if(site.equals("cart")) {
				 url = "./Board.do?command=cart";
			 }else if(site.equals("mypage")) {
				 url = "./Board.do?command=mypage";
			 }else {
				 url = "./Board.do?command=index";
			 }
			
		 }else if(isLoginSuccess == 0) {
			 request.setAttribute("message","��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			 url = "./Board.do?command=login_form";
			 
		 }else {
			 request.setAttribute("message","�������� �ʴ� ȸ���Դϴ�.");
			 url = "./Board.do?command=login_form";
		 }
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 dispatcher.forward(request, response);

	}

}
