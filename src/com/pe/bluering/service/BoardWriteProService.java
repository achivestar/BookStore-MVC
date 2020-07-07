package com.pe.bluering.service;

import java.sql.Connection;

import com.pe.bluering.dao.BoardDAO;
import com.pe.bluering.db.JdbcUtil;
import com.pe.bluering.vo.BoardBean;

public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) {
		
		boolean isWriteSuccess = false;
		Connection con = JdbcUtil.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount>0) {
			isWriteSuccess = true;
		}else {
			isWriteSuccess = false;
		}

		
		return isWriteSuccess;
	}

}
