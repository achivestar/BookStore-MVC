package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pe.bluering.service.MemberJoinProService;
import com.pe.bluering.vo.MemberVO;

public class MemberJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		// joinform 으로 부터 읽어온 회원의 정보들을 vo 객체에 저장하고
		//service 클래스를 따로 만들어서 vo 객체를 전달한 후
		// service 객체에서는 dao 객체에게 sql 실행을 하게 하여 결과 값을 반환 받고
		// 그 반환된 결과값을 다시 action 객체로 전달해서 성공 여부를 프린트 한다.
		
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");


		 
		 String savePath = "./upload";
		 String realFolder = "";
		 
		 int fileSize = 5*1024*1024;
		 String encType = "UTF-8";
		 
		 ServletContext context = request.getServletContext();
		 realFolder = context.getRealPath(savePath);
		 MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",new DefaultFileRenamePolicy());
		 

		 MemberVO memberVo = new MemberVO();
		 memberVo.setId(multi.getParameter("userID"));
		 memberVo.setPwd(multi.getParameter("userPassword"));
		 memberVo.setName(multi.getParameter("userName"));
		 memberVo.setEmail(multi.getParameter("userEmail"));
		 memberVo.setGender(multi.getParameter("userGender"));
		 memberVo.setZipnum(multi.getParameter("zipNum"));
		 memberVo.setAddr1(multi.getParameter("addr1"));
		 memberVo.setAddr2(multi.getParameter("addr2"));
		 String phone1 =  multi.getParameter("phone1");
		 String phone2 =  multi.getParameter("phone2");
		 String phone3 =  multi.getParameter("phone3");
		 memberVo.setPhone(phone1+"-"+phone2+"-"+phone3);
		 if(multi.getOriginalFileName((String) multi.getFileNames().nextElement())==null) {
			 memberVo.setProfileimg("default.jpg");
		 }else {
			 memberVo.setProfileimg(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		 }
		 
		 
		 MemberJoinProService memberJoinProService = new MemberJoinProService();
		 
		 boolean isMemberJoinSuccess = memberJoinProService.registJoin(memberVo);
		 
		if(!isMemberJoinSuccess) {
			 
			 
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('가입실패');");
			 out.println("location.href='./Board.do?command=join_form'");
			 out.println("</script>");

		}else {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('가입성공');");
			 out.println("location.href='./Board.do?command=login_form'");
			 out.println("</script>");

			// RequestDispatcher dispatcher = request.getRequestDispatcher("./Board.do?command=login_form");
			// dispatcher.forward(request, response);

    	 }

	}

}
