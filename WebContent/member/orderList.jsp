<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@page import="com.pe.bluering.vo.CartVo"%>
<%@page import="com.pe.bluering.vo.OrderVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = (String)session.getAttribute("id");
 	 	int point = (int)session.getAttribute("point");
	   CartVo orderlist = (CartVo) session.getAttribute("cartOneList");
	   ArrayList<CartVo> orderlists = (ArrayList) session.getAttribute("cartAllList");
	   MemberVO memberList = (MemberVO) session.getAttribute("oneMember");
	   
	int total = 0;
	int addPrice = 0;
	int finalTotal = 0;
	int mypoint = memberList.getPoint();
	if(id==null){
%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href="./Controller.do?command=login_form";
	</script>
<%
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Bluering Book Store</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/custom.css">
    <!-- Bootstrap core CSS -->
   <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
   
<title>Insert title here</title>
</head>
<body>
   <div class="container">
 <jsp:include page="/top.jsp" /> 
 <main>
 <h2>주문내역</h2>    
 <form name="orderForm" method="post" action="./Controller.do?command=order">
			<div class="col-lg-12 row">
				<div class="col-md-10 col-lg-10" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">


						<div class="row">
							<div class="col-md-12">
								<div class="card bg-light">
									  <div class="card-header">
											장바구니<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
											  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg><span class="text-info"><b> 주문  </b></span>
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
											  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg>
											완료
									  </div>
									  <div class="card-body">
									      	<table class="table table-hover">
														  <thead>
															<tr class="table-primary">
															  <th scope="col" class="text-center">상품명</th>
															  <th scope="col" class="text-center">판매가</th>
															  <th scope="col" class="text-center">수량</th>
															  <th scope="col" class="text-center">합계</th>
															</tr>
														  </thead>
														  <tbody>
														    <%
														     if(orderlist!=null){ 		
														    	 total = orderlist.getBookPrice()*orderlist.getAmount(); 
														    		if(total>=30000){
																		addPrice = 0;
																	}else if(total==0){
																		addPrice = 0;
																	}else{
																		addPrice = 2500;
																	}
																	finalTotal = total+addPrice;
				 											 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderlist.getBookImg()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderlist.getBookName()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderlist.getBookPrice()%></td>
															  <td class="text-center align-middle">
															     <%=orderlist.getAmount() %>
															  	<input type="hidden" name="amount" value="<%=orderlist.getAmount() %>" />
															  	<input type="hidden" name="book_title" value="<%=orderlist.getBookName()%>" />
															    <input type="hidden" name="book_img" value="<%=orderlist.getBookImg()%>" />
															    <input type="hidden" name="price" value="<%=orderlist.getBookPrice()%>" />
															    <input type="hidden" name="product_id" value="<%=orderlist.getProductId()%>" />
															    <input type="hidden" name="cart_id" value="<%=orderlist.getCid()%>" />
															    </td>
															      <td class="text-center align-middle">
															      	<%=total %>
															      </td>
															</tr>
																<%
					 											 }
					 										%>	 
					 										
					 									 <%
					 										   if(orderlists!=null){
														    	for(int i=0; i<orderlists.size();i++){			
														    		total += orderlists.get(i).getBookPrice()*orderlists.get(i).getAmount();
														    		if(total>=30000){
																		addPrice = 0;
																	}else if(total==0){
																		addPrice = 0;
																	}else{
																		addPrice = 2500;
																	}
														    		finalTotal = (total+addPrice);
				 											 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderlists.get(i).getBookImg()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderlists.get(i).getBookName()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderlists.get(i).getBookPrice()%></td>
															  <td class="text-center align-middle">
															    <%=orderlists.get(i).getAmount() %>
															    <input type="hidden" name="amount" value="<%=orderlists.get(i).getAmount() %>" />
															  	<input type="hidden" name="book_title" value="<%=orderlists.get(i).getBookName()%>" />
															    <input type="hidden" name="book_img" value="<%=orderlists.get(i).getBookImg()%>" />
															    <input type="hidden" name="price" value="<%=orderlists.get(i).getBookPrice()%>" />
															    <input type="hidden" name="product_id" value="<%=orderlists.get(i).getProductId()%>" />
															    <input type="hidden" name="cart_id"  value="<%=orderlists.get(i).getCid()%>" />
															    </td>
															    <td  class="text-center align-middle">
															    	<%=orderlists.get(i).getBookPrice()*orderlists.get(i).getAmount()%>
															    </td>
															</tr>
																<%
														    	}
					 											 }
					 										%>	 
														 	
														  </tbody>
														</table>
									  </div>
								
							    </div>
							    <br><br>
									  	<div class="card">
											  <div class="card-body">
											  <h4>주문금액</h4>
											 		총 상품금액 : <input type="text"  id="total"  value="<%=total%>" readonly style="border:none"> + 배송비 : <input type="text" id="addPrice" value="<%=addPrice%>"  readonly style="border:none"/>
											 		<input type="hidden" id="finalTotal"  name="finalTotal" value="<%=finalTotal%>"/>
											  </div>
										</div>
										<br>
										<div class="card">
											  <div class="card-body">
											  <h4>할인</h4>
											 		포인트 : 
											 		<input type="hidden" id="myPoint"  value="<%=mypoint%>"/>
											 		<%
											  			int remPoint = mypoint%5000;
											  			int availPoint = mypoint-remPoint;
										  				int limitPoint = 0;
											 		%>
											 		<%
											 			do{
											 				limitPoint++;
											 			}while(mypoint>limitPoint && finalTotal > limitPoint);
											 		%>
											 		<%if(mypoint<5000){ %>
											 		<span>사용가능한 포인트가 없습니다.</span>
											 		<input type="hidden" name="limitPoint" value="0" />
											 		<%}else{ %>
											 		<select onchange="pointCalc()" id="pointCal" name="limitPoint">
											 			<option value="0">사용안함</option>
											 			<%for(int i=5000; i<=limitPoint;i+=5000){ %>
											 			<option value="<%=i%>"><%=i%></option>
											 			<%} %>
											 		</select>
											 		<%
											 			}
											 		%>
											 		남은 포인트 : <input type="hidden"  id="availPoint"  name="availPoints" value="<%=mypoint %>" /> 
											 		<span id="availPoints"><%=mypoint %></span>
											  </div>
										</div>
										<br>
										<div class="card">
											  <div class="card-body">
											  <h4> 총 결제금액</h4>
											 	<span id="finalTotals"><%=finalTotal %></span>원
											 	<span>적립포인트 : <%=point %></span>
											  </div>
										</div>
				
										<br><br>
										<div class="card">	
											  <div class="card-body">
											  		<h4>주문자 정보</h4>
											  		<table class="table table-bordered">
														    <tr>
														        <th class="table-info" >주문자</th>
														        <td><%=memberList.getName() %></td>
														     </tr>
														    <tr>
														      <th class="table-info">연락처</th>
														         <td><%=memberList.getPhone() %></td>
														    </tr>
														     <tr >
														      <th class="table-info">배송지</th>
														      <td><%=memberList.getAddr1()+" "+memberList.getAddr2()%>  (<%=memberList.getZipnum()%>)</td>
														    </tr>
														     <tr >
														      <th class="table-info">배송메세지</th>
														      <td>
														      	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="message"></textarea>
														      </td>
														    </tr>

														</table>
											  </div>
										 </div>
									  
							</div>

						
						
			  				<input type="hidden" name="memberId"  id="memberId" value="<%=id %>" />
			  				<input type="hidden" name="point"  id="point" value="<%=point %>" />
						  <input type="hidden" name="deliveryAddr"  id="deliveryAddr" value="<%=memberList.getAddr1()+' '+memberList.getAddr2()%>" />
						<input type="hidden" name="deliveryTel"  id="deliveryTel" value="<%=memberList.getPhone() %>" />	
						 <div class="col-md-12 text-center" style="margin-top:20px;margin-bottom:20px">
								<input type="submit" value="결제하기" class="btn btn-primary" />
								<a href="./Controller.do?command=newbook" class="btn btn-secondary">쇼핑계속하기</a>
						 </div>

				

				 </div>
			</div>
		</div>
</form>		
 </main>
<jsp:include page="/bottom.jsp" /> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script>
	function pointCalc(){
		var items = document.getElementById("pointCal");
		var pointItem = items.options[items.selectedIndex].value;
		var total = document.getElementById("total").value;
		var finalTotal = document.getElementById("finalTotal").value;
		var finalTotals = document.getElementById("finalTotals");
		var myPoint = document.getElementById("myPoint").value;
		var availPoint = document.getElementById("availPoint").value;
		var availPoints = document.getElementById("availPoints");
		finalTotals.innerText = finalTotal - pointItem;
		availPoints.innerText =  myPoint  - pointItem;
		

	}
</script>
</html>