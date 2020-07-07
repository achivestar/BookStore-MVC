package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pe.bluering.service.BoardWriteProService;
import com.pe.bluering.vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 String savePath = "./upload";
		 String realFolder = "";
		 
		 int fileSize = 5*1024*1024;
		 String encType = "UTF-8";
		 
		 ServletContext context = request.getServletContext();
		 realFolder = context.getRealPath(savePath);
		 MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",new DefaultFileRenamePolicy());
		 
		 BoardBean boardBean = new BoardBean();
		 boardBean.setBoard_subject(multi.getParameter("board_subject"));
		 boardBean.setBoard_content(multi.getParameter("board_content"));
		 boardBean.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		 
		 BoardWriteProService boardWriteProService = new BoardWriteProService();
		 boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		 
		 if(!isWriteSuccess) {
			 response.setContentType("text/html;charset=UTF-8");
			 out.println("<script>");
			 out.println("alert('등록실패');");	
			 out.println("history.back();");
			 out.println("</script>");
		 }else {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("./Board.do?command=board_list");
			 dispatcher.forward(request, response);
		 }
	}

}
