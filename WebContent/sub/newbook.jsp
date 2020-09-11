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
   <style>
	.displayLoding{
		display:none;
	}
</style>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../assets/dist/js/bootstrap.bundle.js"></script>
    <script src="../js/member.js" ></script>
    <script>
    	$(document).ready(function(){
    		bookAllLoding();
    	});
    	
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
    	
    	function getCateBook(cate){
    		$.ajax({
    			type: "GET", 
    			processData: false,
    	        contentType: false,
    			url: "./Controller.do?command=bookCateLoading&category="+cate, 
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
    	
    	function bookAllLoding(){
    		$.ajax({
    			type: "GET", 
    			processData: false,
    	        contentType: false,
    			url: "./Controller.do?command=bookLoading", 
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
    ArrayList<BookVo> bookList = (ArrayList<BookVo>) request.getAttribute("searchList");
    %>
  </head>
  <body>
    <div class="container">
		<jsp:include page="/top.jsp" />
 <main>
 		 <h2>신간도서</h2>    
 			 <div class="row">
				<div class="col-lg-3" >
						<nav class="nav flex-column">
						  <a class="nav-link active" href="#none" onclick="getCateBook(1)">IT/모바일</a>
						  <a class="nav-link" href="#none" onclick="getCateBook(2)">소설/시/희곡</a>
						  <a class="nav-link" href="#none" onclick="getCateBook(3)">어린이</a>
						  <a class="nav-link" href="#none" onclick="getCateBook(4)">에세이</a>
						  <a class="nav-link" href="#none" onclick="getCateBook(5)">종교</a>			
						</nav>
				</div>
				<div class="col-lg-9" >
						
						<div class="row row-cols-1 row-cols-md-3"  id="res">
					   </div>
					
				</div>
			<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
  					<span class="sr-only">Loading...</span>
			</div>
 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
