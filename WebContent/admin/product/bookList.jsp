<%@page import="com.pe.bluering.vo.PageInfo"%>
<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="com.pe.bluering.dao.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String bookId = request.getParameter("bookId");
	String filter = request.getParameter("category");
	String num = null;
	ArrayList<BookVo> bookList = (ArrayList<BookVo>) request.getAttribute("bookList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();

%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard | bluering BookStore</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<link href="./assets/dist/css/bootstrap.css" rel="stylesheet">
<style>
	.displayLoding{
		display:none;
	}
	.paging{
		display:block;
	}
</style>
<link href="./custom.css" rel="stylesheet">
<link href="dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="../js/jquery-ui.css">

<script src="../js/bookRegist.js"></script>
</head>
<body>

	<jsp:include page="../menu.jsp" />

	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">상품목록</h1> 
			<p><span>Home</span> > <span>상품목록</span></p>
		</div>
		<div class="row" >

		<div class="col-md-8">
		<div class="form-row" >
				<div class="form-group col-md-4 ">
				<form method="post" name="filterForm"  action="AdminController.do?command=BookList">
					<select id="category" class="form-control" name="category" onchange="filterChange(this.form)">
							 	<option value="0" <%if(filter.equals("0")){%>selected <%} %>>ALL</option>
						        <option value="1" <%if(filter.equals("1")){%>selected <%} %>>IT모바일</option>
						        <option value="2" <%if(filter.equals("2")){%>selected <%} %>>소설/시/희곡</option>
						        <option value="3" <%if(filter.equals("3")){%>selected <%} %>>어린이</option>
						        <option value="4" <%if(filter.equals("4")){%>selected <%} %>>에세이</option>
						        <option value="5" <%if(filter.equals("5")){%>selected <%} %>>종교</option>
					</select>
					</form>
				</div>
		</div>
			<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col" >#</th>	
				      <th scope="col">책 이름</th>
				      <th scope="col">저자</th>
				      <th scope="col" class="text-center">관리</th>

				    </tr>
				  </thead>
				  <tbody id="tblBody">
				  <%
					  for(int i=0; i<bookList.size();i++){
				  %>
				    <tr>
				       <td style="vertical-align:middle">  <img src="/bookUpload/<%=bookList.get(i).getBookImage()%>" alt="" style="height:90px;width:70px" class="img-thumbnail"></td>
				       <td style="vertical-align:middle"><a href="#addBookDialog"  data-id="<%=bookList.get(i).getBookId()%>" data-toggle="modal" class="open-AddBookDialog"><%=bookList.get(i).getBookName()%></a></td>
				       <td style="vertical-align:middle"><%=bookList.get(i).getAuthor()%></td>
				       <td style="vertical-align:middle" colspan="2">
				       <a href="#modifyModal" data-id="<%=bookList.get(i).getBookId()%>" data-toggle="modal"  class="btn btn-warning btn-sm open-ModifyBookDialog">수정</a>
				       &nbsp;<a href="#deleteModal" data-id="<%=bookList.get(i).getBookId()%>" data-toggle="modal" class="btn btn-danger btn-sm open-DeleteBookDialog" >삭제</a></td>
				    </tr>
						
				   <%
					  }
				   %>
				  </tbody>
				</table>
		<%
			if(pageInfo!=null){
		%>		
				<nav aria-label="Page navigation example" class="paging">
				  <ul class="pagination"  style="justify-content: center;">
				    <li class="page-item">
				    	<%
							if(nowPage <=1){
						%>
							  <a class="page-link" href="#" aria-label="Previous">
				     			   <span aria-hidden="true">&laquo;</span>
				   			   </a>
						<%
							}else{
						%>
							  <a class="page-link" href="AdminController.do?command=BookList&page=<%=nowPage-1 %>&category=<%=filter %>" aria-label="Previous">
				      			  <span aria-hidden="true">&laquo;</span>
				   			   </a>

						<%
							}
						%>
				    
				    </li>
				<%
					for(int i = startPage; i<=endPage; i++){ 
						if(i==nowPage){
				%>
					<li class="page-item active" aria-current="page" ><a class="page-link"><%=i%></a></li>
				<%
					}else{
				%>
					  <li class="page-item"><a class="page-link" href="AdminController.do?command=BookList&page=<%=i %>&category=<%=filter %>"><%=i%></a></li>
				<% 
					 }
				}
				%>
				    <li class="page-item">
				    	<%
							if(nowPage>=maxPage){
						%>
							 <a class="page-link" href="#none" aria-label="Next">
				       			 <span aria-hidden="true">&raquo;</span>
				     		 </a>
						<%
							}else{
						%>
							 <a class="page-link" href="AdminController.do?command=BookList&page=<%=nowPage+1 %>&category=<%=filter %>" aria-label="Next">
				       			 <span aria-hidden="true">&raquo;</span>
				     		 </a>
						<%
							}
						%>
				     
				    </li>
				  </ul>
				</nav>
			
		<%
			}
		%>	
				
		</div>
		<div class="col-md-4 text-left">
			<div style="border:1px solid #ddd;padding:20px">
				<p>현재 등록된 도서 130권</p>
				<p>기술 30권</p>
				<p>만화 30권</p>
				<p>소설 20권</p>
				<p>잡지 43권</p>
				<p>에쎄이 17권</p>
			</div>	
			<br>
			<a href="AdminController.do?command=productWriteForm"  class="btn btn-outline-primary">상품등록</a>
			<button type="button" class="btn btn-outline-success">엑셀다운로드</button>
		</div>
		</div>
	</main>

    <!-- Modal -->	
<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
  <span class="sr-only">Loading...</span>
</div>
<div class="modal fade " id="addBookDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
		
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>

<!-- 도서수정모달 -->
<div class="modal fade" id="modifyModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도서정보수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-modify-body">

      </div>
    </div>
  </div>
</div>

<!-- 도서삭제모달 -->
<div class="modal fade" id="deleteModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도서정보삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">	
	    <p>정말 삭제 하시겠습니까?</p>
      </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  id="deleteBook">삭제</button>
 
      </div>
    </div>
  </div>
</div>


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
		
 		
	

		function filterChange(obj){
			obj.submit();
		}
	</script>
</body>
</html>