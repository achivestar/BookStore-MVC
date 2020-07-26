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
	 <td style="vertical-align:middle"><img src="/bookUpload/<%=searchBook.get(i).getBookImage()%>" alt="" style="height:90px;width:70px" class="img-thumbnail"></td>
	<td style="vertical-align:middle"><a href="#addBookDialog"  data-id="<%=searchBook.get(i).getBookId()%>" data-toggle="modal" class="open-AddBookDialog"><%=searchBook.get(i).getBookName()%></a></td>
	<td style="vertical-align:middle"><%=searchBook.get(i).getAuthor()%></td>
	<td style="vertical-align:middle" colspan="2"><a href="#" class="btn btn-warning btn-sm">수정</a>&nbsp;<a href="#" class="btn btn-danger btn-sm">삭제</a></td>
	</tr>
	
	
<%
	}
%>
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
						if(data !=null){
						$('.modal-body').html(data);
						
						}
					}
					,beforeSend : function(){
						$(".spinner-border").removeClass("displayLoding");
					},
					complete:function(){
						$(".spinner-border").addClass("displayLoding");	
					}
					
				})

		})
		
	</script>
