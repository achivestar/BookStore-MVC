<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard | bluering BookStore</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<link href="./assets/dist/css/bootstrap.css" rel="stylesheet">
<link href="./custom.css" rel="stylesheet">
<link href="dashboard.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">주문관리</h1>
			<p><span>Home</span> > <span>주문상세</span></p>
		</div>
		<div class="row" >
		<div class="col-md-8">
		<!--  form start -->
		<form>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">책 제목</label> <input type="email"
						class="form-control" id="inputEmail4">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">책 저자</label> <input type="password"
						class="form-control" id="inputPassword4">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputAddress">출판사</label> <input type="text"
						class="form-control" id="inputAddress">
				</div>
				<div class="form-group col-md-6">
					<label for="inputAddress2">출판일자</label> <input type="text"
						class="form-control" id="inputAddress2">
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputAddress">원가격</label> <input type="text"
						class="form-control" id="inputAddress" >
				</div>
				<div class="form-group col-md-6">
					<label for="inputAddress2">판매가격</label> <input type="text"
						class="form-control" id="inputAddress2">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputAddress">카테고리 [대분류]</label>
					 <select id="inputState" class="form-control">
				        <option selected>Choose...</option>
				        <option>...</option>
				      </select>
				</div>
				<div class="form-group col-md-6">
					<label for="inputAddress2">카테고리 [소분류]</label> 
					<select id="inputState" class="form-control">
					        <option selected>Choose...</option>
					        <option>...</option>
					  </select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputAddress">책 설명</label> 
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputAddress">책 이미지</label> 
					<input type="file" class="form-control-file" id="exampleFormControlFile1">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputAddress">베스트상품</label> 
					<input class="form-check" type="checkbox" id="gridCheck1">
				</div>
				<div class="form-group col-md-4">
					<label for="inputAddress">오늘의상품</label> 
					<input class="form-check" type="checkbox" id="gridCheck1">
				</div>
				<div class="form-group col-md-4">
					<label for="inputAddress">상품숨김</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check" type="checkbox" id="gridCheck1">

				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-block">등록</button>
			<br><br>
		</form>
	
		<!-- form end -->
		</div>
		
		<div class="col-md-4 text-left">
			<div style="border:1px solid #ddd;padding:20px">
				<p>현재 등록된 도서 130권</p>
				<p>기술 30권</p>
				<p>만화 30권</p>
				<p>소설 20권</p>
				<p>잡지 43권</p>
				<p>에쎄이 17권</p>
			</div>	
			<br>
			<button type="button" class="btn btn-outline-primary btn-block">상품목록</button>
		</div>
	</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="dashboard.js"></script>
</body>
</html>