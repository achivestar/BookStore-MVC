 package com.pe.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pe.admin.service.BookRegistService;
import com.pe.admin.vo.BookVo;
import com.pe.bluering.service.MemberModProService;

public class BookRegistAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");


		 
		 String savePath = "./bookUpload";
		 String realFolder = "";
		 
		 int fileSize = 5*1024*1024;
		 String encType = "UTF-8";
		 
		 ServletContext context = request.getServletContext();
		 realFolder = context.getRealPath(savePath);
		 MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",new DefaultFileRenamePolicy());
		 
		
		BookVo bookvo = new BookVo();
		String bookId = "B"+System.currentTimeMillis();
		
		bookvo.setBookId(bookId);
		bookvo.setBookName(multi.getParameter("bookName"));
		bookvo.setBookSubTitle(multi.getParameter("bookSubTitle"));
		bookvo.setAuthor(multi.getParameter("author"));
		bookvo.setPublishing(multi.getParameter("publishing"));
		bookvo.setPublishDay(multi.getParameter("publishDay"));
		bookvo.setCost(multi.getParameter("cost"));
		bookvo.setRate(Integer.parseInt(multi.getParameter("rate")));
		bookvo.setSellingPrice(multi.getParameter("sellingPrice"));
	    bookvo.setPageNum(Integer.parseInt(multi.getParameter("pageNum")));
	    bookvo.setWeight(Integer.parseInt(multi.getParameter("weight")));
		bookvo.setSize(multi.getParameter("size"));

		bookvo.setCategory1(multi.getParameter("category1"));
		bookvo.setCategory2(multi.getParameter("category2"));
		bookvo.setComment(multi.getParameter("comment"));
		
		String customFile = multi.getParameter("bookImage");
		 Enumeration<String> fileNames = multi.getFileNames();
		 if(fileNames.hasMoreElements()) {
			 String fileName = fileNames.nextElement();
			 String updateFile = multi.getFilesystemName(fileName);
			 
			 if(updateFile == null) {
				 bookvo.setBookImage(customFile);
			 }else {
				 bookvo.setBookImage(updateFile);
			 }
		 }


		  bookvo.setBestProduct(multi.getParameter("bestProduct"));
		  bookvo.setTodayProduct(multi.getParameter("todayProduct"));
		  bookvo.setHiddenProduct(multi.getParameter("hiddenProduct"));
	
	 
	  
	  BookRegistService  bookRes = new BookRegistService();
	  boolean isRegitSuccess = bookRes.bookRegist(bookvo);
		
	  if(isRegitSuccess) {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('상품등록성공');");
			 out.println("location.href='./AdminController.do?command=productWriteForm'");
			 out.println("</script>");
	  }else {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('상품등록실패');");
			 out.println("location.href='./AdminController.do?command=productWriteForm'");
			 out.println("</script>");
	  }

	}

}
