<%@page import="com.pe.admin.vo.BookVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookVo oneBook =(BookVo) request.getAttribute("oneBook");

	
		String category1 = oneBook.getCategory1();
		String category2 = oneBook.getCategory2();
%>
<script src="../js/bookModify.js"></script>
<div class="container-fluid">
				<div class="row">
				  <div class="col-md-12">
	<form  method="post"  action="./AdminController.do?command=BookUpdateAction" enctype="multipart/form-data" name="bookUpdate"  id="bookUpdate" onsubmit="return checkForm()">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bookName">책 이름</label> 
					<input type="text" class="form-control form-control-sm" id="bookName" name="bookName" value="<%=oneBook.getBookName()%>">
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="bookSubtitle">책 부제</label>
					 <input type="text" class="form-control form-control-sm" id="bookSubtitle" name="bookSubTitle" value="<%=oneBook.getBookSubTitle()%>">
				</div>
				<div class="form-group col-md-6">
					<label for="author">책 저자</label>
					 <input type="text" class="form-control form-control-sm" id="author" name="author" value="<%=oneBook.getAuthor()%>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="publishing">출판사</label> 
					<input type="text" class="form-control form-control-sm" id="publishing" name="publishing" value="<%=oneBook.getPublishing()%>">
				</div>
				<div class="form-group col-md-6">
					<label for="publishDay">출판일자 (ex : 2020-05-05)</label> 
					<input type="text" class="form-control form-control-sm"  id="datepicker" name="publishDay" value="<%=oneBook.getPublishDay()%>">
				</div>
			</div>	
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="cost">원가격</label> 
					<input type="text" class="form-control form-control-sm" id="cost" name="cost"  value="<%=oneBook.getCost()%>" onBlur="numberFormat(this.value)">
				</div>
				<div class="form-group col-md-4">
					<label for="rate">할인율</label> 
					<input type="text" class="form-control form-control-sm" id="rate" name="rate"  value="<%=oneBook.getRate()%>" onBlur="rateCalc(this.value)">
				</div>
				<div class="form-group col-md-4">
					<label for="sellingPrice">판매가격</label> 
					<input type="text"	class="form-control form-control-sm" id="sellingPrice" name="sellingPrice" value="<%=oneBook.getSellingPrice()%>"readonly>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="pageNum">페이지 수</label> 
					<input type="text"	class="form-control form-control-sm"  id="pageNum"  name="pageNum" value="<%=oneBook.getPageNum()%>">
				</div>
				<div class="form-group col-md-4">
					<label for="weight">무게</label> 
					<input type="text"	class="form-control form-control-sm" id="weight" name="weight"  value="<%=oneBook.getWeight()%>">
				</div>
				<div class="form-group col-md-4">
					<label for="size">크기</label> 
					<input type="text" class="form-control form-control-sm" id="size" name="size"  value="<%=oneBook.getSize()%>">
				</div>
			</div>
			<hr/>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="category1">카테고리 [대분류]</label>
					 <select id="category1" class="form-control form-control-sm" name="category1" onchange="categoryChange(this)">
				        <option value="IT모바일" <%if(category1.equals("IT/모바일")){%>selected<%}%>>IT모바일</option>
				        <option value="소설/시/희곡" <%if(category1.equals("소설/시/희곡")){%>selected<%}%>>소설/시/희곡</option>
				        <option value="어린이" <%if(category1.equals("어린이")){%>selected<%}%>>어린이</option>
				        <option value="에세이" <%if(category1.equals("에세이")){%>selected<%}%>>에세이</option>
				        <option value="종교" <%if(category1.equals("종교")){%>selected<%}%>>종교</option>
				      </select>
				</div>
				<div class="form-group col-md-6">
					<label for="category2">카테고리 [소분류]</label> 
					<select id="category2" class="form-control form-control-sm" name="category2">
					        <option value="<%=category2%>"><%=category2%></option>
					  </select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="comment">책 설명</label> 
					<textarea class="form-control form-control-sm" id="comment" rows="10" name="comment"><%=oneBook.getComment() %></textarea>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bookImage">책 이미지</label> <img src="./bookUpload/<%=oneBook.getBookImage()%>" alt="" style="height:160px" class="img-thumbnail">
					<input type="file" class="form-control-file" id="bookImage" name="bookImage" accept="images/gif, image/jpg, image/jpeg, image/png">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="bestProduct">베스트상품</label> <br>
							<input type="radio" name="bestProduct" id="jb-radio-11" value="y" <%if(oneBook.getBestProduct().equals("y")){%>checked="checked" <%} %>> 등록
							<input type="radio" name="bestProduct" id="jb-radio-21" value="n"<%if(oneBook.getBestProduct().equals("n")){%>checked="checked" <%} %>> 해제
				</div>
				<div class="form-group col-md-4">
					 <label for="todayProduct">오늘의상품</label><br>
							<input type="radio" name="todayProduct" id="jb-radio-31" value="y"  <%if(oneBook.getTodayProduct().equals("y")){%>checked="checked" <%} %>> 등록
							<input type="radio" name="todayProduct" id="jb-radio-41" value="n" <%if(oneBook.getTodayProduct().equals("n")){%>checked="checked" <%} %>> 해제
				</div>
				<div class="form-group col-md-4">
					<label for="hiddenProduct">상품매진</label><br>
							<input type="radio" name="hiddenProduct" id="jb-radio-51" value="y" <%if(oneBook.getHiddenProduct().equals("y")){%>checked="checked" <%} %>> 등록
							<input type="radio" name="hiddenProduct" id="jb-radio-61" value="n" <%if(oneBook.getHiddenProduct().equals("n")){%>checked="checked" <%} %>> 해제	
				</div>
			
		</div>
		<br><br>
		<hr>
		<div class="form-group col-md-12 text-center">
			 <input type="hidden" name="customFile" value="<%=oneBook.getBookImage()%>" />
			  <input type="hidden" name="bookId" value="<%=oneBook.getBookId()%>" />
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
		</form>
	</div>
 </div>
</div>


<script>
	$(function() {
	//$('#myModal').modal('show');
	  $( "#datepicker" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  });
	});
	
</script>