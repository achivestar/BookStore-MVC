package com.pe.bluering.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pe.bluering.service.OrderService;
import com.pe.bluering.vo.OrderVo;

public class BookOrder implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		System.out.println("실주문페이지");
		ArrayList<OrderVo> orderList = new ArrayList<OrderVo>();
	
		SimpleDateFormat formats = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		
		String memberId = request.getParameter("memberId");
		
		String [] cartIdArr = request.getParameterValues("cart_id");
	    int [] cart_id = new int[cartIdArr.length];
		
		HttpSession mid = request.getSession();
		mid.setAttribute("memberId", memberId);
		int point = Integer.parseInt(request.getParameter("point"));
		String deliveryTel = request.getParameter("deliveryTel");
		String deliveryAddr = request.getParameter("deliveryAddr");
		String message = request.getParameter("message");
		String buy_date = formats.format(time);
		int limitPoint = Integer.parseInt(request.getParameter("limitPoint"));
	 
	    String [] priceArr = request.getParameterValues("price");
	    int [] price = new int[priceArr.length];

	    
	    String [] amountArr = request.getParameterValues("amount");
	    int [] amount = new int[amountArr.length];

	    
	    String [] book_img =  request.getParameterValues("book_img");
	    String [] product_id = request.getParameterValues("product_id");
		String [] book_title = request.getParameterValues("book_title");
		
		for(int i=0; i<product_id.length;i++) {
			OrderVo ordervo = new OrderVo();
			int order_id = (int) System.currentTimeMillis();
			ordervo.setOrder_id(order_id+i);
			cart_id[i] = Integer.parseInt(cartIdArr[i]);
			ordervo.setCart_id(cart_id[i]);
			ordervo.setMember_id(memberId);
			ordervo.setDeliveryTel(deliveryTel);
			ordervo.setDeliveryAddr(deliveryAddr);
			ordervo.setMessage(message);    
			ordervo.setBook_title(book_title[i]);
			ordervo.setProduct_id(product_id[i]);
			ordervo.setBook_img(book_img[i]);
			ordervo.setBuy_date(buy_date);
			amount[i] = Integer.parseInt(amountArr[i]);
	    	ordervo.setAmount(amount[i]);
			
	    	price[i] = Integer.parseInt(priceArr[i]);
	    	ordervo.setPrice(price[i]);
	    	
			orderList.add(ordervo);
		}
		
		
		for(int i=0; i<orderList.size();i++) {
			System.out.println("memberId : " + orderList.get(i).getMember_id());
			System.out.println("cart_id : " + orderList.get(i).getCart_id());
			System.out.println("deliveryTel : " + orderList.get(i).getDeliveryTel());
			System.out.println("deliveryAddr : " + orderList.get(i).getDeliveryAddr());
			System.out.println("message : " + orderList.get(i).getMessage());
			System.out.println("product_id : " + orderList.get(i).getProduct_id());
			System.out.println("price: " + orderList.get(i).getPrice());
			System.out.println("amount: " + orderList.get(i).getAmount());
			System.out.println("bookTitel : " + orderList.get(i).getBook_title());
			System.out.println("bookImg : " + orderList.get(i).getBook_img());
			System.out.println("buyDate : " + orderList.get(i).getBuy_date());
			System.out.println("orderId : " + orderList.get(i).getOrder_id());
			System.out.println("limitPoint : " + limitPoint);
			System.out.println("---------------------------------------------------");
		}
		
		PrintWriter out = response.getWriter();
		OrderService orderservice = new OrderService();
		int success = orderservice.insertOneOrder(memberId,orderList,limitPoint,point);
		orderservice.modifyCart(cart_id);
		HttpSession session = request.getSession();
		session.setAttribute("limitPoint", limitPoint);
		System.out.println(success);
		if(success>0) {
			out.println("<script>");
			out.println("alert('주문에 성공하였습니다');");
			out.println("location.href='./Controller.do?command=orderSuccess'");
			out.println("</script>");

		}else {
			out.println("<script>");
			out.println("alert('주문에 실패하였습니다')");
			out.println("</script>");
			
		}
	}

}
