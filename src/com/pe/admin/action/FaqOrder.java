package com.pe.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.service.FaqOrderService;
import com.pe.admin.vo.FaqVo;
import com.pe.bluering.service.OrderService;
import com.pe.bluering.vo.OrderVo;

public class FaqOrder implements AdminAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		    ArrayList<FaqVo> faqList = new ArrayList<FaqVo>();
		    String [] numArr = request.getParameterValues("num");
		    int [] num = new int[numArr.length];
		    
		    String [] orderArr = request.getParameterValues("order");
		    int [] order = new int[orderArr.length];
		    
		    int div = Integer.parseInt(request.getParameter("div"));
		    
		    for(int i=0; i<numArr.length;i++) {
		    	FaqVo faqvo = new FaqVo();
		    	num[i] = Integer.parseInt(numArr[i]);
		    	faqvo.setNum(num[i]);
		        order[i] = Integer.parseInt(orderArr[i]);
		        faqvo.setOrder(order[i]);
		        faqList.add(faqvo);
		    }
		    
		    FaqOrderService faqorderservice = new FaqOrderService();
			int success = faqorderservice.modifyOrder(faqList,div);
			
			PrintWriter out = response.getWriter();
			out.print(success);

	}

}
