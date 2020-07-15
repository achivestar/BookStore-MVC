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
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
<script src="../js/member.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/top.jsp" />
			
		<main>
			<div>
				<h2>회원가입</h2>
				<div class="jumbotron col-md-8" style="padding-top:20px;width:100%;margin:0 auto ">
							<form id="join" action="./Controller.do?command=join_form" method="post"name="formm">
								언제나 새로운 즐거움이 가득한 Bluering 의 회원가입 페이지 입니다. 
								<br> Bluering 의 회원가입은 무료이며, 회원님의 개인신상에 관한 정보는 ‘정보통신망이용촉진 및 정보보호등에관한법률’에 의해 회원님의
								동의없이 제 3자에게 제공되지 않으며, 철저히 보호되고 있사오니 안심하고 이용하시기 바랍 니다.<br><br>
								<div class="form-group btn-group col-md-12"  >
										<textarea rows="15" class="form-control">    
제 1 장 총 칙
제 1 조 (목적) 
이 이용약관(이하 '약관')은 주식회사 Bluering(이하 회사라 합니다)
와 이용 고객(이하 '회원')간에 회사가 제공하는 bluering.pe.kr서비스
의 가입조건 및 이용에 관한 다음의 제반 사항과 기타 기본적인 사
항을 구체적으로 규정함을 목적으로 합니다.
										 </textarea>
								</div>		 
								<br>
								<br>
								<div style="text-align: center;" class="radio">
									<input type="radio" name="okon1" id="agree" checked> 동의함
									&nbsp; &nbsp; &nbsp; <input type="radio" name="okon1" checked>
									동의안함
								</div>
								<br>
								<br> <input type="button" value="Next" class="submit btn btn-primary  btn-block" onclick="go_next()">
							</form>
				</div>
			</div>
		</main>
<jsp:include page="/bottom.jsp" />

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
		<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>
