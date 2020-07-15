<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<header class="blog-header py-3">
	<div class="py-2 text-right">
		<%
        	if(id == null){
        %>
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
		<a class="btn btn-sm fnt" href="./Controller.do?command=mypage">마이페이지</a> 
		<a class="btn btn-sm fnt"	href="./Controller.do?command=cart">장바구니</a>
	</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" href="#">브랜드로고</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbars" aria-controls="navbars" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbars">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">신간도서</a></li>
				<li class="nav-item"><a class="nav-link" href="#">베스트도서</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Event</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">QnA</a> <a class="dropdown-item"
							href="#">문의게시판</a>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
</header>