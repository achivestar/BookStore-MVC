package com.pe.admin.service;

import java.sql.SQLException;

import com.pe.admin.vo.FaqVo;
import com.pe.bluering.dao.FaqDAO;

public class FaqRegistService {

	public boolean faqRegist(FaqVo faqvo) throws SQLException {
		
		boolean isRegistSuccess = false;

		FaqDAO faqDao = new FaqDAO();
		
		int insertCount = 0;
		insertCount = faqDao.insertFaq(faqvo);
		System.out.println(insertCount);
		if(insertCount>0) {
			isRegistSuccess = true;
		}else {
			isRegistSuccess = false;
		}

		
		return isRegistSuccess;
		
	}

}
