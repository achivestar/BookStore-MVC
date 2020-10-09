package com.pe.admin.service;

import java.sql.SQLException;

import com.pe.admin.vo.FaqVo;
import com.pe.bluering.dao.FaqDAO;

public class ServiceFaqUpdate {

	public int updateFaq(FaqVo faqvo) throws SQLException {
		int isModifySuccess = 0;

		FaqDAO faqDao = new FaqDAO();

		isModifySuccess = faqDao.faqUpdate(faqvo);
		System.out.println("Update Service : " + isModifySuccess);

		
		if(isModifySuccess>0) {
			isModifySuccess = 1;
		}else {
			isModifySuccess = 0;
		}

		
		return isModifySuccess;
	}

}
