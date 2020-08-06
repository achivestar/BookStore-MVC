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
<script src="../js/bookRegist.js"></script>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">상품관리</h1> 
			<p><span>Home</span> > <span>상품등록</span></p>
		</div>
		<div class="row" >
		<div class="col-md-8">
		<!--  form start -->
		<form  method="post"  action="./AdminController.do?command=BookRegistAction" enctype="multipart/form-data" name="bookRegist"  id="bookRegist" onsubmit="return checkForm()">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bookName">책 이름</label> 
					<input type="type" class="form-control form-control-sm" id="bookName" name="bookName">
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="bookSubtitle">책 부제</label>
					 <input type="type" class="form-control form-control-sm" id="bookSubtitle" name="bookSubTitle">
				</div>
				<div class="form-group col-md-6">
					<label for="author">책 저자</label>
					 <input type="type" class="form-control form-control-sm" id="author" name="author">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="publishing">출판사</label> 
					<input type="text" class="form-control form-control-sm" id="publishing" name="publishing">
				</div>
				<div class="form-group col-md-6">
					<label for="publishDay">출판일자 (ex : 2020-05-05)</label> 
					<input type="text" class="form-control form-control-sm"  id="datepicker" name="publishDay">
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="cost">원가격</label> 
					<input type="text" class="form-control form-control-sm" id="cost" name="cost"  onBlur="numberFormat(this.value)">
				</div>
				<div class="form-group col-md-4">
					<label for="rate">할인율</label> 
					<input type="text" class="form-control form-control-sm" id="rate" name="rate"  onBlur="rateCalc(this.value)">
				</div>
				<div class="form-group col-md-4">
					<label for="sellingPrice">판매가격</label> 
					<input type="text"	class="form-control form-control-sm" id="sellingPrice" name="sellingPrice" readonly>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="pageNum">페이지 수</label> 
					<input type="text"	class="form-control form-control-sm"  id="pageNum"  name="pageNum">
				</div>
				<div class="form-group col-md-4">
					<label for="weight">무게</label> 
					<input type="text"	class="form-control form-control-sm" id="weight" name="weight">
				</div>
				<div class="form-group col-md-4">
					<label for="size">크기</label> 
					<input type="text" class="form-control form-control-sm" id="size" name="size" value="145*210">
				</div>
			</div>
			<hr/>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="category1">카테고리 [대분류]</label>
					 <select id="category1" class="form-control form-control-sm" name="category1" onchange="categoryChange(this)">
					 	<option value="none">-대분류-</option>
				        <option value="IT모바일">IT모바일</option>
				        <option value="소설/시/희곡">소설/시/희곡</option>
				        <option value="어린이">어린이</option>
				        <option value="에세이">에세이</option>
				        <option value="종교">종교</option>
				      </select>
				</div>
				<div class="form-group col-md-6">
					<label for="category2">카테고리 [소분류]</label> 
					<select id="category2" class="form-control form-control-sm" name="category2">
					        <option value="none">-소분류-</option>
					  </select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="comment">책 설명</label> 
					<textarea class="form-control form-control-sm" id="comment" rows="10" name="comment"></textarea>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bookImage">책 이미지</label> 
					<input type="file" class="form-control-file" id="bookImage" name="bookImage" accept="images/gif, image/jpg, image/jpeg, image/png">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="bestProduct">베스트상품</label> <br>
							<input type="radio" name="bestProduct"  value="y" > 등록
							<input type="radio" name="bestProduct" value="n" checked> 해제
				</div>
				<div class="form-group col-md-4">
					 <label for="todayProduct">오늘의상품</label><br>
							<input type="radio" name="todayProduct"  value="y"  > 등록
							<input type="radio" name="todayProduct"  value="n" checked> 해제
				</div>
				<div class="form-group col-md-4">
					<label for="hiddenProduct">상품매진</label><br>
							<input type="radio" name="hiddenProduct"  value="y" > 등록
							<input type="radio" name="hiddenProduct"  value="n"  checked> 해제	
				</div>
			
		</div>
			<button type="submit" class="btn btn-primary btn-block">등록</button>
			<br><br>
		</form>
	
		<!-- form end -->
		</div>
		
		<div class="col-md-4 text-left">
			<jsp:include page="./chartList.jsp" />
			<br>
			<a href="AdminController.do?command=BookList&page=1&category=0"  class="btn btn-outline-primary">상품목록</a>
			<a href="AdminController.do?command=excelDownload"  class="btn btn-outline-success">엑셀다운로드</a>
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
<script>
	$(function() {
	//$('#myModal').modal('show');
	  $( "#datepicker" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  });
	});
	
</script>
</body>
</html>