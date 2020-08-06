<%@page contentType="application/vnd/ms-excel;charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"  %>
<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Content-Disposition", "Attachment;filename=productList.xls");
	response.setHeader("Content-Description", "JSP Generated Date");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

List<BookVo> list = (List<BookVo>)request.getAttribute("list");

%>
<table width="1024" bordercolor="#a2afcc" >
	<thead>
		<tr align="center">
				<th scope="col" bgcolor="CDCDCD">ISBN</th>
				<th scope="col" bgcolor="CDCDCD">도서명</th>
				<th scope="col" bgcolor="CDCDCD">저자</th>
				<th scope="col" bgcolor="CDCDCD">출판사</th>
				<th scope="col" bgcolor="CDCDCD">출판일</th>
				<th scope="col" bgcolor="CDCDCD">정가</th>
				<th scope="col" bgcolor="CDCDCD">할인율</th>
				<th scope="col" bgcolor="CDCDCD">판매가</th>
				<th scope="col" bgcolor="CDCDCD">페이지 수</th>
				<th scope="col" bgcolor="CDCDCD">무게</th>
				<th scope="col" bgcolor="CDCDCD">사이즈</th>
				<th scope="col" bgcolor="CDCDCD">1차 카테고리</th>
				<th scope="col" bgcolor="CDCDCD">2차 카테고리</th>
		</tr>
	</thead>
	<tbody>
		<%
			for(int i=0; i<list.size();i++){
		%>
			<tr>
				<td align="center"><%=list.get(i).getBookId() %></td>
				<td align="center"><%=list.get(i).getBookName()%></td>
				<td align="center"><%=list.get(i).getAuthor() %></td>
				<td align="center"><%=list.get(i).getPublishing() %></td>
				<td align="center"><%=list.get(i).getPublishDay()%></td>
				<td align="center"><%=list.get(i).getCost()%></td>
				<td align="center"><%=list.get(i).getRate()%></td>
				<td align="center"><%=list.get(i).getSellingPrice() %></td>
				<td align="center"><%=list.get(i).getPageNum() %></td>
				<td align="center"><%=list.get(i).getWeight()%></td>
				<td align="center"><%=list.get(i).getSize()%></td>
				<td align="center"><%=list.get(i).getCategory1()%></td>
				<td align="center"><%=list.get(i).getCategory2()%></td>
						
			</tr>
		<%
			}
		%>
	</tbody>
</table>

</body>
</html>