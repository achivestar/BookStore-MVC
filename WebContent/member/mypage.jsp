<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
%>    
	<script>
		alert("로그인 해주세요!");
		location.href="./Board.do?command=login_form&site=mypage";
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
 	 <h2>My page</h2>    
			<div class="col-lg-12 row">
				<div class="col-md-8 col-lg-8" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">
					
					<div class="card bg-light">
							  <div class="card-header">내 정보</div>
							  <div class="card-body">
								 <p>이름 님 오늘도 행복한 하루 보내세요.</p>
								 <p>나의등급 <span class="badge badge-info">등급</span></p>
								 <div class="row">
									  <div class="col-xs-6 col-md-3">
										  <img src="" alt="..." style="height:180px" class="img-thumbnail">
									  </div>
									  <div class="col-xs-12 col-md-5">
										<ul class="list-group">
											  <li href="#" class="list-group-item list-group-item-info">
												나의 쿠폰  <span class="badge badge-info">4</span>
											  </li>
											  <li class="list-group-item">Dapibus ac facilisis in</li>
											  <li  href="#" class="list-group-item">Morbi leo risus</li>
											  <li  href="#" class="list-group-item">Porta ac consectetur ac</li>
											  <li  href="#" class="list-group-item">Vestibulum at eros</li>
											</ul>
									  </div>

									  <div class="col-xs-12 col-md-4">
										<ul class="list-group">
											  <li class="list-group-item list-group-item-info">나의 point</li>
											  <li class="list-group-item text-right">2000원</li>

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
</body>
</html>