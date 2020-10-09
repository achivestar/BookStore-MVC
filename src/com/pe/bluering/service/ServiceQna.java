package com.pe.bluering.service;

import java.sql.SQLException;
import com.pe.bluering.dao.QnaDAO;

public class ServiceQna {

	public int registQna(String question, String content, String member) throws SQLException {
		
		int successCount = 0;
		QnaDAO qnaDao = new QnaDAO();
		successCount = qnaDao.insertQna(question,content,member);
		
		return successCount;
	}

}
