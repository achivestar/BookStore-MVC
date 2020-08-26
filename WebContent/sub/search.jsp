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
    
    <%
    ArrayList<BookVo> bookList = (ArrayList<BookVo>) request.getAttribute("searchList");
    %>
  </head>
  <body>
    <div class="container">
		<jsp:include page="/top.jsp" />
 <main>
 		 <h2>검색결과</h2>    
 			 <div class="row">
				<div class="col-lg-12" >
						<div class="row row-cols-1 row-cols-md-4"   id="res">
							<%
								if(bookList.size()>0){
									for(int i=0; i<bookList.size();i++){
							%>
							<div class='col mb-4'>
								<div class='card'><a href='./Controller.do?command=bookDetail&bookId=<%=bookList.get(i).getBookId()%>' style='text-decoration:none'>
								<img src='/bookUpload/"+img+"' class='card-img-top' alt='' />
									<div class='card-body text-center'>
									<h5 class='card-title'><%=bookList.get(i).getBookName() %></h5>
									<p class='card-text text-center'><%=bookList.get(i).getAuthor() %>
									<br><%=bookList.get(i).getSellingPrice() %>원&nbsp;<span style='font-size:11px;color:#999'><%=bookList.get(i).getRate()%>% 할인</span></p>
								</div>
								</a></div>
							</div>
							<%
									}
								}else{
							%>
								  <div style='width:100%;margin:0 auto'>검색결과가 없습니다</div>
							<%
								}
							%>
					   </div>
					 
					
			</div>
			<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
  					<span class="sr-only">Loading...</span>
			</div>
 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
