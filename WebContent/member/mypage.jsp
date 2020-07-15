<%@page import="java.util.ArrayList"%>
<%@page import="com.pe.bluering.vo.CouponVO"%>
<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = (String)session.getAttribute("id");
    MemberVO   mvo = null;
	ArrayList<CouponVO>   cvo = null;
	int couponCount = 0;
	String lev = null;
	String name = null;
	int point = 0;
	String profileImg =null;
	if(id==null){
%>    
	<script>
		location.href="./Controller.do?command=login_form&site=mypage";
	</script>
<%
	}else{

			mvo = (MemberVO)session.getAttribute("loginUser");
			cvo = (ArrayList) session.getAttribute("couponList");
			couponCount = (int) session.getAttribute("ccount");

	        if(mvo.getLev()==1){
				 lev = "<span class='badge badge-info'>일반</span>";
			 }else if(mvo.getLev()==2){
				 lev = "<span class='badge badge-success'>일반</span>";
			 }else if(mvo.getLev()==3){
				 lev = "<span class='badge badge-warning'>일반</span>";
			 }else{
				 lev = "<span class='badge badge-dark'>일반</span>";
			 }
	         name = mvo.getName();
	         couponCount = couponCount;
	         point = mvo.getPoint();
	         profileImg = mvo.getProfileimg();
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

 	 <h2>My page</h2>    
			<div class="col-lg-12 row">
				<div class="col-md-8 col-lg-8" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">
					
					<div class="card bg-light">
							  <div class="card-header">내 정보</div>
							  <div class="card-body">
								 <p><span style="font-weight:bold;color:blue"><%=name %></span>님 오늘도 행복한 하루 보내세요.</p>
								 <p class="align-middle">나의등급 <%=lev %> </p>
								 <div class="row">
									  <div class="col-xs-6 col-md-3">
										  <img src="/upload/<%=profileImg%>" alt="" style="height:160px" class="img-thumbnail">
									  </div>
									  <div class="col-xs-12 col-md-5">
										<ul class="list-group">
											  <li href="#" class="list-group-item list-group-item-info">
												나의 쿠폰  <span class="badge badge-danger"><%=couponCount %></span>개
											  </li>
											<%
											 if(cvo!=null){
											  for(int i=0; i<cvo.size(); i++){ %>
												  <li class="list-group-item"><%=cvo.get(i).getCname() %></li>
											<%} 
												}%>  
											</ul>
									  </div>

									  <div class="col-xs-12 col-md-4">
										<ul class="list-group">
											  <li class="list-group-item list-group-item-info">나의 point</li>
											  <li class="list-group-item text-right"><%=point %>원</li>

										</ul>
									  </div>
									   <div class="col-xs-12 col-md-12 text-right ">
											  <a href="#" class="text-muted" style="font-size:12px">회원탈퇴</a>
									   </div>
								</div>
							 
							 
							 </div>
						</div>
						<br><br>
	
					
							<div class="card bg-light">
								  <div class="card-header">최근 주문한 내역 <span style="float:right;font-size:11px"><a href="#">더보기</a></span> </div>
								  <div class="card-body">Panel content </div>
							</div>	
							<br><br>

							<div class="card bg-light">
							  <div class="card-header" >
								나의 장바구니 <span style="float:right;font-size:11px"><a href="#">더보기</a></span>
							  </div>
							  <div class="card-body">
								Panel content
							  </div>
						</div>
						<br><br>



							<div class="card bg-light">
							  <div class="card-header" >질문내역 <span style="float:right;font-size:11px"><a href="#">더보기</a></span></div>
							  <div class="card-body">
								<div class="list-group">
									<a href="#" class="list-group-item list-group-item-action"><span class="text-success">[답변대기중]</span> Dapibus ac facilisis in <span style="float:right">2020-07-04</span></a>
									<a href="#" class="list-group-item list-group-item-action"><span class="text-success">[답변대기중]</span> Morbi leo risus <span style="float:right">2020-07-04</span></a>
									<a href="#" class="list-group-item list-group-item-action"><span class="text-primary">[답변완료]</span> Porta ac consectetur ac <span style="float:right">2020-07-04</span></a>
								 </div>
							</div>
							</div>
							<br><br>


							<div class="card bg-light ">
							  <div class="card-header">최근 본 상품</div>
							  <div class="card-body">
								Panel content
							  </div>
						</div>
						<br><br>	


			</div>
		</div>
 </main>
<jsp:include page="/bottom.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>