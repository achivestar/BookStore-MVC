<%@page import="com.pe.bluering.vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<title>IT Book Store</title>
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#no</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${articleList}">
						<tr>
							<th scope="row">	${board.board_num }</th>
							<td>${board.board_subject }</td>
							<td>${board.date}</td>
							<td>${board.board_readcount }</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md">
				<a href="./Board.do?command=board_write_form" class="btn btn-info">글쓰기</a>
			</div>
		</div>
</div>



</body>
</html>