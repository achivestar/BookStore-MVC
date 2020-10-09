<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard | bluering BookStore</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<link href="./assets/dist/css/bootstrap.css" rel="stylesheet">
<link href="./custom.css" rel="stylesheet">
<link href="dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="../js/jquery-ui.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../js/faqRegist.js"></script>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">FAQ 등록</h1> 
			<p><span>Home</span> > <span>FAQ등록</span></p>
		</div>
		<div class="row" >
		<div class="col-md-8">
		<!--  form start -->
		<form  method="post"  action="./AdminController.do?command=FaqRegistAction" name="FaqRegist"  id="FaqRegist" onsubmit="return checkForm()">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="faqCategory"></label> 
					 <label for="faqCategory">분류</label>
				      <select id="faqCategory" class="form-control" name="faqCategory">
				        <option selected value="1">주문</option>
				        <option value="2">배송</option>
				        <option value="3">회원</option>
				      </select>
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="question">Question</label>
					 <input type="text" class="form-control form-control-sm" id="question" name="question">
				</div>

			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="answer">Answer</label> 
					<textarea class="form-control form-control-sm" id="answer" rows="10" name="answer"></textarea>
				</div>
			</div>
			<div class="form-row justify-content-md-center">
					<button type="submit" class="btn btn-primary btn-lg" >등록하기</button>&nbsp;
			    	<button type="button" class="btn btn-secondary  btn-lg" onclick="faqList()">목록보기</button>
			</div>
			<br><br>
		</form>
	
		<!-- form end -->
		</div>
		<div class="col-md-4">
			<div class="alert alert-success" role="alert">
 			 	고객의 문의사항이 <a href="./AdminController.do?command=qnaList" class="alert-link">1건</a> 있습니다.
			</div>
		</div>

	</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

	<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
	<script 	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="dashboard.js"></script>
	<script src="../js/jquery-1.11.3.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
</body>
</html>