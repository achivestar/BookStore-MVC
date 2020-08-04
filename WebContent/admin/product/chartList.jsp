<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int totalBookCount = (Integer)request.getAttribute("totalBookCount");
ArrayList<BookVo> bookCount = (ArrayList<BookVo>) request.getAttribute("bookCount");
%>    
				<div style="border:1px solid #ddd;padding:20px">
					<p>현재 등록된 도서 <%=totalBookCount %>권</p>
					<%
					  for(int i=0; i<bookCount.size();i++){
				  %>
					<p><%=bookCount.get(i).getCategory1() %> :  <%=bookCount.get(i).getBooksCount()%>권</p>
					<%
					  }
					%>
				</div>	
				<script type="text/javascript">
				google.charts.load('current', {packages: ['corechart', 'bar']});
				google.charts.setOnLoadCallback(drawMultSeries);
				 
				function drawMultSeries() {
				      var data = google.visualization.arrayToDataTable([
				        ['', '단위 (권)'],
				    	<%
						  for(int i=0; i<bookCount.size();i++){
					  %>
				        ['<%=bookCount.get(i).getCategory1() %>', <%=bookCount.get(i).getBooksCount()%>],

				        <%
						  }
						%>
				      ]);
				 
				      var options = {
				        title: '각 등록된 도서 총 수량',
				        chartArea: {width: '50%'}
				       
				      };
				 
				      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
				      chart.draw(data, options);
				    }
   				</script>
				<br>
				<div id="chart_div"></div>
				<br>
				
