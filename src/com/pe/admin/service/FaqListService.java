package com.pe.admin.service;

import java.util.ArrayList;

import com.pe.admin.vo.BookVo;
import com.pe.admin.vo.FaqVo;
import com.pe.admin.vo.QnaVo;
import com.pe.bluering.dao.FaqDAO;
import com.pe.bluering.dao.QnaDAO;

public class FaqListService {

	public ArrayList<FaqVo> getOrderFaqList() {
	
		ArrayList<FaqVo> faqList = null;
		FaqDAO faqDao = new FaqDAO();
		faqList = faqDao.getOrderFaqList();
		
		return faqList;
	}

	public ArrayList<FaqVo> getDeliveryFaqList() {
		ArrayList<FaqVo> faqList = null;
		FaqDAO faqDao = new FaqDAO();
		faqList = faqDao.getDeliveryFaqList();
		
		return faqList;
	}

	public ArrayList<FaqVo> getMemberFaqList() {
		ArrayList<FaqVo> faqList = null;
		FaqDAO faqDao = new FaqDAO();
		faqList = faqDao.getMemberFaqList();
		
		return faqList;
	}

	public ArrayList<QnaVo> getQnaList() {
		ArrayList<QnaVo> qnaList = null;
		QnaDAO qnaDao = new QnaDAO();
		qnaList = qnaDao.getQnaList();
		
		return qnaList;
	}

}
