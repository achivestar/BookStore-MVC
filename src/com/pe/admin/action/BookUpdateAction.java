package com.pe.admin.action;

import java.io.File;
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
import com.pe.admin.service.BookUpdateService;
import com.pe.admin.vo.BookVo;

public class BookUpdateAction implements AdminAction {

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

		
		bookvo.setBookId(multi.getParameter("bookId"));
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
		
		String customFile = multi.getParameter("customFile");
		 Enumeration<String> fileNames = multi.getFileNames();
		 if(fileNames.hasMoreElements()) {
			 String fileName = fileNames.nextElement();
			 String updateFile = multi.getFilesystemName(fileName);
			 
			 if(updateFile == null) {
				 bookvo.setBookImage(customFile);
			 }else {
//					File f = new File("./bookUpload/" + customFile);
//					if(f.exists()){
//						f.delete();
//						System.out.println("파일 삭제됨");
//					}else{
//						System.out.println("파일 없음");
//					}
				 bookvo.setBookImage(updateFile);
			 }
		 }
		

	bookvo.setBestProduct(multi.getParameter("bestProduct"));
	bookvo.setTodayProduct(multi.getParameter("todayProduct"));
	bookvo.setHiddenProduct(multi.getParameter("hiddenProduct"));
	
	
	  
	  BookUpdateService  bookUpdate= new BookUpdateService();
	  int isModifySuccess = bookUpdate.bookUpdate(bookvo);
		
	  if(isModifySuccess>0) {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('상품수정성공');");
			 out.println("location.href='./AdminController.do?command=BookList&page=1&category=0'");
			 out.println("</script>");
	  }else {
			 response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('상품수정실패');");
			 out.println("location.href='./AdminController.do?command=BookList&page=1&category=0'");
			 out.println("</script>");
	  }

	}

}
