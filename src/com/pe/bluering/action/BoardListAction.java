package com.pe.bluering.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.bluering.service.BoardListService;
import com.pe.bluering.vo.BoardBean;
import com.pe.bluering.vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		ArrayList<BoardBean> articlelist = new ArrayList<BoardBean>();
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount();
		articlelist = boardListService.getArticleList(page,limit);
		
		// 총페이지수
		int maxPage = (int)((double) listCount/limit+0.95);
		//현재 페이지에 보여줄 시작 페이지 수 1,11,21 ..
		int startPage =(((int) ((double)page/10 + 0.9))-1)*10 + 1;
		//현재 패이제에 보여줄 마지막 페이지 수 10.20,30  등
		int endPage = startPage + 10 -1;
		
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articlelist);
		
		RequestDispatcher dis = request.getRequestDispatcher("/board/board_list.jsp");
		try {
			dis.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
