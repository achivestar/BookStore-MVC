<%@page import="com.pe.bluering.service.ServiceCartCount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	ServiceCartCount cartcount = new ServiceCartCount();
	int count = cartcount.getCount(id);
%>
<header class="blog-header py-3">
	<div class="py-2 text-right">

		<%
        	if(id == null){%>
		<a class="btn btn-sm fnt" href="./Controller.do?command=login_form">로그인</a> <a
			class="btn btn-sm fnt"  href="./Controller.do?command=contract">회원가입</a>
		<%
        	}else{
		%>
		
		<a class="btn btn-sm fnt" href="./Controller.do?command=logout">로그아웃</a>
		<a class="btn btn-sm fnt" href="./Controller.do?command=memberModify">회원수정</a>
		<%
        	}
		%>
		<a class="btn btn-sm fnt" href="./Controller.do?command=mypage&memberId=<%=id%>">마이페이지</a> 
		<a class="btn btn-sm fnt"	href="./Controller.do?command=cart&memberId=<%=id%>">장바구니
		<%if(id!=null){ %><span class="badge badge-primary"><%=count %></span><%} %></a>
		<%
        	if(id!=null&&id.equals("admin")){%>
		<a class="btn btn-sm fnt btn-outline-info"  role="button"  href="./admin/AdminController.do?command=index" >관리자</a> 
		<%
        	}
		%>
	</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" href="./Controller.do?command=index">브랜드로고</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbars" aria-controls="navbars" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbars">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="./Controller.do?command=newbook">신간도서</a></li>
				<li class="nav-item"><a class="nav-link" href="./Controller.do?command=bestbook">베스트도서</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Event</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">QnA</a> <a class="dropdown-item"
							href="#">문의게시판</a>
					</div></li>
			</ul>
			<div class="form-inline my-2 my-lg-0" >
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search" value="" id="searchKey" onKeyup="enter()"> 
				<button class="btn btn-secondary my-2 my-sm-0" type="submit"  onclick="search()">Search</button>
			</div>
		</div>
	</nav>
</header>
<script>
    	$(document).ready(function(){
    	//	bookAllLoding();
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
        			html += "<div class='card'><a href='./Controller.do?command=bookDetail&bookId="+obj[i].bookId+"' style='text-decoration:none'>";
        			html += "<img src='/bookUpload/"+img+"' class='card-img-top' alt='' />";
        			html += "<div class='card-body text-center'>";
        			html += "<h5 class='card-title'>"+obj[i].bookName+"</h5>";
        			html += "<p class='card-text text-center'>"+obj[i].author+"<br>"+obj[i].sellingPrice+"원&nbsp;<span style='font-size:11px;color:#999'>"+obj[i].rate+"% 할인</span></p>";
        			html+= "</div>";
    				html += "</a></div>";
        			html += "</div>";
        		} 
    		}
    		
    	
    		//alert(html);
    		   result.html(html);
    		//console.log(obj);
    	}
    </script>