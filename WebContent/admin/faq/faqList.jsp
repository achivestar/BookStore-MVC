<%@page import="com.pe.admin.vo.FaqVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<FaqVo> faqOrderList = (ArrayList<FaqVo>) request.getAttribute("faqOrderList");
ArrayList<FaqVo> faqDeliveryList = (ArrayList<FaqVo>) request.getAttribute("faqDeliveryList");
ArrayList<FaqVo> faqMemberList = (ArrayList<FaqVo>) request.getAttribute("faqMemberList");
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
			<h1 class="h2">FAQ 목록</h1> 
			<p><span>Home</span> > <span>FAQ목록</span></p>
		</div>
		<div class="row" >
		<div class="col-md-12">
		<!--  form start -->
		<ul class="nav nav-tabs">
		
								  <li class="nav-item">
								    <a class="nav-link active" data-toggle="tab" href="#order">주문</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#delivery">배송</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#member">회원</a>
								  </li>
		</ul>
			<div class="tab-content">
					 <div class="tab-pane fade show active" id="order">
							<form  id="orderForm">
								<div class="form-row">
									<div class="form-group col-md-12">
										<table class="table table-hover">
																  <thead>
																    <tr class="table-info">
																        <th scope="col" width="10%" class="text-center">Move</th>
																      <th scope="col" width="35%" class="text-center">Question</th>
																      <th scope="col" width="40%" class="text-center">Answer</th>
																      <th scope="col" width="15%" class="text-center">관리</th>
																    </tr>
																  </thead>
																  <tbody>
																  <%
																   if(faqOrderList.size()>0){
																	  for(int i=0; i<faqOrderList.size();i++){
																 %>
																    <tr>
																    <td>     
																     <button type="button"  class="upbtn btn btn-link">
																     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
</svg></button>&nbsp;<button type="button" class="downbtn btn btn-link"/><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg></button></td>
																      <td>
																      <select id="faqCategoryOrder<%=i %>" class="form-control" name="faqCategory">
																        <option value="1"  <%if(faqOrderList.get(i).getCategory()==1){%>selected<%} %>>주문</option>
																        <option value="2" <%if(faqOrderList.get(i).getCategory()==2){%>selected<%} %>>배송</option>
																        <option value="3" <%if(faqOrderList.get(i).getCategory()==3){%>selected<%} %>>회원</option>
																      </select><br>
																      <textarea class="form-control form-control-sm" id="questionOrder<%=i %>" rows="3"  name="questionDelivery"><%=faqOrderList.get(i).getQuestion() %></textarea></td>
																      <td><textarea class="form-control form-control-sm" id="answerOrder<%=i %>" rows="10" name="answerDelivery"><%=faqOrderList.get(i).getAnswer() %></textarea></td>
																      <td><button type="button"  class="btn btn-warning"  name="<%=faqOrderList.get(i).getNum()%>,<%=i%>" onclick="editOrderFaq(this)">수정</button>&nbsp;<button type="button" class="btn btn-danger" name="<%=faqOrderList.get(i).getNum()%>" onclick="delFaq(this)">삭제</button></td>
																  	  <input type="hidden" name="order" value="<%=faqOrderList.get(i).getOrder()%>" />
																 	   <input type="hidden" name="num" value="<%=faqOrderList.get(i).getNum() %>" />
																 	    <input type="hidden" name="div" value="1" />
																    </tr>
															
																    	<%
																			  }
																   	}else{
																		%>
																		 <tr><td colspan="3" class="text-center">등록된 항목이 없습니다.</td></tr>
																		<%
																   		}
																		%>
																  </tbody>
																</table>
																	
													   </div>	
													</div>   
												</form>
												<div class="row justify-content-md-center">
													<input type="button"  id="orderBtn" value="순서저장" class="btn btn-primary btn-lg " onclick="orderOrder(); return false;"/>&nbsp;
													<input type="button"  value="Faq등록" class="btn btn-secondary btn-lg " onclick="faqWriter();"/>
													</div>
											  </div>
											
											  <div class="tab-pane fade" id="delivery">
												<form id="deliveryForm">
													<div class="form-row">
														<div class="form-group col-md-12">
															<table class="table table-hover">
																  <thead>
																    <tr class="table-info">
																     <th scope="col" width="10%" class="text-center">Move</th>
																      <th scope="col" width="35%" class="text-center">Question</th>
																      <th scope="col" width="40%" class="text-center">Answer</th>
																      <th scope="col" width="15%" class="text-center">관리</th>
																    </tr>
																  </thead>
																  <tbody>
																  <%
																   if(faqDeliveryList.size()>0){
																	  for(int i=0; i<faqDeliveryList.size();i++){
																 %>
																 	
																    <tr>
																     <td>						     
																     <button type="button"  class="upbtn btn btn-link">
																     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
</svg></button>&nbsp;<button type="button" class="downbtn btn btn-link"/><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg></button></td>
																      <td>
																      <select id="faqCategoryDelivery<%=i %>" class="form-control" name="faqCategory">
																        <option value="1"  <%if(faqDeliveryList.get(i).getCategory()==1){%>selected<%} %>>주문</option>
																        <option value="2" <%if(faqDeliveryList.get(i).getCategory()==2){%>selected<%} %>>배송</option>
																        <option value="3" <%if(faqDeliveryList.get(i).getCategory()==3){%>selected<%} %>>회원</option>
																      </select><br>
																      <textarea class="form-control form-control-sm" id="questionDelivery<%=i %>" rows="3" name="questionDelivery"><%=faqDeliveryList.get(i).getQuestion() %></textarea></td>
																      <td><textarea class="form-control form-control-sm" id="answerDelivery<%=i %>" rows="10" name="answerDelivery"><%=faqDeliveryList.get(i).getAnswer() %></textarea></td>
																      <td><button type="button"  class="btn btn-warning"  name="<%=faqDeliveryList.get(i).getNum()%>,<%=i %>" onclick="editDeliveryFaq(this)">수정</button>&nbsp;<button type="button" class="btn btn-danger" name="<%=faqDeliveryList.get(i).getNum()%>" onclick="delDeliveryFaq(this)">삭제</button></td>
																 	   <input type="hidden" name="order" value="<%=faqDeliveryList.get(i).getOrder()%>" />
																 	   <input type="hidden" name="num" value="<%=faqDeliveryList.get(i).getNum() %>" />
																 	    <input type="hidden" name="div" value="2" />
																    </tr>
															
																    	<%
																			  }
																   	}else{
																		%>
																		 <tr><td colspan="3" class="text-center">등록된 항목이 없습니다.</td></tr>
																		<%
																   		}
																		%>
																  </tbody>
																</table>
																	
													   </div>	
													</div>   
													<div class="row justify-content-md-center">
													<input type="button"  id="deliveryBtn" value="순서저장" class="btn btn-primary btn-lg " onclick="deliveryOrder(); return false;"/>&nbsp;
													<input type="button"  value="Faq등록" class="btn btn-secondary btn-lg " onclick="faqWriter();"/>
													</div>
												</form>
											  </div>
											    <div class="tab-pane fade" id="member">
											    	<form id="memberForm">
								<div class="form-row">
									<div class="form-group col-md-12">
										<table class="table table-hover">
																  <thead>
																    <tr class="table-info">
																      <th scope="col" width="10%" class="text-center">Move</th>
																      <th scope="col" width="35%" class="text-center">Question</th>
																      <th scope="col" width="40%" class="text-center">Answer</th>
																      <th scope="col" width="15%" class="text-center">관리</th>
																    </tr>
																  </thead>
																  <tbody>
																  <%
																   if(faqMemberList.size()>0){
																	  for(int i=0; i<faqMemberList.size();i++){
																 %>
																    <tr>
																    <td>						     
																     <button type="button"  class="upbtn btn btn-link">
																     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
</svg></button>&nbsp;<button type="button" class="downbtn btn btn-link"/><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg></button></td>
																      <td>
																      <select id="faqCategoryMember<%=i %>" class="form-control" name="faqCategoryMember">
																        <option value="1"  <%if(faqMemberList.get(i).getCategory()==1){%>selected<%} %>>주문</option>
																        <option value="2" <%if(faqMemberList.get(i).getCategory()==2){%>selected<%} %>>배송</option>
																        <option value="3" <%if(faqMemberList.get(i).getCategory()==3){%>selected<%} %>>회원</option>
																      </select><br>
																      <textarea class="form-control form-control-sm" id="questionMember<%=i %>" rows="3" name="questionDelivery"><%=faqMemberList.get(i).getQuestion() %></textarea></td>
																      <td><textarea class="form-control form-control-sm" id="answerMember<%=i %>" rows="10" name="answerDelivery"><%=faqMemberList.get(i).getAnswer() %></textarea></td>
																      <td><button type="button"  class="btn btn-warning"  name="<%=faqMemberList.get(i).getNum()%>,<%=i %>" onclick="editMemberFaq(this)">수정</button>&nbsp;<button type="button" class="btn btn-danger" name="<%=faqMemberList.get(i).getNum()%>" onclick="delMemberFaq(this)">삭제</button></td>
																 	  <input type="hidden" name="order" value="<%=faqMemberList.get(i).getOrder()%>" />
																 	   <input type="hidden" name="num" value="<%=faqMemberList.get(i).getNum() %>" />
																 	    <input type="hidden" name="div" value="3" />
																    </tr>
															
																    	<%
																			  }
																   	}else{
																		%>
																		 <tr><td colspan="3" class="text-center">등록된 항목이 없습니다.</td></tr>
																		<%
																   		}
																		%>
																  </tbody>
																</table>
																	
													   </div>	
													</div>   
													<div class="row justify-content-md-center">
													<input type="button"  id="memberBtn" value="순서저장" class="btn btn-primary btn-lg " onclick="memberOrder(); return false;"/>&nbsp;
													<input type="button"  value="Faq등록" class="btn btn-secondary btn-lg " onclick="faqWriter();"/>
													</div>
												</form>
											  </div>
				</div>
		
	
		<!-- form end -->
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