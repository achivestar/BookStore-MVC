package com.pe.bluering.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.service.LoginProService;
import com.pe.bluering.vo.CouponVO;
import com.pe.bluering.vo.MemberVO;

public class LoginProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
		 MemberDAO mdao = new MemberDAO();
		 MemberDAO cdao = new MemberDAO();
		 MemberDAO cdaos = new MemberDAO();
		 String url = "";
		 String id = request.getParameter("userID");
	     String pass = request.getParameter("userPassword");
	     String site = request.getParameter("site");
		System.out.println(id+" "+pass+" "+site);
		 LoginProService loginservice = new LoginProService();
		 int isLoginSuccess = loginservice.loginService(id,pass);
		 System.out.println("로그인 여부 :"+isLoginSuccess);
		 if(isLoginSuccess == 1) {
			 MemberVO mvo = mdao.getMember(id);  //회원인증에 성공했으므로 회원정보를 얻어온다.
			
			ArrayList<CouponVO> cp = cdaos.getCoupon(id);
			 int ccount = cdao.getCountCoupon(id);
			 HttpSession session = request.getSession();
		     session.setAttribute("loginUser",mvo);
			 session.setAttribute("id",id);
			 session.setAttribute("couponList", cp);
			 session.setAttribute("ccount",ccount);
			 System.out.println("로그인 성공");
			 if(site.equals("cart")) {
				 url = "./Controller.do?command=cart";
			 }else if(site.equals("mypage")) {
				 url = "./Controller.do?command=mypage";
			 }else {
				 url = "./Controller.do?command=index";
			 }
			
		 }else if(isLoginSuccess == 0) {
			 request.setAttribute("message","비밀번호가 일치하지 않습니다.");
			 url = "./Controller.do?command=login_form";
			 
		 }else {
			 request.setAttribute("message","존재하지 않는 회원입니다.");
			 url = "./Controller.do?command=login_form";
		 }
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 dispatcher.forward(request, response);

	}

}
