package com.pe.bluering.service;

import static com.pe.bluering.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pe.bluering.dao.BoardDAO;
import com.pe.bluering.db.JdbcUtil;
import com.pe.bluering.vo.BoardBean;

public class BoardListService {

	public int getListCount() {
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) {
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
	}

	

}
