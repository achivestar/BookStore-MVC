package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pe.bluering.service.MemberModProService;
import com.pe.bluering.vo.MemberVO;

public class memberModifyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		
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
		 
		 String customFile = multi.getParameter("customFile");
		// String profileImg = multi.getParameter("profileImg");
		 Enumeration<String> fileNames = multi.getFileNames();
		 if(fileNames.hasMoreElements()) {
			 String fileName = fileNames.nextElement();
			 String updateFile = multi.getFilesystemName(fileName);
			 
			 if(updateFile == null) {
				 memberVo.setProfileimg(customFile);
			 }else {
				 memberVo.setProfileimg(updateFile);
			 }
		 }


		 memberVo.setPhone(phone1+"-"+phone2+"-"+phone3);
		 

		 MemberModProService memberMod = new MemberModProService();
		 
		 boolean isMemberUpdateSuccess = memberMod.memberModify(memberVo);
		 
		if(isMemberUpdateSuccess==false) {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('수정실패');");
			 out.println("location.href='./Controller.do?command=index'");
			 out.println("</script>");

		}else {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('수정성공');");
			 out.println("location.href='./Controller.do?command=index'");
			 out.println("</script>");

			// RequestDispatcher dispatcher = request.getRequestDispatcher("./Board.do?command=login_form");
			// dispatcher.forward(request, response);

    	 }


	}

}
