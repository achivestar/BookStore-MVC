package com.pe.bluering.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.db.JdbcUtil;
import com.pe.bluering.vo.MemberVO;

public class MemberJoinProService {

	public boolean registJoin(MemberVO memberVo) throws SQLException {
		
		boolean isJoinSuccess = false;
    	//	Connection con = JdbcUtil.getConnection();   //DBCP¿ë
		MemberDAO memberDao = new MemberDAO();
		
		int insertCount = memberDao.insertMember(memberVo);
		System.out.println(insertCount);
		if(insertCount>0) {
			isJoinSuccess = true;
		}else {
			isJoinSuccess = false;
		}

		
		return isJoinSuccess;
		
		
	}

}
