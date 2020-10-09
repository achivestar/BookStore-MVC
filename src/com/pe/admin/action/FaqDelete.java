package com.pe.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.FaqListService;
import com.pe.admin.service.ServiceFaqDelete;
import com.pe.admin.service.ServiceFaqUpdate;
import com.pe.admin.vo.FaqVo;

public class FaqDelete implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int num = Integer.parseInt(request.getParameter("num"));
		ServiceFaqDelete servicefaqdelete = new ServiceFaqDelete();

		int deleteSuccess = servicefaqdelete.deleteFaq(num);

		PrintWriter out = response.getWriter();
		out.println(deleteSuccess);

	}

}
