<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="col-md ">
				<form action="Board.do?command=board_write" method="post" enctype="multipart/form-data">
				<input type="hidden" name="command"  value="board_write" />
					<div class="form-group">
					    <input type="text" class="form-control" id="board_subject" name="board_subject" placeholder="게시글 제목">
					</div>

					<div class="form-group">
						<textarea class="form-control" id="board_content" name="board_content"	rows="13" placeholder="게시글 작성"></textarea>
					</div>
					<div class="form-group">
						<input type="file" name="uploadFile" />
					</div>
					<div>
						
						<input type="submit" value="글쓰기"  class="btn btn-info"/>
						<a href="./Board.do?command=board_list"  class="btn btn-success">목록</a>
					</div>
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>