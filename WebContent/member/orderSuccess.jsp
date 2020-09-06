<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@page import="com.pe.bluering.vo.CartVo"%>
<%@page import="com.pe.bluering.vo.OrderVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	ArrayList<OrderVo> orderList = (ArrayList<OrderVo>)request.getAttribute("orderList");
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
 <h2>주문내역확인</h2>    
 
 <%
 	int total = 0;
 	int limitPoint = (int)session.getAttribute("limitPoint");
 	int point = limitPoint;
 %>

 			<div class="col-lg-12 row">
				<div class="col-md-10 col-lg-10" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">
						<div class="row">
							<div class="col-md-12">
								<div class="card bg-light">
									  <div class="card-header">
											장바구니<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
											  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg> 주문  
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
											  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg>
											   <span class="text-info"><b>완료</b></span>  
									  </div>
									  <div class="card-body">
									  <span class="text-primary"><%=id %></span>님의 주문내역입니다.<br>
									      	<table class="table table-hover">
														  <thead>
															<tr class="table-primary">
															  <th scope="col" class="text-center">상품명</th>
															  <th scope="col" class="text-center">판매가/수량</th>
															  <th scope="col" class="text-center">주문일자</th>
															  <th scope="col" class="text-center">주문상태</th>
															</tr>
														  </thead>
														  <tbody>
														      <%
																 	for(int i=0; i<orderList.size();i++){
																 		total+=orderList.get(i).getPrice()*orderList.get(i).getAmount();
																 		String orderDay = orderList.get(i).getBuy_date(); 
																 		String date[] = orderDay.split(" ");
																 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderList.get(i).getBook_img()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderList.get(i).getBook_title()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderList.get(i).getPrice()%>/<%=orderList.get(i).getAmount() %></td>
															  <td class="text-center align-middle"><%=date[0]%></td>
															   <td class="text-center align-middle"><%=orderList.get(i).getState() %></td>
															</tr>
														 <%
 																	}
 														%>
														  </tbody>
														</table>
									  </div>
									  
							    </div>
							    <br><br>
							    <div class="card">
								    <div class="card-body">
										<h4>주문자 정보</h4>
											  		<table class="table table-bordered">
											  			<%
											  		 		for(int i=0; i<1;i++){
											  			%>
														    <tr>
														        <th class="table-info" >주문자</th>
														        <td><%=orderList.get(i).getMember_id() %></td>
														     </tr>
														    <tr>
														      <th class="table-info">연락처</th>
														         <td><%=orderList.get(i).getDeliveryTel() %></td>
														    </tr>
														     <tr >
														      <th class="table-info">배송지</th>
														      <td><%=orderList.get(i).getDeliveryAddr()%></td>
														    </tr>
														     <tr >
														      <th class="table-info">배송메세지</th>
														      <td>
														      	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"  readonly="readonly"><%=orderList.get(i).getMessage()%></textarea>
														      </td>
														    </tr>
															<%
											  		 			}
															%>
														</table>
								    </div>
								</div>
							    <br><br>
							    <div class="card">
								    <div class="card-body">
											 <% 
											 	point+=limitPoint;
											 %>
											 도서합계<%=total %> - 포인트<%=point %> = <%=total-point %> 
								   </div>
							   </div>
							   <br><br>
							</div>


					

				 </div>
			</div>
		</div>
 </main>
 <br><br>
<jsp:include page="/bottom.jsp" /> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</html>