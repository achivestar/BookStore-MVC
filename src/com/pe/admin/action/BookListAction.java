package com.pe.admin.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.BookListService;
import com.pe.admin.vo.BookVo;
import com.pe.bluering.dao.BookDAO;
import com.pe.bluering.vo.PageInfo;

public class BookListAction implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {	  

			int page = 1;
			int limit = 10;
		
			String filter = request.getParameter("category");

		
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				System.out.println("page : "+page);
			} 
			

			
			BookListService bookListService = new BookListService();
			int listCount = bookListService.getListCount(filter);
			//총 리스트 수를 받아옴
			
			ArrayList<BookVo> bookList = bookListService.getBookList(page,limit,filter);
			//총 리스트를 받아옴
			
			int maxPage = (int)((double)listCount/limit+0.95);
			//0.95.를 더해서 올림처리?
			
			//현재 페이지에 보여줄 시작페이지수 1,11,21..
			int startPage = (((int)((double)page/10 + 0.9))-1)*10+1;
			
			
			//현재 페이지에 보여줄 마지막페이지 수 (10,20,30),,
			int endPage = startPage+10-1;
			
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("bookList", bookList);
			request.setAttribute("filter", filter);

			ArrayList<BookVo> bookCount = bookListService.getBooksCount();
			request.setAttribute("bookCount", bookCount);
			
			int totalBookCount = bookListService.totalBookCount();
			request.setAttribute("totalBookCount", totalBookCount);
			
			String url = "./product/bookList.jsp";
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);

		 try {
			dispatcher.forward(request, response);

		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
