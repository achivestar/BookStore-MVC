package com.pe.bluering.service;


import java.sql.SQLException;
import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.vo.MemberVO;

public class ServiceMemberModify {

		//Connection con = JdbcUtil.getConnection();  //DBCP¿ë
		MemberDAO memberDao = new MemberDAO();
	

	public MemberVO getMember(String id) throws SQLException {

		return memberDao.getMember(id);
	}

}
