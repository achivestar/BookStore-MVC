<%@page import="com.pe.bluering.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO mvo = (MemberVO) request.getAttribute("mvo");
	String phone = mvo.getPhone();
	String phoneData[] = phone.split("-");
	
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bluering Book Store</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/custom.css">
   <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../assets/dist/js/bootstrap.bundle.js"></script>
    <script src="../js/member.js" ></script>
  </head>
  <body>
    <div class="container">
		<jsp:include page="/top.jsp" />
 <main>
 		<div>
 			 <h2>회원수정</h2>    
		<div class="col-lg-12" >
	
		</div>
		<div class="col-lg-12">
			<div class="jumbotron col-md-8" style="padding-top:20px;width:100%;margin:0 auto ">
				<form method="post"  action="./Board.do?command=memberModifyPro" enctype="multipart/form-data" name="joinForm"  id="joinForm" onsubmit="return checkForm()">
	
							<div class=" form-group btn-group col-md-12"  >
								 <div class="input-group mb-2">
						        <div class="input-group-prepend">
						          <div class="input-group-text ">ID</div>
						        </div>
								<input type="text" class="form-control" placeholder="아이디"  name="userID"  id="userID" maxlength="20"  value="<%=mvo.getId() %>"  readonly/>
									<div class="invalid-feedback" >
							     	   영문 또는 숫자의 아이디를 입력해주세요 (5자 이상)  
							      </div>
								</div>
							</div>	

							<div class="form-group btn-group col-md-12"  >
									 <div class="input-group mb-2">
							        <div class="input-group-prepend">
							          <div class="input-group-text ">Pass</div>
							        </div>
								<input type="password" class="form-control" placeholder="비밀번호"  name="userPassword"  id="userPassword"  value="" maxlength="20" />
									<div class="invalid-feedback" >
							     	  	비밀번호를 입력해주세요.
							      </div>
								</div>
							</div>	

							<div class="form-group btn-group col-md-12"  >
								 <div class="input-group mb-2">
							        <div class="input-group-prepend">
							          <div class="input-group-text ">Pass</div>
							        </div>
								<input type="password" class="form-control" placeholder="비밀번호확인"  name="userPassword2"  id="userPassword2" maxlength="20" />
									<div class="invalid-feedback" >
							     	  	비밀번호를 확인해주세요.
							      </div>
								</div>
							</div>	

							<div class="form-group btn-group col-md-12"  >
								 <div class="input-group mb-2">
							        <div class="input-group-prepend">
							          <div class="input-group-text ">Name</div>
							        </div>
								<input type="text" class="form-control" placeholder="이름"  name="userName" id="userName"  value="<%=mvo.getName() %>" maxlength="20" />
									<div class="invalid-feedback" >
							     	  	이름을 입력해 주세요.
							      </div>
								</div>
							</div>	


							<div class="form-group btn-group col-md-12"  >
								<div class="input-group mb-2">
							        <div class="input-group-prepend">
							          <div class="input-group-text ">@mail</div>
							        </div>
								<input type="email" class="form-control" placeholder="이메일"  name="userEmail" maxlength="20"  value="<%=mvo.getEmail()%>"/>
								</div>
							</div>

						<div class="form-group" style="text-align:center">
								<div class="form-group btn-group " data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="man"  <%if(mvo.getGender().equals("man")){%>checked<%} %>>남자
									</label>
									<label class="btn btn-primary ">
										<input type="radio" name="userGender" autocomplete="off" value="female" <%if(mvo.getGender().equals("female")){%>checked<%} %>>여자
									</label>
								</div>
						</div>
						
						     <div class="form-group btn-group col-md-12"  >
								<input type="text"  class="form-control "  name="zipNum" placeholder="우편번호"  value="<%=mvo.getZipnum() %>" readonly>
								<input type="button" class="btn btn-info col-form-label-sm"onclick="openZipSearch()" value="우편번호 찾기"><br>
							</div>
						    <div class="form-group btn-group col-md-12 ">
						    	<input type="text"  name="addr1" class="form-control  col-form-label-sm" id="addr1"  value="<%=mvo.getAddr1() %>" placeholder="도로명주소"  readonly>
						    	<div class="invalid-feedback" >
							     	  	주소를 입력해 주세요.(상세주소가 있을경우 반드시 기입해주세요)
							      </div>
						     </div>	
					       <div class="form-group btn-group col-md-12 ">
					    	<input type="text"  name="addr2" class="form-control col-form-label-sm"  value="<%=mvo.getAddr2() %>" placeholder="상세주소">
					     </div>
					    	
						
					   <div class="form-group btn-group col-md-12" >
							  <input type="text" class="form-control col-form-label-sm"  name="phone1"  id="phone1" value="<%=phoneData[0] %>" placeholder="연락번호" maxlength="4"  />
							-<input type="text" class="form-control col-form-label-sm"  name="phone2"  id="phone2"  value="<%=phoneData[1] %>"maxlength="4"  />
							-<input type="text" class="form-control col-form-label-sm"  name="phone3"  id="phone3"  value="<%=phoneData[2] %>"maxlength="4" />
							<div class="invalid-feedback" >
							     	  	연락처는 세자리 숫자 이상 입력해야 합니다.
							 </div>
					</div>
						<br><br>
						<div class="form-group btn-group col-md-12 custom-file mb-3">
						      <input type="file" class="custom-file-input col-form-label-sm" id="customFile" name="profileImg" accept="images/gif, image/jpg, image/jpeg, image/png">
						      <label class="custom-file-label" for="customFile"><%=mvo.getProfileimg()%></label>
					   </div>
			
					<div class="form-group btn-group col-md-12" >
					        <input type="hidden" name="customFile" value="<%=mvo.getProfileimg()%>" />
							<input type="submit" class="btn btn-primary form-control" value="회원수정"  id="submit" /> 
					</div>
					<br><br>
				</form>
			</div>
				
		</div>
		<div class="col-lg-4">
				
		</div>
	</div>
 </main>
<jsp:include page="/bottom.jsp" />
</body>
</html>
