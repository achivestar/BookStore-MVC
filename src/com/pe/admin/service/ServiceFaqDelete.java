package com.pe.admin.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pe.admin.vo.FaqVo;
import com.pe.bluering.dao.FaqDAO;

public class ServiceFaqDelete {

	public int deleteFaq(int num) throws SQLException {
		int isdeleteSuccess = 0;

		FaqDAO faqDao = new FaqDAO();
		isdeleteSuccess = faqDao.faqDelete(num);
		System.out.println("Delete Service : " + isdeleteSuccess);

		
		if(isdeleteSuccess>0) {
			isdeleteSuccess = 1;
		}else {
			isdeleteSuccess = 0;
		}

		
		return isdeleteSuccess;
	}

	public int getCount(int category) {
		int count = 0;

		FaqDAO faqDao = new FaqDAO();

		count = faqDao.getCount(category);

		
		if(count>0) {
			count = 1;
		}else {
			count = 0;
		}

		
		return count;
	}

}
