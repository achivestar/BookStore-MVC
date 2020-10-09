package com.pe.admin.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.pe.admin.vo.FaqVo;
import com.pe.bluering.dao.FaqDAO;

public class FaqOrderService {

	public int modifyOrder(ArrayList<FaqVo> faqList, int div) throws SQLException {
		
		int isModifySuccess = 0;

		FaqDAO faqDao = new FaqDAO();

		isModifySuccess = faqDao.modifyOrder(faqList,div);
		System.out.println("Update Service : " + isModifySuccess);

		
		if(isModifySuccess>0) {
			isModifySuccess = 1;
		}else {
			isModifySuccess = 0;
		}

		
		return isModifySuccess;
	}

}
