<%@page import="com.pe.admin.vo.QnaVo"%>
<%@page import="com.pe.admin.vo.FaqVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<QnaVo> qnaList = (ArrayList<QnaVo>) request.getAttribute("qnaList");
%>	
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
<style>
	.displayLoding{
		display:none;
	}
</style>	
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">QnA 목록</h1> 
			<p><span>Home</span> > <span>Qna목록</span></p>
		</div>
		<div class="row" >
		<div class="col-md-12">
				<div class="alert alert-success" role="alert">
 			 	고객의 문의사항 총 1건 중 1건을 답변 하셨습니다.
			</div>
				<table class="table">
						  <thead>
						    <tr>
						      <th scope="col" class="text-center">member</th>
						      <th scope="col" class="text-center">Question</th>
						      <th scope="col" class="text-center">등록일시</th>
						      <th scope="col" class="text-center">답변상태</th>
						    </tr>
						  </thead>
						  <tbody>
						  <%
						   String state = null;
						  	for(int i=0; i<qnaList.size();i++){
						  		if(qnaList.get(i).getState()==0){
						  			state = "<span class='text-info'>답변대기중</span>";
						  		}else{
						  			state = "<span class='text-success'>답변완료</span>";
						  		}
						  %>
						    <tr>
						      <th scope="row" class="text-center"><%=qnaList.get(i).getMember() %></th>
						      <td class="text-center"><%=qnaList.get(i).getQuestion() %></td>
						      <td class="text-center"><%=qnaList.get(i).getRegdate()%></td>
						      <td class="text-center"><%=state%></td>
						    </tr>
						 <%
						  	}
						 %>
						  </tbody>
						</table>
		
			
		</div>

	</div>
	<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
 			 <span class="sr-only">Loading...</span>
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
		function faqWriter(){
			location.href="./AdminController.do?command=FaqForm";
		}
		 function deliveryOrder(){
			   var formData = $("#deliveryForm").serialize();
			   $.ajax({
					type : "POST",
					url : "./AdminController.do?command=FaqOrder",
				   data : formData,
					success : function(data){
						if(data==1){
							 alert("순서가 조정되었습니다.");
						}else{
							location.href="./AdminController.do?command=FaqForm";
						}
					   
					},beforeSend : function(){
						$(".spinner-border").removeClass("displayLoding");
					},complete:function(){
						$(".spinner-border").addClass("displayLoding");	
					}
				})
		}
		 
		 function orderOrder(){
			   var formData = $("#orderForm").serialize();
			   alert(formData);
			   $.ajax({
					type : "POST",
					url : "./AdminController.do?command=FaqOrder",
				   data : formData,
					success : function(data){
						if(data==1){
							 alert("순서가 조정되었습니다.");
						}else{
							location.href="./AdminController.do?command=FaqForm";
						}
					   
					},beforeSend : function(){
						$(".spinner-border").removeClass("displayLoding");
					},complete:function(){
						$(".spinner-border").addClass("displayLoding");	
					}
				})
		}
		 
		 function memberOrder(){
			   var formData = $("#memberForm").serialize();
			   alert(formData);
			   $.ajax({
					type : "POST",
					url : "./AdminController.do?command=FaqOrder",
				   data : formData,
					success : function(data){
						if(data==1){
							 alert("순서가 조정되었습니다.");
						}else{
							location.href="./AdminController.do?command=FaqForm";
						}
					   
					},beforeSend : function(){
						$(".spinner-border").removeClass("displayLoding");
					},complete:function(){
						$(".spinner-border").addClass("displayLoding");	
					}
				})
		}
	</script>
	<script>
	    var ubtn = document.getElementsByClassName("upbtn");
	    
	    for (var i = 0; i < ubtn.length; i++) {
	        ubtn[i].addEventListener("click", function () {
	            if (this.closest("tr").previousElementSibling != undefined) {
	                this.closest("tr").previousElementSibling.parentNode.insertBefore(this.closest("tr"), this.closest("tr").previousElementSibling);
	            } else alert("제일 처음의 순서 입니다.");
	        })
	    }
	    var dbtn = document.getElementsByClassName("downbtn");
	    for (var i = 0; i < dbtn.length; i++) {
	        dbtn[i].addEventListener("click", function (e) {
	            if (this.closest("tr").nextElementSibling != undefined) {
	                this.closest("tr").parentNode.insertBefore(this.closest("tr").nextElementSibling, this.closest("tr"));
	            } else alert("제일 마지막의 순서 입니다.");
	        })
	    }
	
	</script>
    
</body>
</html>