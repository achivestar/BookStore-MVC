package com.pe.bluering.service;


import java.sql.SQLException;
import com.pe.bluering.dao.MemberDAO;


public class LoginProService {

	public int loginService(String id, String pass) throws SQLException {
		
		int isSuccess = 0;
		//Connection con = JdbcUtil.getConnection();//DBCP¿ë
		MemberDAO memberDao = new MemberDAO();

		
		 isSuccess = memberDao.loginPro(id,pass);
		 System.out.println(isSuccess);
		return isSuccess;
	}

}
