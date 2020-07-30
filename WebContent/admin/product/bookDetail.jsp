<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookVo oneBook = (BookVo)request.getAttribute("oneBook");
%>

			<div class="container-fluid">
				<div class="row">
				  <div class="col-md-4"><img src="../bookUpload/<%=oneBook.getBookImage() %>" alt="..." class="img-thumbnail"></div>
				  <div class="col-md-8">
						<p class="h2"><%=oneBook.getBookName() %></p>
						 <p class="h4 text-secondary"><%=oneBook.getBookSubTitle() %></p>
						<p><small class="text-muted"><%=oneBook.getAuthor() %> 저 | <%=oneBook.getPublishing() %> | <%=oneBook.getPublishDay() %></small></p>
						<p><small class="text-muted">정   가 : <%=oneBook.getCost()%></small></p>
						<p><small class="text-muted">판매가 :<%=oneBook.getSellingPrice()%> (<%=oneBook.getRate()%>%할인)</small></p>
					
				  </div>
				</div>
				<div class="row">
					  <div class="col-md-12">
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
				<p class="h4">관련분류</p>
				<div class="row">
					  <div class="col-md-12">
						 <p><%=oneBook.getCategory1()%> > <%=oneBook.getCategory2() %></p>

					  </div>
				</div>
				<br><br>
				<p class="h4">책소개</p>
				<div class="row">
					  <div class="col-md-12">
						 <p>
						 	<%=oneBook.getComment()%>
						 </p>
					  </div>
				</div>
			</div>
