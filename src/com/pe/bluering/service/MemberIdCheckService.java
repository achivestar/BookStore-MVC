package com.pe.bluering.service;

import java.sql.SQLException;

import com.pe.bluering.dao.MemberDAO;
public class MemberIdCheckService {

	public int MemberIdCheck(String id) throws SQLException {
	
		int isIdCheck = 0;

		MemberDAO memberDao = new MemberDAO();

		int idCheck = memberDao.idCheck(id);
		System.out.println(idCheck);
		if(idCheck==1) {
			isIdCheck = 1;
		}else {
			isIdCheck = 0;
		}

		
		return isIdCheck;
	}

}
