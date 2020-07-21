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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
   <script src="../assets/dist/js/bootstrap.bundle.js"></script>
    <script src="../js/member.js" ></script>

    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">

  </head>
  <body>
   <%
   		String message = (String)request.getAttribute("message");
        String site = request.getParameter("site");
   %>
    <div class="container">
	<jsp:include page="/top.jsp" />
 <main class="row">
 		<div class="col-md-8 col-lg-8" style="float:none;margin:0 auto">
 			 <h2>로그인</h2>    
				<div class="col-lg-4"></div>
							<div class="jumbotron text-center" style="padding-top:20px;">
								<form method="post" action="./Controller.do?command=login_action"  name="loginForm" >
										<div class="form-group">
											<input type="text" class="form-control" placeholder="아이디"  name="userID" maxlength="20" />
										</div>
										<div class="form-group">
											<input type="password" class="form-control" placeholder="비밀번호"  name="userPassword" maxlength="20" />
										</div>
										<input type="hidden" value="<%=site %>" name="site" />
										<input type="submit" class="btn btn-primary form-control" value="로그인" /> 
								</form>
								<br><br>
								<%
									if(message!=null){
								%>
								<div class="alert alert-danger" role="alert"><%=message %></div>
								<%
									}
								%>
								
							</div>
							
	</div>
 </main>
	<jsp:include page="/bottom.jsp" />
</div>
</body>
</html>
