<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@page import="com.pe.bluering.vo.CartVo"%>
<%@page import="com.pe.bluering.vo.OrderVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	   CartVo orderlist = (CartVo) session.getAttribute("cartOneList");
	   ArrayList<CartVo> orderlists = (ArrayList) session.getAttribute("cartAllList");
	   MemberVO memberList = (MemberVO) session.getAttribute("oneMember");
	   
	int total = 0;
	int addPrice = 0;
	int finalTotal = 0;
	int point = 0;
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
 <%=memberList.getId() %>
			<div class="col-lg-12 row">
				<div class="col-md-10 col-lg-10" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">


						<div class="row">
							<div class="col-md-9">
								<div class="card bg-light">
									  <div class="card-header">
											<span class="text-info"><b>장바구니</b></span>  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
											  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
											</svg><b> 주문  </b>
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
															  <th scope="col" class="text-center">주문</th>
															</tr>
														  </thead>
														  <tbody>
														    <%
														     if(orderlist!=null){ 											
				 											 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderlist.getBookImg()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderlist.getBookName()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderlist.getBookPrice()%></td>
															  <td class="text-center align-middle">
															     <%=orderlist.getAmount() %>
															    <input type="hidden" name="memberId"  id="memberId" value="<%=id %>" />
															    </td>
															</tr>
																<%
					 											 }
					 										%>	 
					 										
					 										   <%
					 										   if(orderlists.size()!=0){
														    	for(int i=0; i<orderlists.size();i++){									
				 											 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderlists.get(i).getBookImg()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderlists.get(i).getBookName()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderlists.get(i).getBookPrice()%></td>
															  <td class="text-center align-middle">
															    <input type="text"  value="<%=orderlists.get(i).getAmount() %>" name="amount"   size="2" class="text-center" style="border:1px solid #eee;margin-bottom:3px"/><br>
															    <input type="hidden" name="memberId"  id="memberId" value="<%=id %>" />
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
							</div>


							<%
								if(total>=30000){
									addPrice = 0;
								}else if(total==0){
									addPrice = 0;
								}else{
									addPrice = 2500;
								}
								finalTotal = total+addPrice;
								point =((finalTotal*3)/100);
								
							%>
							<div class="col-md-3">
								<div class="card bg-light">
									  <div class="card-header text-center">주문금액정보 </div>
									  <div class="card-body">
											<p class="text-center">총 상품금액  <%=total %>원 </p>
											<p class="text-center"> 
											<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
												  <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z"/>
												</svg> </p>
											<p class="text-center">총 추가금액  <%=addPrice %>원 </p>
											<hr>
											<p  class="text-center" style="font-size:20px">최종 결제금액 <span class="text-info"><%=finalTotal %>원</span></p>  
											<hr>
											<p class="text-center">적립 포인트 <span class="text-info"><%=point%>P</span></p>  
									 </div>
							  </div>
						 </div>
						
						 <div class="col-md-12 text-center" style="margin-bottom:20px">
								<!-- <input type="submit" value="주문하기" class="btn btn-primary" />	 -->
								<a href="./Controller.do?command=newbook" class="btn btn-secondary">쇼핑계속하기</a>
						 </div>

				

				 </div>
			</div>
		</div>
 </main>
<jsp:include page="/bottom.jsp" /> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>

</html>