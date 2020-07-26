<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getParameter("command");
	String active = "active";
	String type = null;
%>   
<%if(url.equals("BookList")){
	type="productSearch";
}else if(url.equals("orderForm")){
	type = "orderSearch";
}else if(url.equals("customer")){
	type = "customerSearch";
}
%>

<%if(url.equals("BookList")){ %>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="../portfolio2/Controller.do?command=index">Bluering BookStore</a>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" name="searchKey" id="searchKey" onKeyup="enter()">
  <input type="hidden" name="type" value="<%=type%>" />
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <input type="button" class="nav-link  btn btn-dark" value="검색"  onclick="search()">
    </li>
  </ul>
</nav>
<%
}else{
%>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="../portfolio2/Controller.do?command=index">Bluering BookStore</a>
  <input type="hidden" name="type" value="<%=type%>" />
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      
    </li>
  </ul>
</nav>
<%
}
%>


<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link <%if(url.equals("index")){%><%=active %><%}%>"  href="AdminController.do?command=index">
              <span data-feather="home"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <%if(url.equals("orderForm")){%><%=active %><%}%>" href="AdminController.do?command=orderForm">
              <span data-feather="file"></span>
              Orders<span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <%if(url.equals("productWriteForm") || url.equals("BookList")){%><%=active %><%}%>" href="AdminController.do?command=productWriteForm">
              <span data-feather="shopping-cart"></span>
              Products
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <%if(url.equals("customer")){%><%=active %><%}%>" href="AdminController.do?command=customer">
              <span data-feather="users"></span>
              Customers
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              Reports
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="command"></span>
				Event
            </a>
          </li>
		   <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="gift"></span>
               Coupon
            </a>
          </li>
		   <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="package"></span>
               Popup / Banner
            </a>
          </li>
		   <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="mic"></span>
              Q&A
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>
  <script src="../js/jquery-1.11.3.min.js"></script>
  <script>
		function search(){
			var key = $("#searchKey").val();
			if(key.length>0){

				$.ajax({
			        type: "get",
			        cache: false,
			        url: "./AdminController.do?command=Search",
			        data: 'searchKey='+key, 
			        dataType: 'html',
			        success: function(data) {
						//alert(data);
						if(data != null){
							$("#tblBody").html(data);
							$(".paging").css("display","none");
						}
			        },beforeSend : function(){
						$(".spinner-border").removeClass("displayLoding");
					},
					complete:function(){
						$(".spinner-border").addClass("displayLoding");	
					}
			    }) 
			}else if(key.length==0){
				location.reload();
			}
	 	
		}
		
		function enter(){
			if (window.event.keyCode == 13) {
	            search();
	        }
		}


</script>