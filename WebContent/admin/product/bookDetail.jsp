<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<BookVo> oneBook = (ArrayList<BookVo>) request.getAttribute("oneBook");
%>
<%
	for(int i=0; i<oneBook.size();i++){
%>
			<div class="container-fluid">
				<div class="row">
				  <div class="col-md-4"><img src="./bookUpload/<%=oneBook.get(i).getBookImage() %>" alt="..." class="img-thumbnail"></div>
				  <div class="col-md-8">
						<p class="h2"><%=oneBook.get(i).getBookName() %></p>
						 <p class="h4 text-secondary">책 부제</p>
						<p><small class="text-muted"><%=oneBook.get(i).getAuthor() %> 저 | <%=oneBook.get(i).getPublishing() %> | <%=oneBook.get(i).getPublishDay() %></small></p>
						<p><small class="text-muted">정   가 : <%=oneBook.get(i).getCost()%></small></p>
						<p><small class="text-muted">판매가 :<%=oneBook.get(i).getSellingPrice()%> (<%=oneBook.get(i).getRate()%>%할인)</small></p>
					
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
										  <td ><%=oneBook.get(i).getPublishDay() %></td>
									 </tr>	 
									  <tr>
										  <th scope="col"  class="table-active">쪽수, 무게, 크기</th>
										  <td><%=oneBook.get(i).getPageNum()%>쪽 | <%=oneBook.get(i).getWeight()%>g | <%=oneBook.get(i).getSize()%></td>
									 </tr>
									  <tr>
										  <th scope="col"  class="table-active">ISBN</th>
										  <td><%=oneBook.get(i).getBookId()%></td>
									 </tr>
								  </tbody>
								</table>
					  </div>
				</div>
				 <br><br>
				<p class="h4">관련분류</p>
				<div class="row">
					  <div class="col-md-12">
						 <p><%=oneBook.get(i).getCategory1()%> > <%=oneBook.get(i).getCategory2() %></p>

					  </div>
				</div>
				<br><br>
				<p class="h4">책소개</p>
				<div class="row">
					  <div class="col-md-12">
						 <p>
						 	<%=oneBook.get(i).getComment()%>
						 </p>
					  </div>
				</div>
			</div>
<%
	}
%>