<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = (String)session.getAttribute("id");
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
    <script src="../js/member.js" ></script>
    <script>
    	
    	function addCart(){
    		var bookNum = $("#bookNum").val();
    		var memberId  = $("#memberId").val();
    		var bookId = $("#bookId").val();
    		var query = {
    				bookNum : bookNum,
    				memberId : memberId,
    				bookId : bookId
    		};
    
    		
    		if(memberId=="null"){
    			alert("로그인이 필요한 서비스 입니다.");
    			location.href="./Controller.do?command=login_form";
    		}else{
    			$.ajax({
        			type : "POST",
        			url : "./Controller.do?command=addCart",
        	    	data : query,
        			success : function(data){
        				alert("장바구니에 담겼습니다");
        				location.href="./Controller.do?command=cart&memberId="+memberId;
        			}
        		}) 
    		}
    		
    		
    	}
    	
    	function order(bookId){
    		var theForm = document.form;
    		var bookNum  = document.form.bookNum.value;
    		var memberId  = document.form.memberId.value;
    		theForm.method="POST";
    		theForm.action="./Controller.do?command=order&bookId="+bookId;
    		theForm.submit();
    	}
    	
    	function search(){
    		 var key = $("#searchKey").val();
    		 $.ajax({
     			type: "GET", 
     			processData: false,
     	        contentType: false,
     			url: "./Controller.do?command=bookSearchLoading&searchKey="+key, 
     			dataType: 'json',
                 success : function(obj) {
                     showempinfo(obj); 
                 },
                 beforeSend : function(){
     				$(".spinner-border").removeClass("displayLoding");
     			},
     			complete:function(){
     				$(".spinner-border").addClass("displayLoding");	
     			}
             })
    	}
    	
    	function enter(){
			if (window.event.keyCode == 13) {
	            search();
	        }
		}
    	
    	function getCateBestBook(cate){
    		$.ajax({
    			type: "GET", 
    			processData: false,
    	        contentType: false,
    			url: "./Controller.do?command=bookBestCateLoading&category="+cate, 
    			dataType: 'json',
                success : function(obj) {
                    showempinfo(obj); 
                },
                beforeSend : function(){
    				$(".spinner-border").removeClass("displayLoding");
    			},
    			complete:function(){
    				$(".spinner-border").addClass("displayLoding");	
    			}
            })
    	}
    	
    	function bookBestAllLoding(){
    		$.ajax({
    			type: "GET", 
    			processData: false,
    	        contentType: false,
    			url: "./Controller.do?command=bookBestLoading", 
    			dataType: 'json',
                success : function(obj) {
                    showempinfo(obj); 
                },
                beforeSend : function(){
    				$(".spinner-border").removeClass("displayLoding");
    			},
    			complete:function(){
    				$(".spinner-border").addClass("displayLoding");	
    			}
            })
    	}
    	function showempinfo(obj){
    		var result = $("#res");
    		var img = null;
    		html = "";
    		if(obj.length == 0){
    			html = "<div style='width:100%;margin:0 auto'>데이터가 없습니다</div>";
    		}else{
    			for(var i in obj) {
        			if(obj[i].bookImage==null){
        				img = "default.jpg";
        			}else{
        				img = obj[i].bookImage;
        			}
        			html += "<div class='col mb-4'>";
        			html += "<div class='card'>";
        			html += "<img src='/bookUpload/"+img+"' class='card-img-top' alt='' />";
        			html += "<div class='card-body text-center'>";
        			html += "<h5 class='card-title'>"+obj[i].bookName+"</h5>";
        			html += "<p class='card-text text-center'>"+obj[i].author+"<br>"+obj[i].sellingPrice+"원&nbsp;<span style='font-size:11px;color:#999'>"+obj[i].rate+"% 할인</span></p>";
        			html+= "</div>";
    				html += "</div>";
        			html += "</div>";
        		} 
    		}
    		
    	
    		//alert(html);
    		   result.html(html);
    		//console.log(obj);
    	}
    </script>
    <%
    BookVo oneBook = (BookVo)request.getAttribute("oneBook");
    %>
  </head>
  <body>
    <div class="container">
	<jsp:include page="/subheader.jsp" />
 <main>

				
				<div class="row justify-content-md-center" >
				  <div class="col col-md-4" >
				  
					  <%if(oneBook.getBookImage()==null){%>
				    	   	<img src="/bookUpload/default.jpg" alt="" style="height:190px;width:170px" class="img-thumbnail">
				       	<%
				       		}else{
				       	%>
				        <img src="/bookUpload/<%=oneBook.getBookImage()%>" alt="" style="height:190px;width:170px" class="img-thumbnail">
				        <%
				       		}
				        %>
				  </div>
				  <div class="col col-md-5">
						<p class="h2"><%=oneBook.getBookName() %></p>
						 <p class="h4 text-secondary"><%=oneBook.getBookSubTitle() %></p>
						<p><small class="text-muted"><%=oneBook.getAuthor() %> 저 | <%=oneBook.getPublishing() %> | <%=oneBook.getPublishDay() %></small></p>
						<p><small class="text-muted">정   가 : <%=oneBook.getCost()%></small></p>
						<p><small class="text-muted">판매가 :<%=oneBook.getSellingPrice()%> (<%=oneBook.getRate()%>%할인)</small></p>
						 
							<div class="row justify-content-md-left">	    
							
							<input type="hidden" name="memberId"  value="<%=id %>" id="memberId"/>
							<input type="hidden" name="bookId"  value="<%=oneBook.getBookId() %>"  id="bookId"/>
							<p><select  class="form-control" name="bookNum" id="bookNum">
								      <option value="1">1</option>
								      <option value="2">2</option>
								      <option value="3">3</option>
								      <option value="4">4</option>
								      <option value="5">5</option>
								    </select></p>
								<button type="button"  class="btn btn-secondary btn-lg" onclick="addCart()">장바구니</button>
								<button type="button"  class="btn btn-secondary btn-lg" onclick="order('<%=oneBook.getBookId()%>')">주문하기</button>
						
						     </div>
				  </div>
				</div>
				<div class="row justify-content-md-center">
		
					  <div class="col col-md-9">
					    <br><br>
						<p class="h4">도서정보</p>
						<table class="table table-bordered" >
								  <tbody >
									 <tr >
										  <th scope="col" class="table-active" >출간일</th>
										  <td ><%=oneBook.getPublishDay() %></td>
									 </tr>	 
									  <tr>
										  <th scope="col"  class="table-active">쪽수, 무게, 크기</th>
										  <td><%=oneBook.getPageNum()%>쪽 | <%=oneBook.getWeight()%>g | <%=oneBook.getSize()%></td>
									 </tr>
									  <tr>
										  <th scope="col"  class="table-active">ISBN</th>
										  <td><%=oneBook.getBookId()%></td>
									 </tr>
								  </tbody>
								</table>
					  </div>
				</div>
				 <br><br>
				
				<div class="row justify-content-md-center">
					
					  <div class="col col-md-9">
					  	<p class="h4">관련분류</p>
						 <p><%=oneBook.getCategory1()%> > <%=oneBook.getCategory2() %></p>

					  </div>
				</div>
				<br><br>
				
				<div class="row justify-content-md-center">

					  <div class="col col-md-9">
					 	 <p class="h4">책소개</p>
						 <p>
						 	<%=oneBook.getComment()%>
						 </p>
					  </div>
				</div>
			</div>
 	
 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
