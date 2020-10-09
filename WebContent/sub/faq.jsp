<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bluering Book Store</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/custom.css">
   <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../assets/dist/js/bootstrap.bundle.js"></script>
    <script src="../js/member.js" ></script>

  </head>
  <body>
    <div class="container">
		<jsp:include page="/top.jsp" />
 <main>
 		 <h2>FAQ</h2>    
		<div class="col-lg-12 row">
				<div class="col-md-8 col-lg-8" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">
						<h3>자주 묻는 질문</h3>
							<ul class="nav nav-tabs">
								  <li class="nav-item">
								    <a class="nav-link active" data-toggle="tab" href="#all">전체</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#order">주문</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#delivery">배송</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#member">회원</a>
								  </li>
								</ul>
								<div class="tab-content">
											  <div class="tab-pane fade show active" id="all">
											  <div class="list-group">
													  <a data-toggle="collapse"  href="#all1" class="list-group-item list-group-item-action">
													 	[영수증] 현금영수증은 어떻게 발행하나요?
													  </a>
													  <div class="collapse multi-collapse" id="all1">
														      <div class="card card-body">
														        개인(소득증빙)은 휴대폰번호로, 사업자(지출증빙)은 사업자등록번호로 발행할 수 있으며 개인→타인, 개인→사업자, 사업자→개인 등으로 변경해서 발행할 수 있습니다.
														      </div>
													</div>
													  <a data-toggle="collapse"  href="#all2" class="list-group-item list-group-item-action">
													 	[결제] 사용가능한 결제수단은 어떤것들이 있나요?
													  </a>
													  <div class="collapse multi-collapse" id="all2">
														      <div class="card card-body">
 																		 사용가능한 결제수단은 어떤것들이 있나요?				?
														      </div>
													</div>
													   <a data-toggle="collapse"  href="#all3" class="list-group-item list-group-item-action">
													 	[결제] 사용가능한 결제수단은 어떤것들이 있나요?
													  </a>
													  <div class="collapse multi-collapse" id="all3">
														      <div class="card card-body">
 																		 사용가능한 결제수단은 어떤것들이 있나요?				
														      </div>
													</div>
													    <a data-toggle="collapse"  href="#all4" class="list-group-item list-group-item-action">
													 	[결제] 사용가능한 결제수단은 어떤것들이 있나요?
													  </a>
													  <div class="collapse multi-collapse" id="all4">
														      <div class="card card-body">
 																		 사용가능한 결제수단은 어떤것들이 있나요?				
														      </div>
													</div>
													    <a data-toggle="collapse"  href="#all5" class="list-group-item list-group-item-action">
													 	[결제] 사용가능한 결제수단은 어떤것들이 있나요?
													  </a>
													  <div class="collapse multi-collapse" id="all5">
														      <div class="card card-body">
 																		 사용가능한 결제수단은 어떤것들이 있나요?				
														      </div>
													</div>
													</div>
											 
											  </div>
											  <div class="tab-pane fade" id="order">
											    <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
											  </div>
											  <div class="tab-pane fade" id="delivery">
											    <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
											  </div>
											    <div class="tab-pane fade" id="member">
											    <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
											  </div>
								</div>
			</div>
		</div>

 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
