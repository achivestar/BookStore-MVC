<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<BookVo> searchBook = (ArrayList<BookVo>) request.getAttribute("searchList");
%>
<%
	for(int i=0; i<searchBook.size();i++){
%>
	<tr>
			<td style="vertical-align:middle">  <img src="/bookUpload/<%=searchBook.get(i).getBookImage()%>" alt="" style="height:90px;width:70px" class="img-thumbnail"></td>
			 <td style="vertical-align:middle"><a href="#addBookDialog"  data-id="<%=searchBook.get(i).getBookId()%>" data-toggle="modal" class="open-AddBookDialog"><%=searchBook.get(i).getBookName()%></a></td>
			<td style="vertical-align:middle"><%=searchBook.get(i).getAuthor()%></td>
			<td style="vertical-align:middle" colspan="2">
			<a href="#modifyModal" data-id="<%=searchBook.get(i).getBookId()%>" data-toggle="modal"  class="btn btn-warning btn-sm open-ModifyBookDialog">수정</a>
				       &nbsp;<a href="#deleteModal" data-id="<%=searchBook.get(i).getBookId()%>" data-toggle="modal" class="btn btn-danger btn-sm open-DeleteBookDialog" >삭제</a></td>
		</tr>
	
<%
	}
%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

	<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
	<script 	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="dashboard.js"></script>
	<script src="../js/jquery-1.11.3.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
<script>
$(".open-AddBookDialog").click(function(){
	var myBookId = $(this).data('id'); 
	
		$.ajax({
			type: "GET", 
			processData: false,
	        contentType: false,
			url: "AdminController.do?command=BookDetail", 
			data: 'myBookId='+myBookId, 
			dataType: 'html',
			success: function(data){
				$('.modal-body').html(data);
			}
			,beforeSend : function(){
				$(".spinner-border").removeClass("displayLoding");
			},
			complete:function(){
				$(".spinner-border").addClass("displayLoding");	
			}
			
		})

});

$(".open-ModifyBookDialog").click(function(){
	var myBookId = $(this).data('id'); 
		$.ajax({
			type: "GET", 
			processData: false,
	        contentType: false,
			url: "AdminController.do?command=BookModify", 
			data: 'myBookId='+myBookId, 
			dataType: 'html',
			success: function(data){
			
				$('.modal-modify-body').html(data);
			}
			,beforeSend : function(){
				$(".spinner-border").removeClass("displayLoding");
			},
			complete:function(){
				$(".spinner-border").addClass("displayLoding");	
			}
			
		})

});

$(".open-DeleteBookDialog").click(function(){
	var myBookId = $(this).data('id'); 

	$("#deleteBook").click(function(){
		$.ajax({
			type: "GET", 
			processData: false,
	        contentType: false,
			url: "AdminController.do?command=BookDelete", 
			data: 'myBookId='+myBookId, 
			dataType: 'text',
			success: function(data){
					location.href="AdminController.do?command=BookList&page=1&category=0";
			}
			,beforeSend : function(){
				$(".spinner-border").removeClass("displayLoding");
			},
			complete:function(){
				$(".spinner-border").addClass("displayLoding");	
			}
			
		})
	});
});
		
	</script>
