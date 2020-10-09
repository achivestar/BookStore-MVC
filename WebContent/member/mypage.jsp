<%@page import="com.pe.admin.service.BookListService"%>
<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="com.pe.bluering.service.BookOrderService"%>
<%@page import="com.pe.bluering.vo.OrderVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");
    MemberVO   mvo = null;
	String lev = null;
	String name = null;
	int point = 0;
	String profileImg =null;
	BookOrderService bookorder = new BookOrderService();
	ArrayList<OrderVo> orderList = bookorder.getOrder(id);
	if(id==null){
%>    
	<script>
		location.href="./Controller.do?command=login_form&site=mypage";
	</script>
<%
	}else{

			mvo = (MemberVO)session.getAttribute("loginUser");

	        if(mvo.getLev()==1){
				 lev = "<span class='badge badge-info'>일반</span>";
			 }else if(mvo.getLev()==2){
				 lev = "<span class='badge badge-success'>일반</span>";
			 }else if(mvo.getLev()==3){
				 lev = "<span class='badge badge-warning'>일반</span>";
			 }else{
				 lev = "<span class='badge badge-dark'>일반</span>";
			 }
	         name = mvo.getName();
	         point = mvo.getPoint();
	         profileImg = mvo.getProfileimg();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Bluering Book Store</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/custom.css">
    <!-- Bootstrap core CSS -->
   <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../slick/slick.css">
  <link rel="stylesheet" type="text/css" href="../slick/slick-theme.css">
  <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
  <style type="text/css">
    .slider {
        width: 80%;
        margin: 100px auto;
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
    
   .displayLoding{
		display:none;
	}
  </style>
<title>Insert title here</title>
</head>
<body>
  <div class="container">
<jsp:include page="/top.jsp" />
 <main>

 	 <h2>My page</h2>    
			<div class="col-lg-12 row">
				<div class="col-md-8 col-lg-8" style="padding-top:20px;width:100%;margin:0 auto;border:1px solid #dddd">
					
					<div class="card bg-light">
							  <div class="card-header">내 정보</div>
							  <div class="card-body">
								 <p><span style="font-weight:bold;color:blue"><%=name %></span>님 오늘도 행복한 하루 보내세요.</p>
								 <p class="align-middle">나의등급 <%=lev %> </p>
								 <div class="row">
									  <div class="col-xs-6 col-md-6">
										  <img src="/upload/<%=profileImg%>" alt="" style="height:160px" class="img-thumbnail">
									  </div>
									  
									  <div class="col-xs-12 col-md-6">
										<ul class="list-group">
											  <li class="list-group-item list-group-item-info">나의 point</li>
											  <li class="list-group-item text-right"><%=point %><span class="badge badge-primary">P</span></li>

										</ul>
									  </div>
									   <div class="col-xs-12 col-md-12 text-right ">
											  <a href="#" class="text-muted" style="font-size:12px">회원탈퇴</a>
									   </div>
								</div>
							 
							 
							 </div>
						</div>
						<br><br>
									<div class="card bg-light ">
							  <div class="card-header">최근 본 상품</div>
							  <div class="card-body">
								  <section class="regular slider">
								  <%
										Cookie [] cookies = request.getCookies();

								  		BookVo oneBook = null;
								  		if(cookies != null){
								  			for(Cookie c : cookies){
								  			  if(c.getName().indexOf("bookId")!=-1){
								  				 String bookId = c.getValue();
								  				 BookListService oneSelectBook = new BookListService();  
										  		  oneBook = oneSelectBook.getOneBook(bookId);
										  		  
								  		
								  %>
											
										    <div>
										     <a href="./Controller.do?command=bookDetail&bookId=<%=bookId%>">
										      	<img src="./bookUpload/<%=oneBook.getBookImage() %>"/>
										      </a> 
										      <p class="text-center"><%=oneBook.getBookName() %></p>
										    </div>
								  	 <%			
								  			  }
								  		  }
								    	}
									%>

									</section>
							  </div>
						</div>
						<br><br>
	
					
							<div class="card bg-light">
								  <div class="card-header">최근 주문한 내역</div>
								  <div class="card-body">
								    	 <div class="btn-group  btn-group-md" role="group" aria-label="Basic example">
										   <button type="button" class="btn btn-info"  onclick="getOrderBook(1)">1개월</button>
										   <button type="button" class="btn btn-info"  onclick="getOrderBook(2)">3개월</button>
										   <button type="button" class="btn btn-info"  onclick="getOrderBook(3)">6개월</button>
										   </div>
										
										   <div class="btn-group  btn-group-md" role="group" aria-label="Basic example">
										      <form class="form-inline">
										   <input type="text" id="sdate"  value=""  name="sdate"  size="14" class="form-control"> ~ <input type="text" id="edate"  value="" name="edate" size="14" class="form-control">
										    &nbsp;<button type="button" class="btn btn-primary" onclick="searchPeriod()">기간검색</button>
										    	</form>
										    </div>
										
										<br><br>
										
								  		<table class="table table-hover" >
														  <thead>
															<tr class="table-primary">
															  <th scope="col" class="text-center">상품명</th>
															  <th scope="col" class="text-center">판매가/수량</th>
															  <th scope="col" class="text-center">주문일자</th>
															  <th scope="col" class="text-center">주문상태</th>
															</tr>
														  </thead>
														  <tbody  id="res">
														      <%
														      if(orderList.size() >0){
																 	for(int i=0; i<orderList.size();i++){
																 		String orderDay = orderList.get(i).getBuy_date(); 
																 		String date[] = orderDay.split(" ");
																 %>
															<tr>
															  <th class="align-middle"><img src="<%=orderList.get(i).getBook_img()%>" alt=".." class="img-thumbnail align-middle " style="width:40px;height:58px">&nbsp; <%=orderList.get(i).getBook_title()%></th>
															  <td class="text-center align-middle"><span class="badge badge-primary">정가</span>&nbsp;<%=orderList.get(i).getPrice()%>/<%=orderList.get(i).getAmount() %></td>
															  <td class="text-center align-middle"><%=date[0]%></td>
															   <td class="text-center align-middle"><%=orderList.get(i).getState() %></td>
															</tr>
														 <%
 																	}
														      }else{
 														%>
 														<tr>
 															<td colspan="4" class="align-middle text-center">최근 1주일간 구매 내역이 없습니다.</td>
 														</tr>
 														<%
														      }
 														%>
														  </tbody>
														</table>
								   </div>
							</div>	
							<br><br>

							<div class="card bg-light">
							  <div class="card-header" >질문내역 <span style="float:right;font-size:11px"><a href="#">더보기</a></span></div>
							  <div class="card-body">
								<div class="list-group">
									<a href="#" class="list-group-item list-group-item-action"><span class="text-success">[답변대기중]</span> Dapibus ac facilisis in <span style="float:right">2020-07-04</span></a>
									<a href="#" class="list-group-item list-group-item-action"><span class="text-success">[답변대기중]</span> Morbi leo risus <span style="float:right">2020-07-04</span></a>
									<a href="#" class="list-group-item list-group-item-action"><span class="text-primary">[답변완료]</span> Porta ac consectetur ac <span style="float:right">2020-07-04</span></a>
								 </div>
							</div>
							</div>
							<br><br>



			</div>
		</div>
		<div class="spinner-border text-primary displayLoding" role="status"  style="position:fixed;top:50%;left:50%;">
  					<span class="sr-only">Loading...</span>
			</div>
 </main>
<jsp:include page="/bottom.jsp" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="../slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	  $(".regular").slick({
    	        dots: true,
    	        infinite: true,
    	        slidesToShow: 3,
    	        slidesToScroll: 3
    	      });

    });
