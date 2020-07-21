<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="com.pe.bluering.dao.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				      <th scope="col">#</th>	
				      <th scope="col">책 이름</th>
				      <th scope="col">저자</th>
				      <th scope="col">출판사</th>
				      <th scope="col">원가</th>
				      <th scope="col">수정/삭제</th>

				    </tr>
				  </thead>
				  <tbody>
				  <%
						BookDAO bookDao = new BookDAO();
						ArrayList<BookVo> bookList = bookDao.selectAllBook();
					  for(int i=0; i<bookList.size();i++){
				  %>
				    <tr>
				       <td>  <img src="/bookUpload/<%=bookList.get(i).getBookImage()%>" alt="" style="height:160px" class="img-thumbnail"></td>
				       <td><%=bookList.get(i).getBookName()%></td>
				       <td><%=bookList.get(i).getAuthor()%></td>
				       <td><%=bookList.get(i).getPublishing() %></td>
				       <td><%=bookList.get(i).getCost() %>
				       <td colspan="2"><a href="#" class="btn btn-warning btn-sm">수정</a>&nbsp;<a href="#" class="btn btn-danger btn-sm">삭제</a></td>
				    </tr>
				   <%
					  }
				   %>
				  </tbody>
				</table>
		</div>
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

</body>
</html>