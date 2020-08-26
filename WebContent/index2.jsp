<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String fileDir = "bookUpload";
String fileName = "10.jpg";
String filePath = request.getRealPath(fileDir) + "/";
filePath += fileName;
File f = new File(filePath);
if(f.exists()){
	f.delete();
%>	
file 삭제됨
<%
}else{
%>
	file 없음
<%
}
%>
</body>
</html>