</script>
<script>
	$(function() {	
		$('#sdate').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		   // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    //endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		   // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		 //   daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		 //   title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		}).on("changeDate", function(e) {
			var d = new Date(e.date);
			var yy = d.getFullYear();
			var mm= d.getMonth() + 1;
			
			if(mm<10){
				mm = "0"+mm;
			}
			var dd = d.getDate();
			if(dd<10){
				dd = "0"+dd;
			}
			//var date = yy+"-"+mm+"-"+dd;
			var sdate = document.getElementById("sdate").value;
       });//datepicker end
		
		$('#edate').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		   // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    //endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		   // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		 //   daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		 //   title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		}).on("changeDate", function(e) {
			var d = new Date(e.date);
			var yy = d.getFullYear();
			var mm= d.getMonth() + 1;
			
			if(mm<10){
				mm = "0"+mm;
			}
			var dd = d.getDate();
			if(dd<10){
				dd = "0"+dd;
			}
			//var date = yy+"-"+mm+"-"+dd;
			var edate = document.getElementById("edate").value;
       });//datepicker end

	});//ready end
	
	function searchPeriod(){
		 var sdate = $("#sdate").val();
		 var edate = $("#edate").val();
		 var date = new Date();
		 var dd = date.getDate();
		 var mm = date.getMonth()+1; 
		 var yyyy = date.getFullYear();
		 if(mm<10){
				mm = "0"+mm;
		}
		if(dd<10){
			dd = "0"+dd;
		}
		 
		 var today = yyyy+"-"+mm+"-"+dd;
		 
		 if(sdate>edate){
			 alert("시작날짜는 마지막 날짜보다 클 수 없습니다.");
		 }else if(today<edate || today<sdate){
			 alert("현재 날짜보다 클 수 없습니다.");
		 } else{
			 $.ajax({
	 			type: "GET", 
	 			processData: false,
	 	        contentType: false,
	 			url: "./Controller.do?command=bookOrderPeriodLoading&sdate="+sdate+"&edate="+edate, 
	 			dataType: 'json',
	             success : function(obj) {
	            	 showinfo(obj); 
	             },
	             beforeSend : function(){
	 				$(".spinner-border").removeClass("displayLoding");
	 			},
	 			complete:function(){
	 				$(".spinner-border").addClass("displayLoding");	
	 			}
	         })
		 }
	
	}
	
	function getOrderBook(cate){
		$.ajax({
			type: "GET", 
			processData: false,
	        contentType: false,
			url: "./Controller.do?command=bookOrderLoading&category="+cate, 
			dataType: 'json',
            success : function(obj) {
               showinfo(obj); 
            },
            beforeSend : function(){
				$(".spinner-border").removeClass("displayLoding");
			},
			complete:function(){
				$(".spinner-border").addClass("displayLoding");	
			}
        })
	}
	
	function showinfo(obj){
		var result = $("#res");
		var img = null;
		html = "";
		if(obj.length == 0){
			html = "<tr><td class='text-center' colspan=5>데이터가 없습니다.</td></tr>";
		}else{
			for(var i in obj) {
    			if(obj[i].book_img==null){
    				img = "default.jpg";
    			}else{
    				img = obj[i].book_img;
    			}
    			html+="<tr>";
				html+="<th class='align-middle'><img src='"+obj[i].book_img+"' alt='...' class='img-thumbnail align-middle' style='width:40px;height:58px'>&nbsp; "+obj[i].book_title+"</th>";
				html+="<td class='text-center align-middle'><span class='badge badge-primary'>정가</span>&nbsp;"+obj[i].price+"/"+obj[i].amount+"</td>";
				html+="<td class='text-center align-middle'>"+obj[i].buy_date+"</td>";
				html+="<td class='text-center align-middle'>"+obj[i].state+"</td>";
				html+="</tr>";
    		
    		} 
		}
		   result.html(html);
	}
</script>
</body>
</html>