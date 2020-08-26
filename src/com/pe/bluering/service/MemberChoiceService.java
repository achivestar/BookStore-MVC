package com.pe.bluering.service;

import java.sql.SQLException;
import com.pe.bluering.dao.MemberDAO;
import com.pe.bluering.vo.MemberVO;

public class MemberChoiceService {

	public MemberVO getOneMember(String memberId) throws SQLException {
		
		MemberVO memberList = null;
		MemberDAO memberDao = new MemberDAO();
		memberList = memberDao.getMember(memberId);
		return memberList;
	}

}
