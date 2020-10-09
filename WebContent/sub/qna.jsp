<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href="./Controller.do?command=login_form";
	</script>
<%		
	}
%>

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
    <script src="../js/qnaRegist.js" ></script>
<style>
	.displayLoding{
		display:none;
	}
</style>	
  </head>
  <body>
    <div class="container">
		<jsp:include page="/top.jsp" />
 <main>
 		 <h2>Q&A</h2>    
		<div class="col-lg-12 row">
				<div class="col-md-8 col-lg-8" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">

					<!--  form start -->
								<form   method="post" name="QnaRegist"  id="QnaRegist" onsubmit="return checkForm()">
									<div class="form-row">
										<div class="form-group col-md-12">
											 <input type="text" class="form-control form-control-sm" id="question" name="question"  placeholder="제목을 입력해주세요." />
										</div>
						
									</div>
									<div class="form-row">
										<div class="form-group col-md-12">
											<label for="answer">문의사항</label> 
											<textarea class="form-control form-control-sm" id="answer" rows="10" name="content"></textarea>
										</div>
									</div>
									<div class="form-row justify-content-md-center">
											<input type="hidden" id="member" name="member"  value="<%=id %>" />
											<button type="button" class="btn btn-primary btn-lg"  onclick="submits(); return false;">등록하기</button>&nbsp;
									    	<button type="button" class="btn btn-secondary  btn-lg" onclick="qnaList()">목록보기</button>
									</div>
									<br><br>
								</form>
							
								<!-- form end -->
			</div>
		</div>
		<br><br>
			<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
 			 <span class="sr-only">Loading...</span>
		</div>
 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
