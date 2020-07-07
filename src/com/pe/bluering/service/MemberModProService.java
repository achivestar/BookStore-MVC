package com.pe.bluering.service;

import java.sql.SQLException;

import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.vo.MemberVO;

public class MemberModProService {

	public boolean memberModify(MemberVO memberVo) throws SQLException {
		boolean isJoinSuccess = false;
		
    	//	Connection con = JdbcUtil.getConnection();   //DBCP¿ë
		MemberDAO memberDao = new MemberDAO();
		
		int member = memberDao.updateMember(memberVo);
		System.out.println(member);
		if(member>0) {
			isJoinSuccess = true;
		}else {
			isJoinSuccess = false;
		}

		
		return isJoinSuccess;
	}

}
