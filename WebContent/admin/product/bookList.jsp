<%@page import="com.pe.bluering.vo.PageInfo"%>
<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="com.pe.bluering.dao.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String bookId = request.getParameter("bookId");
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
<link href="./custom.css" rel="stylesheet">
<link href="dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="../js/jquery-ui.css">
<script src="../js/bookRegist.js"></script>
<script>


</script>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<main role="main" class="col-md-12 ml-sm-auto col-lg-10 px-md-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">상품목록</h1> 
			<p><span>Home</span> > <span>상품목록</span></p>
		</div>
		<div class="row" >
		<div class="col-md-12">

			<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col" >#</th>	
				      <th scope="col">책 이름</th>
				      <th scope="col">저자</th>
				      <th scope="col">출판사</th>
				      <th scope="col">정가</th>
				      <th scope="col" class="text-center">관리</th>

				    </tr>
				  </thead>
				  <tbody>
				  <%
				   
					  for(int i=0; i<bookList.size();i++){
				  %>
				    <tr>
				       <td style="vertical-align:middle">  <img src="/bookUpload/<%=bookList.get(i).getBookImage()%>" alt="" style="height:90px;width:70px" class="img-thumbnail"></td>
				       <td style="vertical-align:middle"><a href="#addBookDialog"  data-id="<%=bookList.get(i).getBookId()%>" data-toggle="modal" class="open-AddBookDialog"><%=bookList.get(i).getBookName()%></a></td>
				       <td style="vertical-align:middle"><%=bookList.get(i).getAuthor()%></td>
				       <td style="vertical-align:middle"><%=bookList.get(i).getPublishing() %></td>
				       <td style="vertical-align:middle"><%=bookList.get(i).getCost() %>
				       <td style="vertical-align:middle" colspan="2"><a href="#" class="btn btn-warning btn-sm">수정</a>&nbsp;<a href="#" class="btn btn-danger btn-sm">삭제</a></td>
				    </tr>
						
				   <%
					  }
				   %>
				  </tbody>
				</table>
				<nav aria-label="Page navigation example" >
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
							  <a class="page-link" href="AdminController.do?command=BookList&page=<%=nowPage-1 %>" aria-label="Previous">
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
					  <li class="page-item"><a class="page-link" href="AdminController.do?command=BookList&page=<%=i %>"><%=i%></a></li>
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
							 <a class="page-link" href="AdminController.do?command=BookList&page=<%=nowPage+1 %>" aria-label="Next">
				       			 <span aria-hidden="true">&raquo;</span>
				     		 </a>
						<%
							}
						%>
				     
				    </li>
				  </ul>
				</nav>
			
			
				
		</div>
		</div>
	</main>
    <!-- Modal -->	
<div class="modal fade " id="addBookDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
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
        <button type="button" class="btn btn-primary">Save changes</button>
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
				})

		})

	</script>
</body>
</html>